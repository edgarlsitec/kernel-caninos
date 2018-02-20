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

#define STOP_TIMEOUT 200000

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

#define ACTS_MODE_BUS_WIDTH	0x10000000

#define	dma_readl(atdma, name) \
	readl_relaxed((atdma)->regs + ACTS_DMA_##name)

#define	dma_writel(atdma, name, val) \
	writel_relaxed((val), (atdma)->regs + ACTS_DMA_##name)

#define	ACTS_DMA_CH_REGS_BASE 0x100

#define ACTS_DMA_PENDING_MASK(x) (0x1 << (x))

#define ACTS_BTSIZE_MAX	0x8000

#define ACTS_SRAM_ADDR(x) (((x) & 0xfffe0000) == 0xb4060000)

#define ACTS_SRAM_SIZE 0x10000

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

#define ACTS_CHAINED_CTRLB 0x80000000
#define ACTS_LINKLIST_CTRLB	0x40000000
#define ACTS_CONSTFILL_CTRLB 0x20000000
#define ACTS_SRC_ADDR_MODE_INCR 0x00100000
#define ACTS_SRC_ADDR_MODE_STRIDE 0x00200000
#define ACTS_DST_ADDR_MODE_INCR	0x00400000
#define ACTS_DST_ADDR_MODE_STRIDE 0x00800000
#define ACTS_FC_MEM2MEM	0x00050000

#define ACTS_LINKLIST_SRC_DST_VLD	0x500
#define ACTS_LINKLIST_SRC_CONST	0x00000080
#define ACTS_LINKLIST_SRC_VLD 0x00000040
#define ACTS_LINKLIST_DST_VLD 0x00000100
#define ACTS_LINKLIST_DST_CONST 0x00000200
#define ACTS_LINKLIST_DIS_TYPE1 0x00000001
#define ACTS_LINKLIST_DIS_TYPE2 0x00000002

#define ACTS_INT_STATUS_SECURE_ERROR 0x00000040
#define ACTS_INT_STATUS_ALAINED_ERROR 0x00000020
#define ACTS_INT_STATUS_LAST_FRAME 0x00000010
#define ACTS_INT_STATUS_HALF_FRAME 0x00000008
#define ACTS_INT_STATUS_END_FRAME 0x00000004
#define ACTS_INT_STATUS_SUPERBLOCK 0x00000002
#define ACTS_INT_STATUS_END_BLOCK_INT 0x00000001

#define ACTS_DMAINTCTL(x) (((x) << 18) & 0x1fc0000)
#define ACTS_ACPCTL_1(x) (((x) << 13)  & 0x3e000)
#define ACTS_ACPCTL_2(x) ((x) & 0x1f00)
#define ACTS_ACPCTL_3(x) (((x) >> 12) & 0xf0)
#define ACTS_ACPCTL_4(x) (((x) >> 24) & 0xf)

#define ACTS_DMAMODE_1(x) ((x) & 0xF0000000)
#define ACTS_DMAMODE_2(x) (((x) << 4) & 0xf000000)
#define ACTS_DMAMODE_3(x) (((x) << 4) & 0x0f00000)
#define ACTS_DMAMODE_4(x) (((x) << 8) & 0xf0000)
#define ACTS_DMAMODE_5(x) (((x) << 10) & 0xfc00)

#define PAUSE_CHANNEL 0x80000000
#define ACTS_SRC_DST_STRIDE	0xa0000

#define ACTS_FRAMECNT(x) (((x) << 20) & 0xfff00000)

#define	channel_readl(atchan, name) \
	readl_relaxed((atchan)->ch_regs + ACTS_##name##_OFFSET)

#define	channel_writel(atchan, name, val) \
	writel_relaxed((val), (atchan)->ch_regs + ACTS_##name##_OFFSET)
	
enum acts_status {
	ACTS_IS_ERROR = 0,
	ACTS_IS_PAUSED = (1 << 1),
	ACTS_IS_CYCLIC = (1 << 2),
	ACTS_IS_INTERRUPT = (1 << 4),
};

enum src_srcmode {
	SRC_CONSTANT = 0x0,
	SRC_INCR = (0x1 << 16),
	SRC_STRIDE = (0x2 << 16),
};

enum dst_dstmode {
	DST_CONSTANT = 0x0,
	DST_INCR = (0x1 << 18),
	DST_STRIDE = (0x2 << 18),
};

enum dst_type {
	DST_DEV = 0x0,
	DST_ACP = (0x1 << 10),
	DST_DCU = (0x2 << 10),
	DST_SRAM = (0x3 << 10),
};

enum src_type {
	SRC_DEV = 0x0,
	SRC_ACP = (0x1 << 8),
	SRC_DCU = (0x2 << 8),
	SRC_SRAM = (0x3 << 8),
};

static unsigned long max_timeout;

static unsigned int init_nr_desc_per_channel = 64;

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

	// AT THE END channels table

	struct owl_dma_chan	chan[0];
};

struct acts_lli {
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

enum owl_trans_type {
	MEMCPY = 0,
	SLAVE  = 1,
	MEMSET = 2,
	ACP    = 4,
	CHAINED = 8,
};

struct owl_dma_slave {
	struct device *dma_dev;
	enum owl_trans_type trans_type;
	u32	mode;
	u32	frame_len;
	u32	frame_cnt;
	u32	src_stride;
	u32	dst_stride;
	u32	acp_attr;
	u32	chained_ctl;
	u32	intctl;
	u32	secure_ctl;
	u32	nic_qos;
};

struct owl_dma_platform_data {
	unsigned int nr_channels;
	dma_cap_mask_t cap_mask;
};

static inline struct owl_dma_chan *to_owl_dma_chan(struct dma_chan *dchan)
{
	return container_of(dchan, struct owl_dma_chan, chan_common);
}

static inline struct owl_dma *to_owl_dma(struct dma_device *ddev)
{
	return container_of(ddev, struct owl_dma, dma_common);
}

static inline struct acts_desc *txd_to_acts_desc(struct dma_async_tx_descriptor *txd)
{
	return container_of(txd, struct acts_desc, txd);
}

static inline int acts_chan_is_cyclic(struct owl_dma_chan *atchan)
{
	return test_bit(ACTS_IS_CYCLIC, &atchan->status);
}

static struct device *chan2dev(struct dma_chan *chan)
{
	return &chan->dev->device;
}

static void set_desc_eol(struct acts_desc *desc)
{
	desc->lli.dscr = 0;
	
	desc->lli.ctrlb &= ~ACTS_LINKLIST_CTRLB;
}

static int vdbg_dump_regs(struct owl_dma_chan *atchan)
{
	struct owl_dma *atdma = to_owl_dma(atchan->chan_common.device);

	dev_err(chan2dev(&atchan->chan_common),
		"  channel %d : irqpd = 0x%x, irqen = 0x%x, dbg_sel:0x%x"
		"  idle stat:0x%x\n",
		atchan->chan_common.chan_id,
		dma_readl(atdma, IRQPD_0),
		dma_readl(atdma, IRQEN_0),
		dma_readl(atdma, DBG_SEL),
		dma_readl(atdma, IDLE_STAT));

	dev_err(chan2dev(&atchan->chan_common),
		"  channel: s0x%x d0x%x mode0x%x:0x%x next_des0x%x framelen0x%x intctl0x%x intstat0x%x\n",
		channel_readl(atchan, SRC),
		channel_readl(atchan, DST),
		channel_readl(atchan, MODE),
		channel_readl(atchan, LINKLIST),
		channel_readl(atchan, NEXT_DESC),
		channel_readl(atchan, FRAMELEN),
		channel_readl(atchan, INT_CTL),
		channel_readl(atchan, INT_STAT));
	dev_err(chan2dev(&atchan->chan_common),
		"  channel: framecnt0x%x desc num0x%x cur sptr0x%x cur dptr0x%x remaincnt0x%x remainframe0x%x\n"
		" start:0x%x\n",
		channel_readl(atchan, FRAMECNT),
		channel_readl(atchan, CUR_DESC_NUM),
		channel_readl(atchan, CUR_SRC_PTR),
		channel_readl(atchan, CUR_DST_PTR),
		channel_readl(atchan, REMAIN_CNT),
		channel_readl(atchan, REMAIN_FRAME),
		channel_readl(atchan, START));
	
	return 0;
}

static void acts_dump_lli(struct owl_dma_chan *atchan, struct acts_lli *lli)
{
	dev_printk(KERN_CRIT, chan2dev(&atchan->chan_common),
		"  desc: s0x%x d0x%x ctrl0x%x:0x%x ctrlc0x%x l0x%x\n",
		lli->saddr, lli->daddr,
		lli->ctrla, lli->ctrlb, lli->ctrlc, lli->dscr);
}

static inline int acts_chan_is_enabled(struct owl_dma_chan *atchan)
{
	struct owl_dma *asoc_dma = to_owl_dma(atchan->chan_common.device);
	
	struct dma_chan *chan = &atchan->chan_common;
	
	unsigned long id = chan->chan_id;
	
	unsigned int idle, pause;

	idle = dma_readl(asoc_dma, IDLE_STAT);
	
	idle = idle & (0x1 << id);
	
	pause = dma_readl(asoc_dma, DBG_SEL);
	
	pause = pause & (0x1 << (id + 16));

	if(idle && !pause)
	{
		return 0;
	}	
	else
	{
		return 1;
	}
}

static inline int acts_chan_is_enabled_dump(struct owl_dma_chan *atchan)
{
	struct owl_dma *atdma = to_owl_dma(atchan->chan_common.device);

	if(acts_chan_is_enabled(atchan))
	{
		dev_err(chan2dev(&atchan->chan_common),
				"  channel %d : dbg_sel:0x%x idle stat:0x%x\n",
				atchan->chan_common.chan_id,
				dma_readl(atdma, DBG_SEL),
				dma_readl(atdma, IDLE_STAT));

		dev_err(chan2dev(&atchan->chan_common),
				"  channel: s0x%x d0x%x mode:0x%x frame_len:0x%x frame_cnt0x%x\n",
				channel_readl(atchan, SRC),
				channel_readl(atchan, DST),
				channel_readl(atchan, MODE),
				channel_readl(atchan, FRAMELEN),
				channel_readl(atchan, FRAMECNT));

		dev_err(chan2dev(&atchan->chan_common),
				"  channel: acp:0x%x,chain ctl:0x%x,llist:0x%x,int_ctl:0x%x,int_stat:0x%x\n",
				channel_readl(atchan, ACP_ATTR),
				channel_readl(atchan, CHAINED_CTL),
				channel_readl(atchan, LINKLIST),
				channel_readl(atchan, INT_CTL),
				channel_readl(atchan, INT_STAT));

		return 1;
	}
	else
	{
		return 0;
	}
}

static inline int acts_chan_is_paused(struct owl_dma_chan *atchan)
{
	return test_bit(ACTS_IS_PAUSED, &atchan->status);
}

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

static void acts_dostart(struct owl_dma_chan *atchan, struct acts_desc *first)
{
	u32	int_ctl;

	if(acts_chan_is_enabled_dump(atchan))
	{
		dev_err(chan2dev(&atchan->chan_common), "BUG: Attempted to start non-idle channel!\n");

		return;
	}

	int_ctl = ACTS_INT_CTL_SUPERBLOCK_INT | ACTS_INT_STATUS_SECURE_ERROR | ACTS_INT_STATUS_ALAINED_ERROR;

	if(acts_chan_is_cyclic(atchan))
	{
		int_ctl |= ACTS_INT_STATUS_END_BLOCK_INT;
	}

	channel_writel(atchan, MODE, first->mode);

	channel_writel(atchan, LINKLIST, ACTS_LINKLIST_SRC_DST_VLD);

	channel_writel(atchan, NEXT_DESC, first->txd.phys);

	channel_writel(atchan, INT_CTL, int_ctl);

	channel_writel(atchan, INT_STAT, 0x7f);

	channel_writel(atchan, START, 0x1);
}

static dma_cookie_t acts_tx_submit(struct dma_async_tx_descriptor *tx)
{
	struct acts_desc *desc = txd_to_acts_desc(tx);

	struct owl_dma_chan	*atchan = to_owl_dma_chan(tx->chan);

	dma_cookie_t cookie;

	unsigned long flags;

	spin_lock_irqsave(&atchan->lock, flags);

	cookie = dma_cookie_assign(tx);

	if(list_empty(&atchan->active_list))
	{
		dev_vdbg(chan2dev(tx->chan), "tx_submit: started %u\n", desc->txd.cookie);

		acts_dostart(atchan, desc);

		list_add_tail(&desc->desc_node, &atchan->active_list);
	}
	else
	{
		dev_vdbg(chan2dev(tx->chan), "tx_submit: queued %u\n", desc->txd.cookie);

		list_add_tail(&desc->desc_node, &atchan->queue);
	}

	spin_unlock_irqrestore(&atchan->lock, flags);

	return cookie;
}

static struct acts_desc *acts_alloc_descriptor(struct dma_chan *chan, gfp_t gfp_flags)
{
	struct acts_desc *desc = NULL;

	struct owl_dma	*owl_dma = to_owl_dma(chan->device);

	dma_addr_t phys;

	desc = dma_pool_alloc(owl_dma->dma_desc_pool, gfp_flags, &phys);

	if(desc)
	{
		memset(desc, 0, sizeof(struct acts_desc));

		INIT_LIST_HEAD(&desc->tx_list);

		dma_async_tx_descriptor_init(&desc->txd, chan);

		desc->txd.flags = DMA_CTRL_ACK;

		desc->txd.tx_submit = acts_tx_submit;

		desc->txd.phys = phys;
	}

	return desc;
}

static inline int owl_dma_dump_all(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	vdbg_dump_regs(atchan);
	
	return 0;
}

static irqreturn_t owl_dma_interrupt(int irq, void *dev_id)
{
	struct owl_dma *owl_dma = (struct owl_dma *)dev_id;

	struct owl_dma_chan	*atchan;

	int	i;

	u32	status, imr, pending, p0, p1, p2, p3;

	u32	int_ctl, int_status, channel_pending;

	int	ret = IRQ_NONE;

	imr = dma_readl(owl_dma, IRQEN_0);

	status = dma_readl(owl_dma, IRQPD_0);

	p0 = status  & imr;

	imr = dma_readl(owl_dma, IRQEN_1);

	status = dma_readl(owl_dma, IRQPD_1);

	p1 = status  & imr;

	imr = dma_readl(owl_dma, IRQEN_2);

	status = dma_readl(owl_dma, IRQPD_2);

	p2 = status  & imr;

	imr = dma_readl(owl_dma, IRQEN_3);

	status = dma_readl(owl_dma, IRQPD_3);

	p3 = status  & imr;

	pending = p0 | p1 | p2 | p3;

	dev_vdbg(owl_dma->dma_common.dev, "interrupt: pending =  0x%08x\n", pending);

	pending &= 0x0fff;

	if(pending)
	{
		for(i = 0; i < owl_dma->dma_common.chancnt; i++)
		{
			atchan = &owl_dma->chan[i];

			if(pending & ACTS_DMA_PENDING_MASK(i))
			{
				spin_lock(&atchan->lock);

				int_ctl = channel_readl(atchan, INT_CTL);

				int_status = channel_readl(atchan, INT_STAT);

				// clear pending bits ASAP

				channel_writel(atchan, INT_STAT, 0x7f);

				dma_writel(owl_dma, IRQPD_0, (1 << i));

				dma_writel(owl_dma, IRQPD_1, (1 << i));

				dma_writel(owl_dma, IRQPD_2, (1 << i));

				dma_writel(owl_dma, IRQPD_3, (1 << i));

				spin_unlock(&atchan->lock);

				channel_pending = int_ctl & int_status;

				if(channel_pending & 0x60)
				{
					set_bit(ACTS_IS_ERROR, &atchan->status);

					pr_err("dma%d transfer error", atchan->chan_common.chan_id);

					owl_dma_dump_all(&atchan->chan_common);
				}
				else if (channel_pending & 0x1f)
				{
					set_bit(ACTS_IS_INTERRUPT, &atchan->status);
				}
			}
		}

		tasklet_schedule(&owl_dma->tasklet);

		ret = IRQ_HANDLED;
	}
	return ret;
}

static struct acts_desc *acts_first_active(struct owl_dma_chan *atchan)
{
	return list_first_entry(&atchan->active_list, struct acts_desc, desc_node);
}

static struct acts_desc *acts_first_queued(struct owl_dma_chan *atchan)
{
	return list_first_entry(&atchan->queue, struct acts_desc, desc_node);
}

static void acts_chain_complete(struct owl_dma_chan *atchan, struct acts_desc *desc)
{
	dma_async_tx_callback callback;

	void *param;

	struct dma_async_tx_descriptor *txd = &desc->txd;

	dev_vdbg(chan2dev(&atchan->chan_common), "descriptor %u complete\n", txd->cookie);

	if(!acts_chan_is_cyclic(atchan))
	{
		dma_cookie_complete(txd);
	}

	callback = txd->callback;

	param = txd->callback_param;

	// move children to free_list

	list_splice_init(&desc->tx_list, &atchan->free_list);

	// move myself to free_list

	list_move(&desc->desc_node, &atchan->free_list);

	// unmap dma addresses

	dma_descriptor_unmap(txd);

	// The API requires that no submissions are done from a
	// callback, so we don't need to drop the lock here

	if(!acts_chan_is_cyclic(atchan))
	{
		callback = txd->callback;

		param = txd->callback_param;

		// The API requires that no submissions are done from a
		// callback, so we don't need to drop the lock here

		if(callback)
		{
			callback(param);
		}
	}

	dma_run_dependencies(txd);
}

static void acts_handle_error(struct owl_dma_chan *atchan)
{
	struct acts_desc *bad_desc;
	struct acts_desc *child;

	bad_desc = acts_first_active(atchan);

	list_del_init(&bad_desc->desc_node);

	list_splice_init(&atchan->queue, atchan->active_list.prev);

	if(!list_empty(&atchan->active_list))
	{
		acts_dostart(atchan, acts_first_active(atchan));
	}

	dev_crit(chan2dev(&atchan->chan_common), "Bad descriptor submitted for DMA!\n");

	dev_crit(chan2dev(&atchan->chan_common), "  cookie: %d\n", bad_desc->txd.cookie);

	acts_dump_lli(atchan, &bad_desc->lli);

	list_for_each_entry(child, &bad_desc->tx_list, desc_node)
	{
		acts_dump_lli(atchan, &child->lli);
	}

	acts_chain_complete(atchan, bad_desc);
}

static int acts_alloc_chan_resources(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	struct owl_dma *owl_dma = to_owl_dma(chan->device);

	struct acts_desc *desc;

	struct owl_dma_slave *atslave;

	int	i;

	unsigned long flags;

	u32	cfg;

	LIST_HEAD(tmp_list);

	dev_vdbg(chan2dev(chan), "alloc_chan_resources\n");

	// ASSERT: channel is idle

	if(acts_chan_is_enabled(atchan))
	{
		dev_dbg(chan2dev(chan), "DMA channel not idle ?\n");
		return -EIO;
	}

	atslave = chan->private;

	if(atslave)
	{
		// We need controller-specific data to set up slave
		// transfers.

		BUG_ON(!atslave->dma_dev || atslave->dma_dev != owl_dma->dma_common.dev);

		// if cfg configuration specified take it instad of default

		if(atslave->mode)
		{
			cfg = atslave->mode;
		}
	}

	// have we already been set up?
	// reconfigure channel but no need to reallocate descriptors

	if(!list_empty(&atchan->free_list))
	{
		return atchan->descs_allocated;
	}

	// Allocate initial pool of descriptors

	for(i = 0; i < init_nr_desc_per_channel; i++)
	{
		desc = acts_alloc_descriptor(chan, GFP_KERNEL);

		if(!desc)
		{
			dev_err(owl_dma->dma_common.dev, "Only %d initial descriptors\n", i);
			break;
		}

		list_add_tail(&desc->desc_node, &tmp_list);
	}

	spin_lock_irqsave(&atchan->lock, flags);

	atchan->descs_allocated = i;

	list_splice(&tmp_list, &atchan->free_list);

	dma_cookie_init(chan);

	// avoid dev to dev 

	channel_writel(atchan, MODE, 0x50a00);

	spin_unlock_irqrestore(&atchan->lock, flags);

	// channel parameters

	dev_dbg(chan2dev(chan), "alloc_chan_resources: allocated %d descriptors\n",
		atchan->descs_allocated);

	return atchan->descs_allocated;
}

static void acts_free_chan_resources(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	struct owl_dma *owl_dma = to_owl_dma(chan->device);

	struct acts_desc *desc, *_desc;

	LIST_HEAD(list);

	dev_dbg(chan2dev(chan), "free_chan_resources: (descs allocated=%u)\n",
		atchan->descs_allocated);

	if(!list_empty(&atchan->active_list))
	{
		pr_err("dma:%d free the dirty channel\n", chan->chan_id);
	}

	BUG_ON(acts_chan_is_enabled_dump(atchan));
	BUG_ON(!list_empty(&atchan->active_list));
	BUG_ON(!list_empty(&atchan->queue));

	list_for_each_entry_safe(desc, _desc, &atchan->free_list, desc_node)
	{
		dev_vdbg(chan2dev(chan), "  freeing descriptor %p\n", desc);

		list_del(&desc->desc_node);

		dma_pool_free(owl_dma->dma_desc_pool, desc, desc->txd.phys);
	}

	chan->private = NULL;

	list_splice_init(&atchan->free_list, &list);

	atchan->descs_allocated = 0;

	dev_vdbg(chan2dev(chan), "free_chan_resources: done\n");
}

static void acts_cleanup_descriptors(struct owl_dma_chan *atchan)
{
	dev_err(chan2dev(&atchan->chan_common), "cleanup descriptors\n");
	return;
}

static enum dma_status acts_tx_status(struct dma_chan *chan,
	dma_cookie_t cookie, struct dma_tx_state *txstate)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	dma_cookie_t last_used, last_complete;

	unsigned long flags;

	enum dma_status ret;

	spin_lock_irqsave(&atchan->lock, flags);

	ret = dma_cookie_status(chan, cookie, txstate);

	if(ret != DMA_COMPLETE)
	{
		acts_cleanup_descriptors(atchan);

		ret = dma_cookie_status(chan, cookie, txstate);
	}

	last_complete = chan->completed_cookie;

	last_used = chan->cookie;

	spin_unlock_irqrestore(&atchan->lock, flags);

	if(ret != DMA_COMPLETE)
	{
		dma_set_residue(txstate, acts_first_active(atchan)->len);
	}

	if(acts_chan_is_paused(atchan))
	{
		ret = DMA_PAUSED;
	}

	dev_vdbg(chan2dev(chan), "tx_status: %d (d%d, u%d)\n",
		cookie, last_complete ? last_complete : 0,
		last_used ? last_used : 0);

	return ret;
}

static struct acts_desc *acts_desc_get(struct owl_dma_chan *atchan)
{
	struct acts_desc *desc, *_desc;
	
	struct acts_desc *ret = NULL;
	
	unsigned int i = 0;
	
	LIST_HEAD(tmp_list);
	
	unsigned long flags;

	spin_lock_irqsave(&atchan->lock, flags);
	
	list_for_each_entry_safe(desc, _desc, &atchan->free_list, desc_node)
	{
		i++;
		
		if(async_tx_test_ack(&desc->txd))
		{
			list_del(&desc->desc_node);
			ret = desc;
			break;
		}
		dev_dbg(chan2dev(&atchan->chan_common), "desc %p not ACKed\n", desc);
	}
	
	spin_unlock_irqrestore(&atchan->lock, flags);
	
	dev_vdbg(chan2dev(&atchan->chan_common), "scanned %u descriptors on freelist\n", i);

	// no more descriptor available in initial pool: create one more
	
	if (!ret)
	{
		ret = acts_alloc_descriptor(&atchan->chan_common, GFP_ATOMIC);
		
		if(ret)
		{
			spin_lock_irqsave(&atchan->lock, flags);
			
			atchan->descs_allocated++;
			
			spin_unlock_irqrestore(&atchan->lock, flags);
		}
		else
		{
			dev_err(chan2dev(&atchan->chan_common), "not enough descriptors available\n");
		}
	}
	return ret;
}

static int owl_dma_cyclic_check_values(unsigned int reg_width, dma_addr_t buf_addr,
		size_t period_len, enum dma_transfer_direction direction)
{
	if(period_len > (ACTS_BTSIZE_MAX << reg_width))
	{
		goto err_out;
	}

	if(unlikely(period_len & ((1 << reg_width) - 1)))
	{
		goto err_out;
	}

	if(unlikely(buf_addr & ((1 << reg_width) - 1)))
	{
		goto err_out;
	}

	if(unlikely(!(direction & (DMA_DEV_TO_MEM | DMA_MEM_TO_DEV))))
	{
		goto err_out;
	}

	return 0;

err_out:
	return -EINVAL;
}

static void acts_desc_put(struct owl_dma_chan *atchan, struct acts_desc *desc)
{
	unsigned long flags;
	
	if(desc)
	{
		spin_lock_irqsave(&atchan->lock, flags);
		
		list_splice_init(&desc->tx_list, &atchan->free_list);
		
		list_add(&desc->desc_node, &atchan->free_list);
		
		spin_unlock_irqrestore(&atchan->lock, flags);
	}
}

static void acts_set_ctrl(struct dma_chan *chan, struct acts_desc *desc,
		struct owl_dma_slave *atslave, u32 mode, u32 ctrlb)
{
	unsigned long acp;
	
	u32	int_ctl;
	
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	acp  = atslave->trans_type >> 2;
	
	if((mode & ACTS_SRC_DST_STRIDE) == 0)
	{
		// frame cnt
		desc->lli.ctrla |= ACTS_FRAMECNT(0x1);
		desc->lli.src_stride = 0;
		desc->lli.dst_stride = 0;
	}
	else if ((mode & ACTS_SRC_DST_STRIDE) == ACTS_DST_ADDR_MODE_STRIDE) {
		// frame cnt
		desc->lli.ctrla |= ACTS_FRAMECNT(atslave->frame_cnt);
		desc->lli.src_stride = 0;
		desc->lli.dst_stride = atslave->dst_stride;
	}
	else if ((mode & ACTS_SRC_DST_STRIDE) == ACTS_SRC_ADDR_MODE_STRIDE) {
		// frame cnt
		desc->lli.ctrla |=  ACTS_FRAMECNT(atslave->frame_cnt);
		desc->lli.src_stride = atslave->src_stride;
		desc->lli.dst_stride = 0;
	}

	desc->lli.ctrlb = 0;
	desc->lli.ctrlb |= ctrlb;
	desc->lli.ctrlb |= (ACTS_LINKLIST_SRC_VLD | ACTS_LINKLIST_DST_VLD);

	int_ctl = ACTS_INT_CTL_SECURE_INT | ACTS_INT_CTL_SUPERBLOCK_INT | ACTS_INT_CTL_ALAINED_INT;
	
	if(acts_chan_is_cyclic(atchan))
	{
		int_ctl |= ACTS_INT_STATUS_END_BLOCK_INT;
	}

	desc->lli.ctrlc = ACTS_DMAINTCTL(int_ctl);
	
	if(acp)
	{
		desc->lli.ctrlc |=  ACTS_DMAINTCTL(atslave->intctl)
			| ACTS_ACPCTL_1(atslave->acp_attr)
			| ACTS_ACPCTL_2(atslave->acp_attr)
			| ACTS_ACPCTL_3(atslave->acp_attr)
			| ACTS_ACPCTL_4(atslave->acp_attr);
	 }
	 else
	 {
		desc->lli.ctrlb |= ACTS_LINKLIST_DIS_TYPE1;
	}

	dev_vdbg(chan2dev(chan),
		"desrricptor: d0x%x s0x%x ctrla0x%x ctrlb0x%x ctrlc0x%x\n",
		desc->lli.daddr, desc->lli.saddr, desc->lli.ctrla,
		desc->lli.ctrlb, desc->lli.ctrlc);

	dev_vdbg(chan2dev(chan),
		"desrricptor: dtr0x%x str0x%x num0x%x next0x%x\n",
		desc->lli.dst_stride, desc->lli.src_stride, desc->lli.const_num,
		desc->lli.dscr);
}

static void acts_desc_chain(struct dma_chan *chan, struct acts_desc **first,
			struct acts_desc **prev, struct acts_desc *desc)
{
	if (!(*first))
	{
		*first = desc;
	}
	else
	{
		// inform the HW lli about chaining

		(*prev)->lli.dscr = desc->txd.phys;

		// insert the link descriptor to the LD ring

		list_add_tail(&desc->desc_node, &(*first)->tx_list);
	}

	*prev = desc;
}

static struct dma_async_tx_descriptor *
	acts_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
	size_t len, unsigned long flags)
{

	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	struct owl_dma_slave *atslave = chan->private;

	struct acts_desc *desc = NULL;

	struct acts_desc *first = NULL;

	struct acts_desc *prev = NULL;

	size_t xfer_count;

	size_t offset;

	unsigned int src_width;

	unsigned int dst_width;

	u32	ctrlb, mode;

	dev_vdbg(chan2dev(chan), "prep_dma_memcpy: d0x%x s0x%x l0x%zx f0x%lx\n",
			dest, src, len, flags);

	if(unlikely(!len))
	{
		dev_dbg(chan2dev(chan), "prep_dma_memcpy: length is zero!\n");
		return NULL;
	}

	if(ACTS_SRAM_ADDR(dest) || ACTS_SRAM_ADDR(src))
	{
		if(len > ACTS_SRAM_SIZE)
		{
			dev_err(chan2dev(chan), "txfer len exceed the share ram 0x%x\n", len);
			return NULL;
		}
	}

	flags |= DMA_CTRL_ACK;

	mode = atslave->mode;

	if(!((src | dest  | len) & 3))
	{
		src_width = dst_width = 2;
	}
	else if (!((src | dest | len) & 1))
	{
		src_width = dst_width = 1;
	}
	else
	{
		src_width = dst_width = 0;
	}

	ctrlb = ACTS_LINKLIST_CTRLB | ACTS_SRC_ADDR_MODE_INCR | ACTS_DST_ADDR_MODE_INCR
		| ACTS_DMAMODE_1(mode) | ACTS_DMAMODE_2(mode) | ACTS_DMAMODE_4(mode) | ACTS_DMAMODE_5(mode);

	// set the dma mode and  src

	for(offset = 0; offset < len; offset += xfer_count << src_width)
	{
		xfer_count = min_t(size_t, (len - offset) >> src_width, ACTS_BTSIZE_MAX);

		desc = acts_desc_get(atchan);

		if (!desc)
		{
			goto err_desc_get;
		}

		desc->lli.saddr = src + offset;

		desc->lli.daddr = dest + offset;

		desc->lli.ctrla = 0;

		// frame_len

		desc->lli.ctrla |= xfer_count << src_width;  

		acts_set_ctrl(chan, desc, atslave, mode, ctrlb);

		desc->txd.cookie = 0;

		acts_desc_chain(chan, &first, &prev, desc);

	}

	first->mode = mode | ACTS_LINKLIST_CTRLB | SRC_INCR | DST_INCR;

	// First descriptor of the chain embedds additional information

	first->txd.cookie = -EBUSY;

	first->len = len;

	// set end-of-link to the last link descriptor of list

	set_desc_eol(desc);

	first->txd.flags = flags;

	return &first->txd;

err_desc_get:
	acts_desc_put(atchan, first);
	return NULL;
}

static struct dma_async_tx_descriptor *
acts_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
	unsigned int sg_len, enum dma_transfer_direction direction,
	unsigned long flags, void *context)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	struct owl_dma_slave *atslave = chan->private;

	struct dma_slave_config	*sconfig = &atchan->dma_sconfig;

	struct acts_desc *first = NULL;

	struct acts_desc *prev = NULL;

	struct acts_desc *desc;

	u32	ctrlb;
	u32	mode;
	dma_addr_t reg;

	unsigned int mem_width;
	unsigned int i;

	struct scatterlist *sg;
	
	size_t total_len = 0;

	u32	len;
	u32	mem;

	dev_vdbg(chan2dev(chan), "prep_slave_sg: %s f0x%lx\n",
		direction == DMA_MEM_TO_DEV ? "TO DEVICE" : "FROM DEVICE", flags);

	if(unlikely(!atslave || !sg_len))
	{
		dev_dbg(chan2dev(chan), "prep_dma_slave_sg: length is zero!\n");
		return NULL;
	}

	flags |= DMA_CTRL_ACK;

	mode = atslave->mode;

	ctrlb =  ACTS_LINKLIST_CTRLB
		| ACTS_DMAMODE_1(mode)
		| ACTS_DMAMODE_2(mode)
		| ACTS_DMAMODE_3(mode)
		| ACTS_DMAMODE_4(mode)
		| ACTS_DMAMODE_5(mode);


	switch (direction)
	{
	case DMA_MEM_TO_DEV:
		reg = sconfig->dst_addr;

		for_each_sg(sgl, sg, sg_len, i)
		{
			desc = acts_desc_get(atchan);

			if(!desc)
			{
				goto err_desc_get;
			}

			mem = sg_dma_address(sg);

			len = sg_dma_len(sg);

			mem_width = 2;

			if(unlikely(mem & 3 || len & 3))
			{
				mem_width = 0;
			}

			desc->lli.saddr = mem;

			desc->lli.daddr = reg;

			desc->lli.ctrla = 0;

			desc->lli.ctrla |= len;

			acts_set_ctrl(chan, desc, atslave, mode, ctrlb);

			acts_desc_chain(chan, &first, &prev, desc);

			total_len += len;
		}
		break;

	case DMA_DEV_TO_MEM:
		reg = sconfig->src_addr;

		for_each_sg(sgl, sg, sg_len, i)
		{
			desc = acts_desc_get(atchan);

			if(!desc)
			{
				goto err_desc_get;
			}

			mem = sg_dma_address(sg);

			len = sg_dma_len(sg);

			mem_width = 2;

			if(unlikely(mem & 3 || len & 3))
			{
				mem_width = 0;
			}

			desc->lli.saddr = reg;

			desc->lli.daddr = mem;

			desc->lli.ctrla = 0;

			desc->lli.ctrla |= len;

			acts_set_ctrl(chan, desc, atslave, mode, ctrlb);

			acts_desc_chain(chan, &first, &prev, desc);

			total_len += len;
		}
		break;

	default:
		return NULL;
	}

	// set end-of-link to the last link descriptor of list
	set_desc_eol(prev);

	// First descriptor of the chain embedds additional information
	first->txd.cookie = -EBUSY;
	first->len = total_len;
	first->mode = mode | ACTS_LINKLIST_CTRLB;

	return &first->txd;

err_desc_get:
	dev_err(chan2dev(chan), "not enough descriptors available\n");
	acts_desc_put(atchan, first);
	return NULL;
}

