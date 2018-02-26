#include <linux/slab.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/platform_device.h>
#include <linux/slab.h>
#include <linux/err.h>
#include <linux/io.h>
#include <linux/clk-provider.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/mfd/syscon.h>
#include <linux/regmap.h>
#include <linux/spinlock.h>
#include <linux/reset-controller.h>
#include <dt-bindings/clock/owl-s500-clk.h>

static struct clk_hw_onecell_data *clk_data;

#define MEGA (1000000)
#define KILO (1000)

#define CMU_BASE 0xB0160000
#define CMU_DEVCLKEN0 (CMU_BASE+0x00A0)
#define CMU_DEVCLKEN1 (CMU_BASE+0x00A4)
#define CMU_DEVRST0   (CMU_BASE+0x00A8)
#define CMU_DEVRST1   (CMU_BASE+0x00AC)

static void __init owl_cc_init(struct device_node *np)
{
	int i;
	void __iomem *base;
	struct clk_hw **hws;

	clk_data = kzalloc(sizeof(*clk_data) + sizeof(*clk_data->hws) * OWL_MAX_CLKS, GFP_KERNEL);

	if(!clk_data) {
		return;
	}

	hws = clk_data->hws;

	for(i = 0; i < OWL_MAX_CLKS; ++i) {
		hws[i] = ERR_PTR(-ENOENT);
	}

	base = of_iomap(np, 0);

	if(!base) {
		pr_warn("Failed to map address range for Actions s500.\n");
		return;
	}

	hws[OWL_CLK_HOSC] = clk_hw_register_fixed_rate(NULL, "HOSC", NULL, 0, 24 * MEGA);
	hws[OWL_CLK_LOSC] = clk_hw_register_fixed_rate(NULL, "LOSC", NULL, 0, 32 * KILO);

	hws[OWL_CLK_ETH_PLL] = clk_hw_register_fixed_rate(NULL, "ETH_PLL", "HOSC", 0, 100 * MEGA);

	hws[OWL_CLK_I2C0] = clk_hw_register_gate(NULL, "I2C0", "ETHERNET_PLL", 0, base + CMU_DEVCLKEN1, 14, 0, NULL);
	hws[OWL_CLK_I2C1] = clk_hw_register_gate(NULL, "I2C1", "ETHERNET_PLL", 0, base + CMU_DEVCLKEN1, 15, 0, NULL);
	hws[OWL_CLK_I2C2] = clk_hw_register_gate(NULL, "I2C2", "ETHERNET_PLL", 0, base + CMU_DEVCLKEN1, 30, 0, NULL);
	hws[OWL_CLK_I2C3] = clk_hw_register_gate(NULL, "I2C3", "ETHERNET_PLL", 0, base + CMU_DEVCLKEN1, 31, 0, NULL);

	hws[OWL_CLK_DEV_PLL] = 

	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
}

CLK_OF_DECLARE(owl, "actions,s500-clk", owl_cc_init);

