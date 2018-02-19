#include <linux/clk.h>
#include "dmaengine.h"
#include <linux/dma-mapping.h>
#include <linux/dmapool.h>
#include <linux/interrupt.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/cpu.h>
#include <linux/of_device.h>
#include <linux/pm_runtime.h>

#define	ACTS_DMA_MAX_NR_CHANNELS 12

#define	ACTS_DMA_IRQPD_0 0x00
#define	ACTS_DMA_IRQPD_1 0x04
#define	ACTS_DMA_IRQPD_2 0x08
#define	ACTS_DMA_IRQPD_3 0x0c
#define	ACTS_DMA_IRQEN_0 0x10
#define	ACTS_DMA_IRQEN_1 0x14
#define	ACTS_DMA_IRQEN_2 0x18
#define	ACTS_DMA_IRQEN_3 0x1c
#define	ACTS_DMA_SECURE_ACCESS_CTL 0x20
#define ACTS_DMA_NIC_QOS 0x24
#define ACTS_DMA_DBG_SEL 0x28
#define ACTS_DMA_IDLE_STAT 0x2c

#define	dma_readl(atdma, name) \
	readl_relaxed((atdma)->regs + ACTS_DMA_##name)

#define	dma_writel(atdma, name, val) \
	writel_relaxed((val), (atdma)->regs + ACTS_DMA_##name)

#define	ACTS_DMA_CH_REGS_BASE 0x100

#define ACTS_DMA_PENDING_MASK(x) (0x1 << (x))

#define ACTS_BTSIZE_MAX	0x8000

#define	ch_regs(x) (ACTS_DMA_CH_REGS_BASE + (x) * 0x100)

#define	ACTS_MODE_OFFSET 0x00
#define	ACTS_SRC_OFFSET	0x04
#define	ACTS_DST_OFFSET	0x08
#define	ACTS_FRAMELEN_OFFSET 0x0C
#define	ACTS_FRAMECNT_OFFSET 0x10
#define	ACTS_REMAIN_FRAME_OFFSET 0x14
#define	ACTS_REMAIN_CNT_OFFSET 0x18
#define	ACTS_SRC_STRIDE_OFFSET 0x1C
#define	ACTS_DST_STRIDE_OFFSET 0x20
#define	ACTS_START_OFFSET 0x24
#define	ACTS_ACP_ATTR_OFFSET 0x28
#define	ACTS_CHAINED_CTL_OFFSET 0x2c
#define	ACTS_CONSTANT_OFFSET 0x30
#define	ACTS_LINKLIST_OFFSET 0x34
#define	ACTS_NEXT_DESC_OFFSET 0x38
#define	ACTS_CUR_DESC_NUM_OFFSET 0x3C
#define	ACTS_INT_CTL_OFFSET 0x40
#define	ACTS_INT_STAT_OFFSET 0x44
#define	ACTS_CUR_SRC_PTR_OFFSET	0x48
#define	ACTS_CUR_DST_PTR_OFFSET	0x4c

#define ACTS_INT_CTL_SECURE_INT	0x00000040
#define ACTS_INT_CTL_ALAINED_INT 0x00000020
#define ACTS_INT_CTL_LAST_FRAME_INT 0x00000010
#define ACTS_INT_CTL_HALF_FRAME_INT 0x00000008
#define ACTS_INT_CTL_END_FRAME_INT 0x00000004
#define ACTS_INT_CTL_SUPERBLOCK_INT 0x00000002
#define ACTS_INT_CTL_END_BLOCK_INT 0x00000001

#define	channel_readl(atchan, name) \
	readl_relaxed((atchan)->ch_regs + ACTS_##name##_OFFSET)

#define	channel_writel(atchan, name, val) \
	writel_relaxed((val), (atchan)->ch_regs + ACTS_##name##_OFFSET)

static unsigned long max_timeout;

struct owl_dma_chan {
	struct dma_chan	chan_common;
	struct owl_dma *device;
	void __iomem *ch_regs;
	u32	mask;
	unsigned long status;
#ifdef COMPLEX_INT
	struct tasklet_struct tasklet;
#endif
	atomic_t channel_pending;
	spinlock_t lock;
	struct dma_slave_config dma_sconfig;
	u32	save_dscr;
	u32	save_mode;
	u32	save_ll;

	// these other elements are all protected by lock
	dma_cookie_t completed_cookie;
	struct list_head active_list;
	struct list_head queue;
	struct list_head free_list;
	unsigned int descs_allocated;
};

struct owl_dma {
	struct dma_device dma_common;
	void __iomem *regs;
	struct clk *clk;
	int irq;

	u32	all_chan_mask;
	u32	id;
#ifndef COMPLEX_INT
	struct tasklet_struct tasklet;
	atomic_t pending;
#endif
	u32	save_nicqos;
	struct dma_pool	*dma_desc_pool;
	/* AT THE END channels table */
	struct owl_dma_chan	chan[0];
};

struct  acts_lli {
	dma_addr_t dscr;
	dma_addr_t	saddr;
	dma_addr_t	daddr;
	u32	ctrla;
	u32	src_stride;
	u32	dst_stride;
	u32	ctrlb;
	u32	ctrlc;
	u32	const_num;
};

struct acts_desc {
	struct acts_lli lli;
	struct list_head tx_list;
	struct dma_async_tx_descriptor txd;
	struct list_head desc_node;
	size_t len;
	u32	mode;
};

struct owl_dma_platform_data {
	unsigned int nr_channels;
	dma_cap_mask_t cap_mask;
};

static void acts_setup_irq(struct owl_dma_chan *atchan, bool on)
{
	int int_ctl;

	int_ctl = ACTS_INT_CTL_SECURE_INT 
		| ACTS_INT_CTL_ALAINED_INT
		| ACTS_INT_CTL_SUPERBLOCK_INT;

	if(on == true)
	{
		channel_writel(atchan, INT_CTL, int_ctl);
	}
	else
	{
		channel_writel(atchan, INT_CTL, 0);
	}

	channel_writel(atchan, INT_STAT, 0xffff);
}

static inline void acts_enable_irq(struct owl_dma_chan *atchan)
{
	acts_setup_irq(atchan, true);
}

static inline void acts_disable_irq(struct owl_dma_chan *atchan)
{
	acts_setup_irq(atchan, false);
}

static struct owl_dma_platform_data owl_dma_platform_data[] = {
	[0] = {
		.nr_channels = 12,
		.cap_mask = {
			.bits = {0x621}
		},
	},
};

static const struct of_device_id owl_dma_of_match[] = {
    {.compatible = "actions,owl-dma", .data = &owl_dma_platform_data[0]},
    {}
};

MODULE_DEVICE_TABLE(of, owl_dma_of_match);

static void owl_dma_on(struct owl_dma *owl_dma, bool on)
{
	if(on == true)
	{
		dma_writel(owl_dma, IRQEN_0, 0xfff);
		dma_writel(owl_dma, IRQEN_1, 0xfff);
		dma_writel(owl_dma, IRQEN_2, 0xfff);
		dma_writel(owl_dma, IRQEN_3, 0xfff);
		dma_writel(owl_dma, NIC_QOS, 0xf0);
	}
	else
	{
		dma_writel(owl_dma, IRQEN_0, 0);
		dma_writel(owl_dma, IRQEN_1, 0);
		dma_writel(owl_dma, IRQEN_2, 0);
		dma_writel(owl_dma, IRQEN_3, 0);
		dma_writel(owl_dma, NIC_QOS, 0);
	}

	dma_writel(owl_dma, IRQPD_0, 0xfff);
	dma_writel(owl_dma, IRQPD_1, 0xfff);
	dma_writel(owl_dma, IRQPD_2, 0xfff);
	dma_writel(owl_dma, IRQPD_3, 0xfff);
}

static irqreturn_t owl_dma_interrupt(int irq, void *dev_id)
{
	return 0;
}

static int __init owl_dma_probe(struct platform_device *pdev)
{
	const struct owl_dma_platform_data *pdata;

	const struct of_device_id *id;

	struct resource *iores;

	struct owl_dma *owl_dma;

	struct owl_dma_chan	*atchan;

	size_t size;

	int irq, err, i;

	max_timeout = 1;

	// get DMA Controller parameters from platform

    id = of_match_device(owl_dma_of_match, &pdev->dev);

    if(id == NULL)
    {
        printk(KERN_WARNING "owl dma id is null\n");
        return -EINVAL;
    }

    pdata = id->data;

	if(!pdata || pdata->nr_channels > ACTS_DMA_MAX_NR_CHANNELS)
    {
        printk(KERN_WARNING "owl dma pdata error\n");
		return -EINVAL;
	}

    iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);

    if(iores == NULL)
    {
        printk(KERN_WARNING "owl dma iores is null\n");
        return -EINVAL;
    }

    irq = platform_get_irq(pdev, 0);

    if(irq < 0)
    {
        printk(KERN_WARNING "owl dma irq get failed\n");
        return irq;
    }

	size = sizeof(struct owl_dma);

	size += pdata->nr_channels * sizeof(struct owl_dma_chan);

	owl_dma = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);

	if(!owl_dma)
	{
		return -ENOMEM;
	}

	// discover transaction capabilites from the platform data

	owl_dma->dma_common.cap_mask = pdata->cap_mask;

	owl_dma->all_chan_mask = (1 << pdata->nr_channels) - 1;

	owl_dma->id = pdev->id;

    iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);

    if(iores == NULL)
    {
        printk(KERN_WARNING "owl dma iores is null\n");
        return -EINVAL;
    }

    owl_dma->regs = devm_ioremap_resource(&pdev->dev, iores);

    if (IS_ERR(owl_dma->regs))
    {
        printk(KERN_WARNING "owl dma iobase remap failed\n");

        return PTR_ERR(owl_dma->regs);
    }

	pm_runtime_enable(&pdev->dev);

	pm_runtime_get_sync(&pdev->dev);

	// force dma off, just in case

	owl_dma_on(owl_dma, false);

	err = request_irq(irq, owl_dma_interrupt, 0, "owl_dma0", owl_dma);

	if(err)
	{
		goto err_irq;
	}

	err = request_irq(irq + 1, owl_dma_interrupt, 0, "owl_dma1", owl_dma);

	if(err)
	{
		goto err_irq;
	}

	err = request_irq(irq + 2, owl_dma_interrupt, 0, "owl_dma2", owl_dma);

	if(err)
	{
		goto err_irq;
	}

	err = request_irq(irq + 3, owl_dma_interrupt, 0, "owl_dma3", owl_dma);

	if(err)
	{
		goto err_irq;
	}

	owl_dma->irq = irq;

	platform_set_drvdata(pdev, owl_dma);

	// create a pool of consistent memory blocks for hardware descriptors

	owl_dma->dma_desc_pool = dma_pool_create("acts_dma_desc_pool",
		&pdev->dev, sizeof(struct acts_desc), 4, 0);

	if(!owl_dma->dma_desc_pool)
	{
		dev_err(&pdev->dev, "No memory for descriptors dma pool\n");
		err = -ENOMEM;

		goto err_pool_create;
	}

	// clear any pending interrupt

	// initialize channels related values

	INIT_LIST_HEAD(&owl_dma->dma_common.channels);

	for(i = 0; i < pdata->nr_channels;
		i++, owl_dma->dma_common.chancnt++)
	{
		atchan = &owl_dma->chan[i];

		atchan->chan_common.device = &owl_dma->dma_common;

		dma_cookie_init(&atchan->chan_common);

		atchan->chan_common.chan_id = i;

		list_add_tail(&atchan->chan_common.device_node,
			&owl_dma->dma_common.channels);

		atchan->ch_regs = owl_dma->regs + ch_regs(i);

		spin_lock_init(&atchan->lock);

		atchan->mask = 1 << i;

		INIT_LIST_HEAD(&atchan->active_list);
		INIT_LIST_HEAD(&atchan->queue);
		INIT_LIST_HEAD(&atchan->free_list);

		acts_enable_irq(atchan);
	}

	//tasklet_init(&owl_dma->tasklet, acts_tasklet, (unsigned long)owl_dma);

	// set base routines
	//owl_dma->dma_common.device_alloc_chan_resources = acts_alloc_chan_resources;
	//owl_dma->dma_common.device_free_chan_resources = acts_free_chan_resources;
	//owl_dma->dma_common.device_tx_status = acts_tx_status;
	//owl_dma->dma_common.device_issue_pending = acts_issue_pending;
	owl_dma->dma_common.dev = &pdev->dev;

	// set prep routines based on capability
	if(dma_has_cap(DMA_MEMCPY, owl_dma->dma_common.cap_mask))
	{
		//owl_dma->dma_common.device_prep_dma_memcpy = acts_prep_dma_memcpy;
	}

	if(dma_has_cap(DMA_SLAVE, owl_dma->dma_common.cap_mask))
	{
		//owl_dma->dma_common.device_prep_slave_sg = acts_prep_slave_sg;

		dma_cap_set(DMA_CYCLIC, owl_dma->dma_common.cap_mask);

		//owl_dma->dma_common.device_prep_dma_cyclic = acts_prep_dma_cyclic;

		//owl_dma->dma_common.device_control = acts_control;
	}
	if(dma_has_cap(DMA_MEMSET, owl_dma->dma_common.cap_mask))
	{
		//owl_dma->dma_common.device_prep_dma_memset = acts_prep_dma_memset;
	}

	owl_dma_on(owl_dma, true); // enable dma

	dev_info(&pdev->dev,
		"actions AHB DMA Controller ( %s%s%s), %d channels\n",
		dma_has_cap(DMA_MEMCPY,
			owl_dma->dma_common.cap_mask) ? "cpy " : "",
		dma_has_cap(DMA_SLAVE,
			owl_dma->dma_common.cap_mask)  ? "slave " : "",
		dma_has_cap(DMA_MEMSET,
			owl_dma->dma_common.cap_mask)  ? "memset " : "",
		owl_dma->dma_common.chancnt);

	dma_async_device_register(&owl_dma->dma_common);

	return 0;

err_pool_create:
	platform_set_drvdata(pdev, NULL);
	free_irq(platform_get_irq(pdev, 0), owl_dma);

err_irq:
	pm_runtime_put_sync(&pdev->dev);
	pm_runtime_disable(&pdev->dev);

	return err;
}

static int __exit owl_dma_remove(struct platform_device *pdev)
{
	return 0;
}

static int owl_dma_suspend_noirq(struct device *dev)
{
	//pm_runtime_put_sync(dev);
	//pm_runtime_disable(dev);
	return 0;
}

static int owl_dma_resume_noirq(struct device *dev)
{
	//pm_runtime_enable(dev);
	//pm_runtime_get_sync(dev);
	return 0;
}

static const struct dev_pm_ops owl_dma_dev_pm_ops = {
	.suspend_noirq = owl_dma_suspend_noirq,
	.resume_noirq = owl_dma_resume_noirq,
};

static struct platform_driver owl_dma_driver = {
    .driver = {
        .name = "owl_dma",
		.pm	= &owl_dma_dev_pm_ops,
        .owner = THIS_MODULE,
        .of_match_table = owl_dma_of_match,
    },
    .probe = owl_dma_probe,
    .remove = __exit_p(owl_dma_remove),
};

static int __init owl_dma_init(void)
{
	int err;
    
    err = platform_driver_register(&owl_dma_driver);

    if(err != 0)
	{
        printk(KERN_WARNING "register owl dma platform driver error!\n");
        return err;
    } 

	return err;
}
subsys_initcall(owl_dma_init);

static void __exit owl_dma_exit(void)
{
    platform_driver_unregister(&owl_dma_driver);
}

module_exit(owl_dma_exit);

MODULE_LICENSE("GPL");