static struct dma_async_tx_descriptor *
acts_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
	size_t period_len, enum dma_transfer_direction direction,
	unsigned long flags)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	struct owl_dma_slave *atslave = chan->private;

	struct dma_slave_config	*sconfig = &atchan->dma_sconfig;

	struct acts_desc *first = NULL;

	struct acts_desc *prev = NULL;

	struct acts_desc *desc;

	unsigned long was_cyclic;

	unsigned int reg_width;

	unsigned int periods = buf_len / period_len;

	unsigned int i;

	u32	mode, ctrlb;

	dev_vdbg(chan2dev(chan), "prep_dma_cyclic: %s buf@0x%08x - %d (%d/%d)\n",
		direction == DMA_MEM_TO_DEV ? "TO DEVICE" : "FROM DEVICE",
		buf_addr, periods, buf_len, period_len);

	if(unlikely(!atslave || !buf_len || !period_len))
	{
		dev_dbg(chan2dev(chan), "prep_dma_cyclic: length is zero!\n");

		return NULL;
	}

	was_cyclic = test_and_set_bit(ACTS_IS_CYCLIC, &atchan->status);

	if(was_cyclic)
	{
		dev_dbg(chan2dev(chan), "prep_dma_cyclic: channel in use!\n");

		return NULL;
	}

	mode = atslave->mode;

	ctrlb =  ACTS_LINKLIST_CTRLB
		| ACTS_DMAMODE_1(mode)
		| ACTS_DMAMODE_2(mode)
		| ACTS_DMAMODE_3(mode)
		| ACTS_DMAMODE_4(mode)
		| ACTS_DMAMODE_5(mode);

	reg_width = (mode & ACTS_MODE_BUS_WIDTH) ? 0 : 2;

	// Check for too big/unaligned periods and unaligned DMA buffer

	if(owl_dma_cyclic_check_values(reg_width, buf_addr, period_len, direction))
	{
		goto err_out;
	}

	// build cyclic linked list
	for(i = 0; i < periods; i++)
	{
		desc = acts_desc_get(atchan);

		if(!desc)
		{
			goto err_desc_get;
		}

		switch (direction)
		{
		case DMA_MEM_TO_DEV:
			desc->lli.saddr = buf_addr + (period_len * i);
			desc->lli.daddr = sconfig->dst_addr;
			break;

		case DMA_DEV_TO_MEM:
			desc->lli.saddr = sconfig->src_addr;
			desc->lli.daddr = buf_addr + (period_len * i);
			break;

		default:
			goto err_trans_type;
		}

		desc->lli.ctrla = 0;

		desc->lli.ctrla |= period_len;

		acts_set_ctrl(chan, desc, atslave, mode, ctrlb);

		acts_desc_chain(chan, &first, &prev, desc);
	}

	// lets make a cyclic list

	prev->lli.dscr = first->txd.phys;

	// First descriptor of the chain embedds additional information

	first->txd.cookie = -EBUSY;

	first->len = buf_len;

	first->mode = mode | ACTS_LINKLIST_CTRLB;

	return &first->txd;

