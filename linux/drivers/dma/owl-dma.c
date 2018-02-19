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

struct owl_dma_platform_data {
	unsigned int	nr_channels;
	dma_cap_mask_t  cap_mask;
};

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

static int __init owl_dma_probe(struct platform_device *pdev)
{
	return -EINVAL;
}

static int __exit owl_dma_remove(struct platform_device *pdev)
{
	return 0;
}

static int owl_dma_suspend_noirq(struct device *dev)
{
	return 0;
}

static int owl_dma_resume_noirq(struct device *dev)
{
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

