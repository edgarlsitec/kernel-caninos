#ifndef __MFD_ATC260X_H__
#define __MFD_ATC260X_H__

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/device.h>

#include <linux/mfd/atc260x/regs_map_atc2603a.h>
#include <linux/mfd/atc260x/regs_map_atc2603c.h>
#include <linux/mfd/atc260x/regs_map_atc2609a.h>

enum {
	ATC260X_ICTYPE_2603A = 0,
	ATC260X_ICTYPE_2603C,
	ATC260X_ICTYPE_2609A,
	ATC260X_ICTYPE_CNT
};

enum {
	ATC260X_ICVER_A = 0,
	ATC260X_ICVER_B,
	ATC260X_ICVER_C,
	ATC260X_ICVER_D,
	ATC260X_ICVER_E,
	ATC260X_ICVER_F,
	ATC260X_ICVER_G,
	ATC260X_ICVER_H,
};

struct atc260x_dev;

extern struct atc260x_dev *atc260x_get_parent_dev(struct device *sub_dev);

extern void atc260x_get_bus_info(struct atc260x_dev *atc260x, uint *bus_num, uint *bus_addr);

extern uint atc260x_get_ic_type(struct atc260x_dev *atc260x);

extern uint atc260x_get_ic_ver(struct atc260x_dev *atc260x);

extern int atc260x_reg_read(struct atc260x_dev *atc260x, uint reg);

extern int atc260x_reg_write(struct atc260x_dev *atc260x, uint reg, u16 val);

extern int atc260x_reg_setbits(struct atc260x_dev *atc260x, uint reg, u16 mask, u16 val);

static inline int atc260x_set_bits(struct atc260x_dev *atc260x, uint reg, u16 mask, u16 val)
{
	return atc260x_reg_setbits(atc260x, reg, mask, val);
}

static inline int atc260x_reg_wp_setbits(struct atc260x_dev *atc260x, uint reg, u16 all_pnd_mask, u16 mask, u16 val)
{
	return atc260x_reg_setbits(atc260x, reg, (all_pnd_mask | mask), (val & mask & ~all_pnd_mask));
}

static inline int atc260x_reg_wp_clrpnd(struct atc260x_dev *atc260x, uint reg, u16 all_pnd_mask, u16 clr_mask)
{
	uint val;

	int ret = atc260x_reg_read(atc260x, reg);

	if(ret < 0) {
		return ret;
	}

	val = ((uint)ret & ~all_pnd_mask) | clr_mask;

	return atc260x_reg_write(atc260x, reg, val);
}

extern void atc260x_set_reg_direct_access(struct atc260x_dev *atc260x, bool enable);

#define ATC260X_CMU_MODULE_NUM           (6)
#define ATC260X_CMU_MODULE_TP            (0)
#define ATC260X_CMU_MODULE_MFP           (1)
#define ATC260X_CMU_MODULE_INTS          (2)
#define ATC260X_CMU_MODULE_ETHPHY        (3)
#define ATC260X_CMU_MODULE_AUDIO         (4)
#define ATC260X_CMU_MODULE_PWSI          (5)

extern int atc260x_cmu_reset(struct atc260x_dev *atc260x, uint cmu_module);

extern int atc260x_cmu_clk_ctrl(struct atc260x_dev *atc260x, uint cmu_module, uint clk_en);

static inline int atc260x_cmu_enable(struct atc260x_dev *atc260x, uint cmu_module)
{
	return atc260x_cmu_clk_ctrl(atc260x, cmu_module, 1);
}
static inline int atc260x_cmu_disable(struct atc260x_dev *atc260x, uint cmu_module)
{
	return atc260x_cmu_clk_ctrl(atc260x, cmu_module, 0);
}

extern int atc260x_auxadc_find_chan(struct atc260x_dev *atc260x, const char *channel_name);

extern const char *atc260x_auxadc_channel_name(struct atc260x_dev *atc260x, uint channel);

extern const char *atc260x_auxadc_channel_unit_name(struct atc260x_dev *atc260x, uint channel);

extern int atc260x_auxadc_get_raw(struct atc260x_dev *atc260x, uint channel);

extern int atc260x_auxadc_get_translated(struct atc260x_dev *atc260x, uint channel, s32 *p_tr_value);

enum {
	ATC260X_PSTORE_TAG_REBOOT_ADFU = 0,
	ATC260X_PSTORE_TAG_REBOOT_RECOVERY,
	ATC260X_PSTORE_TAG_FW_S2,
	ATC260X_PSTORE_TAG_DIS_MCHRG,
	ATC260X_PSTORE_TAG_RTC_MSALM,
	ATC260X_PSTORE_TAG_RTC_HALM,
	ATC260X_PSTORE_TAG_RTC_YMDALM,
	ATC260X_PSTORE_TAG_GAUGE_CAP,
	ATC260X_PSTORE_TAG_GAUGE_BAT_RES,
	ATC260X_PSTORE_TAG_GAUGE_ICM_EXIST,
	ATC260X_PSTORE_TAG_GAUGE_SHDWN_TIME,
	ATC260X_PSTORE_TAG_GAUGE_S2_CONSUMP,
	ATC260X_PSTORE_TAG_GAUGE_CLMT_RESET,
	ATC260X_PSTORE_TAG_RESUME_ADDR,
	ATC260X_PSTORE_TAG_NUM
};

extern int atc260x_pstore_set(struct atc260x_dev *atc260x, uint tag, u32 value);

extern int atc260x_pstore_get(struct atc260x_dev *atc260x, uint tag, u32 *p_value);

extern int atc260x_pstore_reset_all(struct atc260x_dev *atc260x);

extern int atc260x_ex_auxadc_find_chan(const char *channel_name);

extern int atc260x_ex_auxadc_read(uint channel, s32 *p_tr_value);

static inline int atc260x_ex_auxadc_read_by_name(const char *channel_name, s32 *p_tr_value)
{
	int channel = atc260x_ex_auxadc_find_chan(channel_name);

	if(channel < 0) {
		return channel;
	}

	return atc260x_ex_auxadc_read(channel, p_tr_value);
}

extern int atc260x_ex_pstore_set(uint tag, u32 value);
extern int atc260x_ex_pstore_get(uint tag, u32 *p_value);

int atc260x_enable_vbusotg(int on);

enum {
	DEV_CHARGER_CURRENT_LCD = 0,
	DEV_CHARGER_CURRENT_CAMERA,
	DEV_CHARGER_CURRENT_WIFI,
	DEV_CHARGER_CURRENT_MAX,
};

enum {
	DEV_CHARGER_PRE_CONFIG = 0,
	DEV_CHARGER_POST_CONFIG,
};

extern void config_inner_charger_current(int pre_post, int dev_type, int param);

extern void pmic_charger_set_fun(void (*funp)(int, int, int));

#endif /* __MFD_ATC260X_H__ */