err_trans_type:
	dev_err(chan2dev(chan), "wrong transfer directions\n");

err_desc_get:
	dev_err(chan2dev(chan), "not enough descriptors available\n");
	acts_desc_put(atchan, first);

err_out:
	clear_bit(ACTS_IS_CYCLIC, &atchan->status);
	return NULL;
}

static struct dma_async_tx_descriptor *acts_prep_dma_memset(struct dma_chan *chan,
	dma_addr_t dest, int value, size_t len, unsigned long flags)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);
	
	struct owl_dma_slave *atslave = chan->private;
	
	struct acts_desc *desc = NULL;
	
	struct acts_desc *first = NULL;
	
	struct acts_desc *prev = NULL;
	
	size_t xfer_count, offset;
	
	unsigned int src_width, dst_width;
	
	u32	ctrlb, mode;

	dev_vdbg(chan2dev(chan), "prep_dma_memset: d0x%x val0x%x l0x%zx flg0x%lx\n",
		dest, value, len, flags);
			
	if (unlikely(!len))
	{
		dev_dbg(chan2dev(chan), "prep_dma_memset: length is zero!\n");

		return NULL;
	}

	flags |= DMA_CTRL_ACK;
	
	mode = atslave->mode;
	
	ctrlb =  ACTS_LINKLIST_CTRLB | ACTS_CONSTFILL_CTRLB | ACTS_SRC_ADDR_MODE_INCR
		| ACTS_DST_ADDR_MODE_INCR | ACTS_DMAMODE_1(mode) | ACTS_DMAMODE_2(mode)
		| ACTS_DMAMODE_4(mode) | ACTS_DMAMODE_5(mode);

	if (!((dest  | len) & 3))
	{
		src_width = dst_width = 2;
	}
	else if (!((dest | len) & 1))
	{
		src_width = dst_width = 1;
	}
	else
	{
		src_width = dst_width = 0;
	}

	for(offset = 0; offset < len; offset += xfer_count << src_width)
	{
		xfer_count = min_t(size_t, (len - offset) >> src_width, ACTS_BTSIZE_MAX);

		desc = acts_desc_get(atchan);
		
		if(!desc)
		{
			goto err_desc_get;
		}

		desc->lli.saddr = 0;

		desc->lli.daddr = dest + offset;

		desc->lli.ctrla = 0;

		desc->lli.ctrla |= xfer_count << src_width;  // frame_len

		atslave->trans_type |= ACP;

		desc->lli.const_num = value;

		acts_set_ctrl(chan, desc, atslave, mode, ctrlb);

		desc->txd.cookie = 0;

		async_tx_ack(&desc->txd);

		acts_desc_chain(chan, &first, &prev, desc);
	}

	// First descriptor of the chain embedds additional information
	
	first->txd.cookie = -EBUSY;
	
	first->len = len;

	// set end-of-link to the last link descriptor of list
	
	set_desc_eol(desc);

	first->mode = mode | ACTS_LINKLIST_CTRLB | ACTS_CONSTFILL_CTRLB | SRC_INCR | DST_INCR;

	first->txd.flags = flags;

	return &first->txd;

