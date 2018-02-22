#include <linux/module.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/dma-mapping.h>
#include <linux/dmaengine.h>
#include <linux/dma-direction.h>
#include <linux/scatterlist.h>
#include <linux/mmc/host.h>
#include <linux/mmc/mmc.h>
#include <linux/mmc/card.h>
#include <linux/mmc/core.h>
#include <linux/cpufreq.h>
#include <linux/genhd.h>
#include <linux/gpio.h>
#include <linux/delay.h>
#include <linux/of.h>
#include <linux/of_device.h>
#include <linux/of_gpio.h>
#include <linux/regulator/consumer.h>
#include <linux/pinctrl/consumer.h>
#include <linux/clk.h>

static int owl_mmc_probe(struct platform_device *pdev)
{
	return 0;
}

static int __exit owl_mmc_remove(struct platform_device *pdev)
{
	return 0;
}

static const struct of_device_id owl_mmc_dt_match[]  = {
	{.compatible = "actions,owl-mmc", },
	{}
};

static struct platform_driver owl_mmc_driver = {
	.probe = owl_mmc_probe,
	.remove = owl_mmc_remove,
	.driver = {
		.name = "owl_mmc",
		.owner = THIS_MODULE,
		.of_match_table = owl_mmc_dt_match,
	},
};

static int __init owl_mmc_init(void)
{
	int ret;

	ret = platform_driver_register(&owl_mmc_driver);

	if(ret != 0)
	{
		pr_err("SD/MMC controller driver register failed\n");
		ret = -ENOMEM;
	}

	return ret;
}

module_init(owl_mmc_init);

static void __exit owl_mmc_exit(void)
{
	platform_driver_unregister(&owl_mmc_driver);
}

module_exit(owl_mmc_exit);

MODULE_LICENSE("GPL");