err_desc_get:
	acts_desc_put(atchan, first);
	return NULL;
}

static int acts_pause(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);
	
	unsigned long flags, tmp;
	
	unsigned long id = chan->chan_id;
	
	struct owl_dma *owl_dma = to_owl_dma(atchan->chan_common.device);

	if(acts_chan_is_paused(atchan))
	{
		return 0;
	}

	spin_lock_irqsave(&atchan->lock, flags);
	
	tmp = dma_readl(owl_dma, DBG_SEL);
	
	tmp = tmp | (0x1 << (id + 16));
	
	dma_writel(owl_dma, DBG_SEL, tmp);
	
	set_bit(ACTS_IS_PAUSED, &atchan->status);
	
	spin_unlock_irqrestore(&atchan->lock, flags);

	return 0;
}

static int acts_resume(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);
	
	unsigned long flags, tmp;
	
	unsigned long id = chan->chan_id;
	
	struct owl_dma *owl_dma = to_owl_dma(atchan->chan_common.device);

	if(!acts_chan_is_paused(atchan))
	{
		return 0;
	}

	spin_lock_irqsave(&atchan->lock, flags);
	
	tmp = dma_readl(owl_dma, DBG_SEL);
	
	tmp = tmp & ~(0x1 << (id + 16));
	
	dma_writel(owl_dma, DBG_SEL, tmp);
	
	clear_bit(ACTS_IS_PAUSED, &atchan->status);
	
	spin_unlock_irqrestore(&atchan->lock, flags);
	
	return 0;
}

static int acts_stop(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);
	
	struct acts_desc *desc, *_desc;
	
	unsigned long flags, tmp, timeout = STOP_TIMEOUT;
	
	unsigned long id = chan->chan_id;
	
	struct owl_dma *owl_dma = to_owl_dma(atchan->chan_common.device);

	LIST_HEAD(list);

	spin_lock_irqsave(&atchan->lock, flags);
	
	channel_writel(atchan, START, 0);
	
	spin_unlock_irqrestore(&atchan->lock, flags);
	
	while(!(dma_readl(owl_dma, IDLE_STAT) & (0x1 << id)))
	{
		udelay(5);
		
		timeout--;
		
		if(timeout == 0)
		{
			goto err;
		}
	}
	
	if(STOP_TIMEOUT - timeout > max_timeout)
	{
		max_timeout = STOP_TIMEOUT - timeout;
		
		pr_err("dma%d stop wating time is %ld, max timeout %ld\n",
			chan->chan_id, STOP_TIMEOUT - timeout, max_timeout);
	}

	dma_readl(owl_dma, IDLE_STAT);
	
	dma_readl(owl_dma, IDLE_STAT);
	
	dma_readl(owl_dma, IDLE_STAT);

	spin_lock_irqsave(&atchan->lock, flags);
	
	channel_writel(atchan, INT_STAT, 0x7f);
	
	dma_writel(owl_dma, IRQPD_0, (1 << id));
	
	dma_writel(owl_dma, IRQPD_1, (1 << id));
	
	dma_writel(owl_dma, IRQPD_2, (1 << id));
	
	dma_writel(owl_dma, IRQPD_3, (1 << id));

	// stop the transfer
	// active_list entries will :end up before queued entries
	
	list_splice_init(&atchan->queue, &list);
	
	list_splice_init(&atchan->active_list, &list);

	// Flush all pending and queued descriptors
	list_for_each_entry_safe(desc, _desc, &list, desc_node)
	{
		acts_chain_complete(atchan, desc);
	}

	tmp = dma_readl(owl_dma, DBG_SEL);
	
	tmp = tmp & ~(0x1 << (id + 16));
	
	dma_writel(owl_dma, DBG_SEL, tmp);
	
	clear_bit(ACTS_IS_PAUSED, &atchan->status);
	
	clear_bit(ACTS_IS_CYCLIC, &atchan->status);
	
	clear_bit(ACTS_IS_INTERRUPT, &atchan->status);
	
	spin_unlock_irqrestore(&atchan->lock, flags);

	return 0;

err:
	pr_err("dma id %d: channel not stop\n", chan->chan_id);
	pr_err("%s, calling stack is:\n", __func__);
	pr_err("\t%pF\n", __builtin_return_address(0));

	owl_dma_dump_all(chan);
	
	return -EINVAL;
}

static void acts_complete_all(struct owl_dma_chan *atchan)
{
	struct acts_desc *desc, *_desc;

	LIST_HEAD(list);

	dev_vdbg(chan2dev(&atchan->chan_common), "complete all\n");

	BUG_ON(acts_chan_is_enabled_dump(atchan));

	// Submit queued descriptors ASAP, i.e. before we go through
	// the completed ones.

	if(!list_empty(&atchan->queue))
	{
		acts_dostart(atchan, acts_first_queued(atchan));
	}

	// empty active_list now it is completed

	list_splice_init(&atchan->active_list, &list);

	// empty queue list by moving descriptors (if any) to active_list

	list_splice_init(&atchan->queue, &atchan->active_list);

	list_for_each_entry_safe(desc, _desc, &list, desc_node)
	{
		acts_chain_complete(atchan, desc);
	}
}

static void acts_advance_work(struct owl_dma_chan *atchan)
{
	dev_vdbg(chan2dev(&atchan->chan_common), "advance_work\n");

	if(list_empty(&atchan->active_list) || list_is_singular(&atchan->active_list))
	{
		acts_complete_all(atchan);
	}
	else
	{
		acts_chain_complete(atchan, acts_first_active(atchan));

		acts_dostart(atchan, acts_first_active(atchan));
	}
}

static void acts_handle_cyclic(struct owl_dma_chan *atchan)
{
	struct acts_desc *first = acts_first_active(atchan);

	struct dma_async_tx_descriptor *txd = &first->txd;

	dma_async_tx_callback callback = txd->callback;

	void *param = txd->callback_param;

	if(test_and_clear_bit(ACTS_IS_INTERRUPT, &atchan->status))
	{
		dev_vdbg(chan2dev(&atchan->chan_common), "new cyclic period llp 0x%08x\n",
			channel_readl(atchan, NEXT_DESC));

		if(NULL != callback)
		{
			callback(param);
		}
	}
}

static void acts_tasklet(unsigned long data)
{
	struct owl_dma *owl_dma = (struct owl_dma *)data;

	struct owl_dma_chan *atchan;

	int i;

	for(i = 0; i < owl_dma->dma_common.chancnt; i++)
	{
		atchan = &owl_dma->chan[i];

		if(test_bit(ACTS_IS_ERROR, &atchan->status))
		{
			acts_handle_error(atchan);
		}
		else if(test_bit(ACTS_IS_CYCLIC, &atchan->status))
		{
			if(list_empty(&atchan->active_list))
			{
				pr_warning("WARNING: %s, active_list is empty!\n", __func__);
				return;
			}
			acts_handle_cyclic(atchan);
		}
		else if(test_and_clear_bit(ACTS_IS_INTERRUPT, &atchan->status))
		{
			if(acts_chan_is_enabled_dump(atchan))
			{
				dev_err(chan2dev(&atchan->chan_common), "BUG: channel enabled in tasklet\n");
				return;
			}
			acts_advance_work(atchan);
		}
	}
}

static void acts_issue_pending(struct dma_chan *chan)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);

	unsigned long flags;

	dev_vdbg(chan2dev(chan), "issue_pending\n");

	if(acts_chan_is_cyclic(atchan))
	{
		return;
	}

	spin_lock_irqsave(&atchan->lock, flags);

	if(!acts_chan_is_enabled(atchan))
	{
		acts_advance_work(atchan);
	}

	spin_unlock_irqrestore(&atchan->lock, flags);
}

static int set_runtime_config(struct dma_chan *chan, struct dma_slave_config *sconfig)
{
	struct owl_dma_chan	*atchan = to_owl_dma_chan(chan);
	
	if(!chan->private)
	{
		return -EINVAL;
	}

	memcpy(&atchan->dma_sconfig, sconfig, sizeof(*sconfig));
	
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

	for(i = 0; i < pdata->nr_channels; i++, owl_dma->dma_common.chancnt++)
	{
		atchan = &owl_dma->chan[i];

		atchan->chan_common.device = &owl_dma->dma_common;

		dma_cookie_init(&atchan->chan_common);

		atchan->chan_common.chan_id = i;

		list_add_tail(&atchan->chan_common.device_node, &owl_dma->dma_common.channels);

		atchan->ch_regs = owl_dma->regs + ch_regs(i);

		spin_lock_init(&atchan->lock);

		atchan->mask = 1 << i;

		INIT_LIST_HEAD(&atchan->active_list);
		
		INIT_LIST_HEAD(&atchan->queue);
		
		INIT_LIST_HEAD(&atchan->free_list);

		acts_enable_irq(atchan);
	}

	tasklet_init(&owl_dma->tasklet, acts_tasklet, (unsigned long)owl_dma);

	// set base routines
	
	owl_dma->dma_common.device_alloc_chan_resources = acts_alloc_chan_resources;
	
	owl_dma->dma_common.device_free_chan_resources = acts_free_chan_resources;
	
	owl_dma->dma_common.device_tx_status = acts_tx_status;
	
	owl_dma->dma_common.device_issue_pending = acts_issue_pending;
	
	owl_dma->dma_common.dev = &pdev->dev;

	// set prep routines based on capability
	
	if(dma_has_cap(DMA_MEMCPY, owl_dma->dma_common.cap_mask))
	{
		owl_dma->dma_common.device_prep_dma_memcpy = acts_prep_dma_memcpy;
	}

	if(dma_has_cap(DMA_SLAVE, owl_dma->dma_common.cap_mask))
	{
		owl_dma->dma_common.device_prep_slave_sg = acts_prep_slave_sg;

		dma_cap_set(DMA_CYCLIC, owl_dma->dma_common.cap_mask);

		owl_dma->dma_common.device_prep_dma_cyclic = acts_prep_dma_cyclic;
		
		owl_dma->dma_common.device_pause = acts_pause;
		
		owl_dma->dma_common.device_resume = acts_resume;
		
		owl_dma->dma_common.device_terminate_all = acts_stop;
		
		owl_dma->dma_common.device_config = set_runtime_config;
	}
	if(dma_has_cap(DMA_MEMSET, owl_dma->dma_common.cap_mask))
	{
		owl_dma->dma_common.device_prep_dma_memset = acts_prep_dma_memset;
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
	struct owl_dma *owl_dma = platform_get_drvdata(pdev);
	
	struct dma_chan *chan, *_chan;
	
    struct owl_dma_chan	*atchan;
    
	owl_dma_on(owl_dma, false);
	
	dma_async_device_unregister(&owl_dma->dma_common);

	dma_pool_destroy(owl_dma->dma_desc_pool);

	platform_set_drvdata(pdev, NULL);
	
	free_irq(platform_get_irq(pdev, 0), owl_dma);

	list_for_each_entry_safe(chan, _chan, &owl_dma->dma_common.channels, device_node)
	{
		atchan = to_owl_dma_chan(chan);

		// Disable interrupts
		
		acts_disable_irq(atchan);
		
		list_del(&chan->device_node);
	}

	tasklet_disable(&owl_dma->tasklet);
	
	tasklet_kill(&owl_dma->tasklet);

	pm_runtime_put_sync(&pdev->dev);
	
	pm_runtime_disable(&pdev->dev);

	kfree(owl_dma);
	
	return 0;
}

static void acts_suspend_cyclic(struct owl_dma_chan *atchan)
{
	struct dma_chan	*chan = &atchan->chan_common;

	// Channel should be paused by user do it anyway even if it is not done already
	
	if(!acts_chan_is_paused(atchan))
	{
		dev_warn(chan2dev(chan), "cyclic channel not paused, should be done by channel user\n");
		
		acts_pause(chan);
	}

	// now preserve additional data for cyclic operations
	// next descriptor address in the cyclic list
	
	atchan->save_dscr = channel_readl(atchan, NEXT_DESC);
}

static void acts_resume_cyclic(struct owl_dma_chan *atchan)
{
	int int_ctl;

	// restore channel status for cyclic descriptors list:
	// next descriptor in the cyclic list at the time of suspend
	
	channel_writel(atchan, SRC, 0);
	
	channel_writel(atchan, DST, 0);
	
	channel_writel(atchan, NEXT_DESC, atchan->save_dscr);
	
	int_ctl = channel_readl(atchan, INT_CTL);
	
	channel_writel(atchan, INT_CTL, int_ctl | ACTS_INT_CTL_END_BLOCK_INT);

	// channel pause status should be removed by channel user
	// We cannot take the initiative to do it here
}

static int owl_dma_suspend_noirq(struct device *dev)
{
	struct platform_device *pdev = to_platform_device(dev);
	
	struct owl_dma *owl_dma = platform_get_drvdata(pdev);
	
	struct owl_dma_chan *atchan;
	
	struct dma_chan *chan, *_chan;

	// preserve data
	
	list_for_each_entry_safe(chan, _chan, &owl_dma->dma_common.channels, device_node)
	{
		atchan = to_owl_dma_chan(chan);

		// here, all channels should be idled already (cyclic channel is paused)
		
		if(acts_chan_is_enabled(atchan) && !acts_chan_is_cyclic(atchan))
		{
			vdbg_dump_regs(atchan);
			
			pr_alert("%s:DMA channel%d is not idled yet!!!\n", __func__, atchan->chan_common.chan_id);
		}

		if (acts_chan_is_cyclic(atchan))
		{
			acts_suspend_cyclic(atchan);
		}
		
		atchan->save_mode = channel_readl(atchan, MODE);
		
		atchan->save_ll = channel_readl(atchan,	LINKLIST);
		
		acts_disable_irq(atchan);
	}
	
	owl_dma->save_nicqos = dma_readl(owl_dma, NIC_QOS);

	// disable DMA controller
	
	owl_dma_on(owl_dma, false);
	
	pm_runtime_put_sync(&pdev->dev);
	
	pm_runtime_disable(&pdev->dev);
	
	return 0;
}

static int owl_dma_resume_noirq(struct device *dev)
{
	struct platform_device *pdev = to_platform_device(dev);
	
	struct owl_dma *owl_dma = platform_get_drvdata(pdev);
	
	struct dma_chan *chan, *_chan;
	
	struct owl_dma_chan *atchan;

	// bring back DMA controller
	
	pm_runtime_enable(&pdev->dev);
	
	pm_runtime_get_sync(&pdev->dev);
	
	owl_dma_on(owl_dma, true);
	
	// restore saved data
	
	dma_writel(owl_dma, NIC_QOS, owl_dma->save_nicqos);
	
	list_for_each_entry_safe(chan, _chan, &owl_dma->dma_common.channels, device_node)
	{
		atchan = to_owl_dma_chan(chan);

		acts_enable_irq(atchan);
		
		channel_writel(atchan, MODE, atchan->save_mode);
		
		channel_writel(atchan, LINKLIST, atchan->save_ll);
		
		if(acts_chan_is_cyclic(atchan))
		{
			acts_resume_cyclic(atchan);
		}
	}
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

