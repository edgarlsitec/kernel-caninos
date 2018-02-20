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

enum {
	PURE_CMD,
	DATA_CMD ,
};

enum {
	MMC_CARD_DISABLE = 0,
	MMC_CARD_MEMORY,
	MMC_CARD_EMMC,
	MMC_CARD_WIFI,
};

static const char * const card_types[] = {
	[MMC_CARD_DISABLE]	= "none",
	[MMC_CARD_MEMORY]	= "memory",
	[MMC_CARD_EMMC]		= "emmc",
	[MMC_CARD_WIFI]		= "wifi",
};

#define mmc_card_expected_emmc(type) ((type) == MMC_CARD_EMMC)

#define ACTS_MMC_OCR (MMC_VDD_27_28 | MMC_VDD_28_29 | MMC_VDD_29_30  | \
	MMC_VDD_30_31 | MMC_VDD_31_32 | MMC_VDD_32_33  | \
	MMC_VDD_33_34 | MMC_VDD_34_35 | MMC_VDD_35_36)

#define PAD_DRV_LOW	(0)
#define PAD_DRV_MID	(1)
#define PAD_DRV_HIGH (3)

#define REG_ENABLE 	1
#define REG_DISABLE 0

#define MMC_CMD_COMPLETE 1

#define CMD_OK BIT(0)
#define CMD_RSP_ERR	BIT(1)
#define CMD_RSP_BUSY BIT(2)
#define CMD_RSP_CRC_ERR	BIT(3)
#define CMD_TS_TIMEOUT BIT(4)
#define CMD_DATA_TIMEOUT BIT(5)
#define HW_TIMEOUT					BIT(6)
#define DATA_WR_CRC_ERR			BIT(7)
#define DATA_RD_CRC_ERR			BIT(8)
#define DATA0_BUSY_ERR				BIT(9)

#define SDC0_WDELAY_LOW_CLK (0xf)
#define SDC0_WDELAY_MID_CLK (0xa)
#define SDC0_WDELAY_HIGH_CLK (0x9)

#define SDC0_RDELAY_LOW_CLK (0xf)
#define SDC0_RDELAY_MID_CLK (0xa)
#define SDC0_RDELAY_HIGH_CLK (0x8)
#define SDC0_RDELAY_DDR50 (0x9)
#define SDC0_WDELAY_DDR50 (0x8)
#define DDR50_CLK (40000000)

#define SDC0_PAD_DRV PAD_DRV_MID

#define SDC1_WDELAY_LOW_CLK (0xf)
#define SDC1_WDELAY_MID_CLK (0xa)
#define SDC1_WDELAY_HIGH_CLK (0x8)

#define SDC1_RDELAY_LOW_CLK (0xf)
#define SDC1_RDELAY_MID_CLK (0xa)
#define SDC1_RDELAY_HIGH_CLK (0x8)

#define SDC1_PAD_DRV PAD_DRV_MID

#define SDC2_WDELAY_LOW_CLK (0xf)
#define SDC2_WDELAY_MID_CLK	(0xa)
#define SDC2_WDELAY_HIGH_CLK (0x8)

#define SDC2_RDELAY_LOW_CLK (0xf)
#define SDC2_RDELAY_MID_CLK (0xa)
#define SDC2_RDELAY_HIGH_CLK (0x8)

#define SDC2_PAD_DRV PAD_DRV_MID

#define SDC0_SLOT 0
#define SDC1_SLOT 1
#define SDC2_SLOT 2

#define SD_EN_OFFSET 0x0000
#define SD_CTL_OFFSET 0x0004
#define SD_STATE_OFFSET	0x0008
#define SD_CMD_OFFSET 0x000c
#define SD_ARG_OFFSET 0x0010
#define SD_RSPBUF0_OFFSET 0x0014
#define SD_RSPBUF1_OFFSET 0x0018
#define SD_RSPBUF2_OFFSET 0x001c
#define SD_RSPBUF3_OFFSET 0x0020
#define SD_RSPBUF4_OFFSET 0x0024
#define SD_DAT_OFFSET 0x0028
#define SD_BLK_SIZE_OFFSET 0x002c
#define SD_BLK_NUM_OFFSET 0x0030
#define SD_BUF_SIZE_OFFSET 0x0034

#define HOST_EN(h) ((h)->iobase + SD_EN_OFFSET)
#define HOST_CTL(h)	((h)->iobase + SD_CTL_OFFSET)
#define HOST_STATE(h) ((h)->iobase + SD_STATE_OFFSET)
#define HOST_CMD(h) ((h)->iobase + SD_CMD_OFFSET)
#define HOST_ARG(h) ((h)->iobase + SD_ARG_OFFSET)
#define HOST_RSPBUF0(h) ((h)->iobase + SD_RSPBUF0_OFFSET)
#define HOST_RSPBUF1(h)	((h)->iobase + SD_RSPBUF1_OFFSET)
#define HOST_RSPBUF2(h)	((h)->iobase + SD_RSPBUF2_OFFSET)
#define HOST_RSPBUF3(h)	((h)->iobase + SD_RSPBUF3_OFFSET)
#define HOST_RSPBUF4(h)	((h)->iobase + SD_RSPBUF4_OFFSET)
#define HOST_DAT(h) ((h)->iobase + SD_DAT_OFFSET)
#define HOST_DAT_DMA(h)	((h)->start + SD_DAT_OFFSET)
#define HOST_BLK_SIZE(h) ((h)->iobase + SD_BLK_SIZE_OFFSET)
#define HOST_BLK_NUM(h)	((h)->iobase + SD_BLK_NUM_OFFSET)
#define HOST_BUF_SIZE(h) ((h)->iobase + SD_BUF_SIZE_OFFSET)

#define SD_EN_RANE			(1 << 31)

#define SD_EN_RAN_SEED(x)		(((x) & 0x3f) << 24)

#define SD_EN_S18EN			(1 << 12)

#define SD_EN_RESE			(1 << 10)
#define SD_EN_DAT1_S			(1 << 9)
#define SD_EN_CLK_S			(1 << 8)
#define SD_ENABLE			(1 << 7)
#define SD_EN_BSEL			(1 << 6)

#define SD_EN_SDIOEN			(1 << 3)
#define SD_EN_DDREN			(1 << 2)
#define SD_EN_DATAWID(x)		(((x) & 0x3) << 0)

#define SD_CTL_TOUTEN			(1 << 31)
#define SD_CTL_TOUTCNT(x)		(((x) & 0x7f) << 24)
#define SD_CTL_RDELAY(x)		(((x) & 0xf) << 20)
#define SD_CTL_WDELAY(x)		(((x) & 0xf) << 16)

#define SD_CTL_CMDLEN			(1 << 13)
#define SD_CTL_SCC			(1 << 12)
#define SD_CTL_TCN(x)			(((x) & 0xf) << 8)
#define SD_CTL_TS			(1 << 7)
#define SD_CTL_LBE			(1 << 6)
#define SD_CTL_C7EN			(1 << 5)

#define SD_CTL_TM(x)			(((x) & 0xf) << 0)

#define SD_STATE_DAT1BS			(1 << 18)
#define SD_STATE_SDIOB_P		(1 << 17)
#define SD_STATE_SDIOB_EN		(1 << 16)
#define SD_STATE_TOUTE			(1 << 15)
#define SD_STATE_BAEP			(1 << 14)

#define SD_STATE_MEMRDY			(1 << 12)
#define SD_STATE_CMDS			(1 << 11)
#define SD_STATE_DAT1AS			(1 << 10)
#define SD_STATE_SDIOA_P		(1 << 9)
#define SD_STATE_SDIOA_EN		(1 << 8)
#define SD_STATE_DAT0S			(1 << 7)
#define SD_STATE_TEIE			(1 << 6)
#define SD_STATE_TEI			(1 << 5)
#define SD_STATE_CLNR			(1 << 4)
#define SD_STATE_CLC			(1 << 3)
#define SD_STATE_WC16ER			(1 << 2)
#define SD_STATE_RC16ER			(1 << 1)
#define SD_STATE_CRC7ER			(1 << 0)


struct mmc_con_delay {
	unsigned char delay_lowclk;
	unsigned char delay_midclk;
	unsigned char delay_highclk;
};

struct gl520xmmc_host {
	spinlock_t lock;
	struct mutex pin_mutex;
	u32 id;				/* SD Controller number */
	void __iomem *iobase;
	u32 start;
	u32 type_expected;		/* MEMORY Card or SDIO Card */

	int card_detect_mode;		/* which method used to detect card */

	u32 detect;			/* irq line for mmc/sd card detect */
	u32 detect_sirq;		/* Which SIRQx used to detect card */
	int detect_irq_registered;	/* card detect irq is registered */

	u32 sdc_irq;			/* irq line for SDC transfer end */
	struct completion sdc_complete;

	u32 sdio_irq;			/* irq for SDIO wifi data transfer */
	u32 eject;			/* card status */

	int power_state;		/* card status */
	int bus_width;			/* data bus width */
	int chip_select;
	int timing;
	u32 clock;			/* current clock frequency */
	u32 clk_on;			/* card module clock status */
	struct clk *clk;		/* SDC clock source */
	struct notifier_block nblock;	/* clkfreq notifier block */
	struct regulator *reg;		/* supply regulator */

	struct timer_list timer;	/* used for gpio card detect */
	u32 detect_pin;			/* gpio card detect pin number */
	int wpswitch_gpio;		/* card write protect gpio */
	int present;			/* card is inserted or extracted ? */
	int sdio_present;		/* Wi-Fi is open or not ? */
	char dma_terminate;	
	char switch_pin_flag;	/*UART_PIN: uart mode and host0 cmd sd0 clk vail
							* SD_PIN: cmd clk sd0-sd3
							* ERR_PIN: init status
							*/						
	struct pinctrl *pcl;
	bool dmaflag;						
	unsigned char write_delay_chain;
	unsigned char read_delay_chain;
	unsigned char write_delay_chain_bak;
	unsigned char read_delay_chain_bak;
	unsigned char adjust_write_delay_chain;
	unsigned char adjust_read_delay_chain;

	struct mmc_host *mmc;
	struct mmc_request *mrq;

	enum dma_data_direction		dma_dir;
	struct dma_chan			*dma;
	struct dma_async_tx_descriptor	*desc;
	struct dma_slave_config		dma_conf;
	//struct owl_dma_slave dma_slave;

	struct completion		dma_complete;
	struct workqueue_struct *dma_wq;
	struct workqueue_struct *add_host_wq;
	struct delayed_work			dma_work;
	struct delayed_work			host_add_work;

	struct mmc_con_delay		wdelay;
	struct mmc_con_delay		rdelay;
	unsigned char			pad_drv;
};

const int of_get_card_type(struct device_node *np)
{
	const char *pm;

	int err, i;

	err = of_property_read_string(np, "card_type", &pm);

	if(err < 0)
	{
		return err;
	}

	for(i = 0; i < ARRAY_SIZE(card_types); i++)
	{
		if(!strcasecmp(pm, card_types[i]))
		{
			return i;
		}
	}

	pr_err("error: please make sure card type is exist\n");
	return -ENODEV;
}

static inline void acts_mmc_sdc_config(struct gl520xmmc_host *host)
{
	if(host->start & 0x4000)
	{
		host->id = SDC1_SLOT;
		host->pad_drv = SDC1_PAD_DRV;
		host->wdelay.delay_lowclk = SDC1_WDELAY_LOW_CLK;
		host->wdelay.delay_midclk = SDC1_WDELAY_MID_CLK;
		host->wdelay.delay_highclk = SDC1_WDELAY_HIGH_CLK;
		host->rdelay.delay_lowclk = SDC1_RDELAY_LOW_CLK;
		host->rdelay.delay_midclk = SDC1_RDELAY_MID_CLK;
		host->rdelay.delay_highclk = SDC1_RDELAY_HIGH_CLK;
	}
	else if(host->start& 0x8000)
	{
		host->id = SDC2_SLOT;
		host->pad_drv = SDC2_PAD_DRV;
		host->wdelay.delay_lowclk = SDC2_WDELAY_LOW_CLK;
		host->wdelay.delay_midclk = SDC2_WDELAY_MID_CLK;
		host->wdelay.delay_highclk = SDC2_WDELAY_HIGH_CLK;
		host->rdelay.delay_lowclk = SDC2_RDELAY_LOW_CLK;
		host->rdelay.delay_midclk = SDC2_RDELAY_MID_CLK;
		host->rdelay.delay_highclk = SDC2_RDELAY_HIGH_CLK;
	}
	else
	{
		host->id = SDC0_SLOT;
		host->pad_drv = SDC0_PAD_DRV;
		host->wdelay.delay_lowclk = SDC0_WDELAY_LOW_CLK;
		host->wdelay.delay_midclk = SDC0_WDELAY_MID_CLK;
		host->wdelay.delay_highclk = SDC0_WDELAY_HIGH_CLK;
		host->rdelay.delay_lowclk = SDC0_RDELAY_LOW_CLK;
		host->rdelay.delay_midclk = SDC0_RDELAY_MID_CLK;
		host->rdelay.delay_highclk = SDC0_RDELAY_HIGH_CLK;
	}
}

static void act_mmc_opt_regulator(struct gl520xmmc_host *host, bool enable)
{
	int ret = 0;

	if(!(IS_ERR(host->reg)|| NULL==host->reg))
	{
		if(enable)
		{
			//ret = regulator_enable(host->reg);

			if(ret)
			{
				printk("host%d regulator_enable fail\n",host->id);
			}
		}
		else
		{
			//ret = regulator_disable(host->reg);

			if(ret)
			{
				printk("host%d regulator_disable fail\n",host->id);
			}			
		}
	}
}

static int alloc_mmc_add_host_workqueue(struct gl520xmmc_host *host)
{
	/*char mmc_add_host_wq_name[OWL_MMC_WORK_QUEUE_NAME]={0};
	
	snprintf (mmc_add_host_wq_name, OWL_MMC_WORK_QUEUE_NAME,\
		      "host_add_work%d",host->id);

	host->add_host_wq = alloc_workqueue(mmc_add_host_wq_name,
			WQ_MEM_RECLAIM | WQ_NON_REENTRANT, 1);

	if(NULL == host->add_host_wq){
		printk("%s:alloc mmc_host_add workqueue fail\n",__FUNCTION__);
		return  -ENOMEM;
	}
	
	INIT_DELAYED_WORK(&(host->host_add_work), mmc_host_add_work);*/
	
	return 0;	
	
}

static int acts_mmc_get_power(struct gl520xmmc_host *host, struct device_node *np)
{
	/*const char *pm;
	int err;
	
	if (of_find_property(np, "sd_vcc", NULL)) {
		err = of_property_read_string(np, "sd_vcc", &pm);
		if (err < 0) {
			pr_err("SDC[%u] can not read SD_VCC power source\n",
				host->id);
			return -1;
		}

		host->reg = regulator_get(NULL, pm);
		if (IS_ERR(host->reg)) {
			pr_err("SDC[%u] failed to get regulator %s\n",
				host->id, "sd_vcc");
			return -1;
		}

		act_mmc_opt_regulator(host,REG_ENABLE);
	}*/

	return 0;
}

static int acts_mmc_clkfreq_notify(struct notifier_block *nb,
	unsigned long action, void *data)
{
	////

	return NOTIFY_OK;
}

static int acts_mmc_card_exist(struct mmc_host *mmc)
{
	return -ENOSYS;
}

static void acts_mmc_power_up(struct gl520xmmc_host *host)
{
	writel(SD_ENABLE | SD_EN_RESE, HOST_EN(host));
}

static void acts_mmc_power_on(struct gl520xmmc_host *host)
{
	mutex_lock(&host->pin_mutex);

	//if(acts_mmc_request_pinctrl(host) < 0)
	//{
	//	pr_err("SDC%d request pinctrl failed\n", host->id);
	//}

	mutex_unlock(&host->pin_mutex);

	// clocks is provided to eliminate power-up synchronization problems
	// enabel cmd irq

	writel(readl(HOST_STATE(host)) | SD_STATE_TEIE, HOST_STATE(host));

	// module function enable

	//acts_mmc_send_init_clk(host);
}

static void acts_mmc_power_off(struct gl520xmmc_host *host)
{
	mutex_lock(&host->pin_mutex);

	//if (acts_mmc_free_pinctrl(host) < 0)
	//	pr_err("SDC%d free pinctrl failed\n", host->id);

	mutex_unlock(&host->pin_mutex);
}

static void acts_mmc_set_clk(struct gl520xmmc_host *host, int rate)
{
	if (0 == rate) {
		pr_err("SDC%d set clock error\n", host->id);
		return;
		
	}


	if (rate <= 1000000) {
		
		writel((readl(HOST_CTL(host))  & (~(0xff << 16))) |
			SD_CTL_RDELAY(host->rdelay.delay_lowclk) |
			SD_CTL_WDELAY(host->wdelay.delay_lowclk),
			HOST_CTL(host));

	} else if ((rate > 1000000) && (rate <= 26000000)) {
		writel((readl(HOST_CTL(host))  & (~(0xff << 16))) |
			SD_CTL_RDELAY(host->rdelay.delay_midclk) |
			SD_CTL_WDELAY(host->wdelay.delay_midclk),
			HOST_CTL(host));

	} else if ((rate > 26000000) && (rate <= 52000000)) {

			writel((readl(HOST_CTL(host))  & (~(0xff << 16))) |
			SD_CTL_RDELAY(host->rdelay.delay_highclk) |
			SD_CTL_WDELAY(host->wdelay.delay_highclk),
			HOST_CTL(host));

	} else if ((rate > 52000000) && (rate <= 100000000)) {
		
		writel((readl(HOST_CTL(host))  & (~(0xff << 16))) |
			SD_CTL_RDELAY(6) |
			SD_CTL_WDELAY(4),
			HOST_CTL(host));

	} else {
		pr_err("SD3.0 max clock should not > 100Mhz\n");

	}

	host->read_delay_chain   = (readl(HOST_CTL(host)) & (0xf << 20))>>20;
	host->write_delay_chain  = (readl(HOST_CTL(host)) & (0xf << 16))>>16;	
	host->write_delay_chain_bak = host->write_delay_chain;
	host->read_delay_chain_bak  =  host->read_delay_chain;
	//module_clk_set_rate(host, rate);

}

static int acts_mmc_prepare_data(struct gl520xmmc_host *host, struct mmc_data *data)
{
	struct scatterlist *sg;

	enum dma_transfer_direction slave_dirn;

	int i, sglen;

	unsigned total;
	
	host->dmaflag = false;

	host->dma_terminate = false;

	writel(readl(HOST_EN(host)) | SD_EN_BSEL, HOST_EN(host));

	writel(data->blocks, HOST_BLK_NUM(host));

	writel(data->blksz, HOST_BLK_SIZE(host));

	total = data->blksz * data->blocks;

	if(total < 512)
	{
		writel(total , HOST_BUF_SIZE(host));
	}
	else
	{
		writel(512, HOST_BUF_SIZE(host));
	}

	for_each_sg(data->sg, sg, data->sg_len, i)
	{
		if(sg->offset & 3 || sg->length & 3)
		{
			pr_err("SD tag: non-word-aligned buffers or lengths.\n");
		}
	}

	if(data->flags & MMC_DATA_READ)
	{
		host->dma_dir = DMA_FROM_DEVICE;
		host->dma_conf.direction = slave_dirn = DMA_DEV_TO_MEM;
	}
	else
	{
		host->dma_dir = DMA_TO_DEVICE;
		host->dma_conf.direction = slave_dirn = DMA_MEM_TO_DEV;
	}

	sglen = dma_map_sg(host->dma->device->dev, data->sg, data->sg_len, host->dma_dir);

	//host->dma_slave.dma_dev = host->dma->device->dev;

	//host->dma_slave.trans_type = SLAVE;

	if(data->flags & MMC_DATA_READ)
	{
		//host->dma_slave.mode = _config_read_dma_mode(host->id);
	}
	else
	{
		//host->dma_slave.mode = _config_write_dma_mode(host->id);
	}

	//host->dma->private = (void *)&host->dma_slave;

	if(dmaengine_slave_config(host->dma, &host->dma_conf))
	{
		pr_err("Failed to config DMA channel\n");
	}

	host->desc = dmaengine_prep_slave_sg(host->dma, data->sg, sglen, slave_dirn, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

	if(!host->desc)
	{
		pr_err("dmaengine_prep_slave_sg() fail\n");
		return -EBUSY;
	}

	//host->desc->callback = acts_mmc_dma_complete;

	host->desc->callback_param = host;

	data->error = 0;

	return 0;
}

static int acts_mmc_send_command(struct gl520xmmc_host *host, struct mmc_command *cmd, struct mmc_data *data)
{
	u32 mode;
	u32 rsp[2];
	unsigned int cmd_rsp_mask = 0;
	u32 status ;
	int err = 0;

	cmd->error = 0;
	
	init_completion(&host->sdc_complete);
	
	switch(mmc_resp_type(cmd))
	{
	case MMC_RSP_NONE:
		mode = SD_CTL_TM(0);
		break;

	case MMC_RSP_R1:
		if(data) 
		{
			if(data->flags & MMC_DATA_READ)
			{
				mode = SD_CTL_TM(4);
			}
			else
			{
				mode = SD_CTL_TM(5);
			}
		}
		else
		{
			mode = SD_CTL_TM(1);
		}
		cmd_rsp_mask = SD_STATE_CLNR | SD_STATE_CRC7ER;
		break;

	case MMC_RSP_R1B:
		mode = SD_CTL_TM(3);
		cmd_rsp_mask = SD_STATE_CLNR | SD_STATE_CRC7ER;
		break;

	case MMC_RSP_R2:
		mode = SD_CTL_TM(2);
		cmd_rsp_mask = SD_STATE_CLNR  | SD_STATE_CRC7ER;
		break;

	case MMC_RSP_R3:
		mode = SD_CTL_TM(1);
		cmd_rsp_mask = SD_STATE_CLNR ;
		break;

	default:
		pr_err("no math command RSP flag %x\n", cmd->flags);
		cmd->error = -1;
		return MMC_CMD_COMPLETE;
	}
	

	// keep current RDELAY & WDELAY value

	mode |= (readl(HOST_CTL(host)) & (0xff << 16));
	
	// start to send corresponding command type

	writel(cmd->arg, HOST_ARG(host));

	writel(cmd->opcode, HOST_CMD(host));
	
	// set lbe to send clk after busy
	if(data)
	{
		mode |= (SD_CTL_TS |SD_CTL_LBE| 0xE4000000);
	}
	else
	{
		mode  &= ~(SD_CTL_TOUTEN|SD_CTL_LBE);
		mode  |=  SD_CTL_TS ;
	}

 	// start transfer

	writel(mode, HOST_CTL(host));
	
	pr_debug("SDC%d send CMD%d, SD_CTL=0x%x\n", host->id, cmd->opcode, readl(HOST_CTL(host)));
	
	if(data)
	{
		return DATA_CMD;
	}
	
	// wait for cmd finish

	//if(!wait_for_completion_timeout(&host->sdc_complete, 30*HZ))
	//{
	//	pr_err("!!!host%d:cmd wait ts interrupt timeout\n",host->id);
	//
	//	cmd->error = CMD_TS_TIMEOUT;
	//
	//	act_dump_reg(host);
	//	goto out;
	//}
	
	status = readl(HOST_STATE(host));

	if (cmd->flags & MMC_RSP_PRESENT)
	{
		if(cmd_rsp_mask & status)
		{
			if(status & SD_STATE_CLNR)
			{	
				cmd->error = CMD_RSP_ERR;
				goto out;
			}	
			
			if(status & SD_STATE_CRC7ER)
			{	
				cmd->error = -EILSEQ;

				host->read_delay_chain --;

				if(host->read_delay_chain < 0)
				{
					host->read_delay_chain = 0xf;
				}

				writel((readl(HOST_CTL(host))  & (~(0xff << 16))) |
					SD_CTL_RDELAY(host->read_delay_chain) |
					SD_CTL_WDELAY(host->write_delay_chain),
					HOST_CTL(host));
				
				printk(KERN_DEBUG "cmd:try read delay chain:%d\n",
				host->read_delay_chain);
				
				pr_err("cmd:SDC%d send CMD%d, CMD_RSP_CRC_ERR\n",
					host->id, cmd->opcode);	
				
				goto out;
			}	
	
		}
		
		if (cmd->flags & MMC_RSP_136)
		{	
			cmd->resp[3] = readl(HOST_RSPBUF0(host));	
			cmd->resp[2] = readl(HOST_RSPBUF1(host));	
			cmd->resp[1] = readl(HOST_RSPBUF2(host));	
			cmd->resp[0] = readl(HOST_RSPBUF3(host));	
		}
		else
		{		
			rsp[0] = readl(HOST_RSPBUF0(host));		
			rsp[1] = readl(HOST_RSPBUF1(host));	
			cmd->resp[0] = rsp[1] << 24 | rsp[0] >> 8;		
			cmd->resp[1] = rsp[1] >> 8;	
		}	
	}	
	
out:
	return  PURE_CMD;
}

static void acts_mmc_finish_request(struct gl520xmmc_host *host)
{
	struct mmc_request *mrq;

	struct mmc_data *data;

	mrq = host->mrq;

	host->mrq = NULL;

	if(mrq->data)
	{
		data = mrq->data;

		dma_unmap_sg(host->dma->device->dev, data->sg, data->sg_len, host->dma_dir);
	}

	mmc_request_done(host->mmc, mrq);
}

static void acts_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
{
	struct gl520xmmc_host *host = mmc_priv(mmc);

	int ret = 0;

	int err = 0;

	static unsigned int time = 0;

	static  bool flag = false;

	unsigned long flags;

	// the pointer being not NULL means we are making request on sd/mmc,
	// which will be reset to NULL in finish_request.

	host->mrq = mrq;
	
	if(mrq->data)
	{
		ret = acts_mmc_prepare_data(host, mrq->data);

		if(ret != 0)
		{
			pr_err("SD DMA transfer: prepare data error\n");

			mrq->data->error = ret;

			acts_mmc_finish_request(host);

			return;
		}
		else
		{
			init_completion(&host->dma_complete);

			dmaengine_submit(host->desc);

			dma_async_issue_pending(host->dma);
		}
	}

	ret = acts_mmc_send_command(host, mrq->cmd, mrq->data);
	
chec_err:	
	if(ret == DATA_CMD)
	{
		//if(!wait_for_completion_timeout(&host->sdc_complete,  10*HZ))
		//{
		//	pr_err("!!!host%d:wait date transfer ts intrupt timeout\n",host->id);
		//}	
		
		//DEBUG("host%d: wait date sdc_complete OK\n",host->id);
		
		/*if(act_check_trs_date_status(host , mrq))
		{
		 	pr_err("!!!host%d err:act_check_trs_date_status\n",host->id);

			act_dump_reg(host);

			pr_err("Entry SD/MMC module error reset\n");
			
			host->dma_terminate = true ;

			dmaengine_terminate_all(host->dma);

			acts_mmc_err_reset(host);

			pr_err("Exit SD/MMC module error reset\n");

			goto finish;
		}
	 
		if (!wait_for_completion_timeout(&host->dma_complete,  5*HZ)) {
			pr_err("!!!host%d:dma transfer completion timeout\n",host->id);

			pr_err("!!!host%d:dmaflag:%d\n",host->id ,host->dmaflag);
			mrq->data->error = CMD_DATA_TIMEOUT;
			mrq->cmd->error = -ETIMEDOUT;	
			act_dump_reg(host);
			pr_err("Entry SD/MMC module error reset\n");		
			host->dma_terminate = true ;			
			dmaengine_terminate_all(host->dma);
			acts_mmc_err_reset(host);
			pr_err("Exit SD/MMC module error reset\n");
			goto finish;

		}*/
		
		if (mrq->data->stop)
		{
			// send stop cmd

			acts_mmc_send_command(host, mrq->data->stop, NULL);

			if(mrq->data->stop->error)
			{
				//act_dump_reg(host);

				pr_err("Entry SD/MMC module error reset\n");
	
				//acts_mmc_err_reset(host);

				pr_err("Exit SD/MMC module error reset\n");

				goto finish;
			}
		}

		mrq->data->bytes_xfered = mrq->data->blocks * mrq->data->blksz;
	}

finish:
	acts_mmc_finish_request(host);
}

static void acts_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
{
	struct gl520xmmc_host *host = mmc_priv(mmc);

	u32 ctrl_reg;

	if(ios->power_mode != host->power_state)
	{
		host->power_state = ios->power_mode;

		switch (ios->power_mode)
		{
		case MMC_POWER_UP:
			pr_debug("\tMMC_POWER_UP\n");
			acts_mmc_power_up(host);
			break;

		case MMC_POWER_ON:
			pr_debug("\tMMC_POWER_ON\n");
			acts_mmc_power_on(host);
			break;

		case MMC_POWER_OFF:
			pr_debug("\tMMC_POWER_OFF\n");
			acts_mmc_power_off(host);
			break;

		default:
			pr_err("Power mode not supported\n");
		}
	}

	if (ios->clock && ios->clock != host->clock)
	{
		host->clock = ios->clock;

		pr_debug("\tSet clock: %d\n", host->clock);

		acts_mmc_set_clk(host, ios->clock);
	}

	ctrl_reg = readl(HOST_EN(host));

	host->bus_width = ios->bus_width;

	switch(ios->bus_width)
	{
	case MMC_BUS_WIDTH_8:
		ctrl_reg &= ~0x3;
		ctrl_reg |= 0x2;
		break;

	case MMC_BUS_WIDTH_4:
		ctrl_reg &= ~0x3;
		ctrl_reg |= 0x1;
		break;

	case MMC_BUS_WIDTH_1:
		ctrl_reg &= ~0x3;
		break;
	}
	
	if(ios->chip_select != host->chip_select)
	{
		host->chip_select = ios->chip_select;

		switch(ios->chip_select)
		{
		case MMC_CS_DONTCARE:
			break;

		case MMC_CS_HIGH:
			ctrl_reg &= ~0x3;
			ctrl_reg |= 0x1;
			break;

		case MMC_CS_LOW:
			ctrl_reg &= ~0x3;
			break;
		}
	}

	if(ios->timing != host->timing)
	{
		host->timing = ios->timing;

		if(ios->timing == MMC_TIMING_UHS_DDR50)
		{
			ctrl_reg |= (1 << 2);
		}
	}

	switch (ctrl_reg & 0x3)
	{
	case 0x2:
		pr_debug("\tMMC_BUS_WIDTH_8\n");
		break;
	case 0x1:
		pr_debug("\tMMC_BUS_WIDTH_4\n");
		break;
	case 0x0:
		pr_debug("\tMMC_BUS_WIDTH_1\n");
		break;
	default:
		pr_debug("\tMMC_BUS_WIDTH NOT known\n");
	}

	writel(ctrl_reg, HOST_EN(host));
}

static void acts_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
{
	struct gl520xmmc_host *host = mmc_priv(mmc);

	unsigned long flags;

	u32 state;

	spin_lock_irqsave(&host->lock, flags);

	state = readl(HOST_STATE(host));

	if(enable)
	{
		state |= SD_STATE_SDIOA_EN;
		state &= ~SD_STATE_SDIOA_P;
		state &= ~SD_STATE_TEI;
	}
	else
	{
		state |= SD_STATE_SDIOA_P;
		state &= ~SD_STATE_SDIOA_EN;
		state &= ~SD_STATE_TEI;
	}

	writel(state, HOST_STATE(host));

	spin_unlock_irqrestore(&host->lock, flags);
}

static int acts_mmc_signal_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
{
	struct gl520xmmc_host *host = mmc_priv(mmc);

	u32 state;

	int i = 0;

	int ret = 0;

	if(ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
	{
		goto out;
	}
	else if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180)
	{
		// stop send clk until 5ms later
		mdelay(5);

		// switch host voltage to 1.8v and delay 10ms
		writel(readl(HOST_EN(host)) | SD_EN_S18EN, HOST_EN(host));

		mdelay(10);

		// send continuous clock
		writel(readl(HOST_CTL(host)) | SD_CTL_SCC, HOST_CTL(host));

		for(i = 0; i < 100; i++)
		{
			state = readl(HOST_STATE(host));

			if((state & SD_STATE_CMDS) && (state & SD_STATE_DAT0S))
			{
				break;
			}

			udelay(100);
		}

		if(i >= 100)
		{
			pr_err("SDC%d level error, voltage switch failed\n", host->id);
			ret = -EINVAL;
		}

		// stop to send continuous clock
		writel(readl(HOST_CTL(host)) & ~SD_CTL_SCC, HOST_CTL(host));
	}

out:
	return ret;
}

static int acts_mmc_busy(struct mmc_host *mmc)
{
	unsigned int state;

	unsigned int i = 0;

	struct gl520xmmc_host *host = mmc_priv(mmc);

	state = readl(HOST_STATE(host));

	while((state & SD_STATE_CMDS) || (state & SD_STATE_DAT0S))
	{
		if(i >= 100)
		{
			pr_err("%s:SDC%d level error, CMD11 send failed\n", __FUNCTION__,host->id);
			return 0;   
		}

		i++;

		udelay(100);

		state = readl(HOST_STATE(host));
	}

	return 1; //not busy
}

static const struct mmc_host_ops acts_mmc_ops = {
	.get_cd	= acts_mmc_card_exist,
	.request = acts_mmc_request,
	.set_ios = acts_mmc_set_ios,
	.enable_sdio_irq = acts_mmc_enable_sdio_irq,
	.start_signal_voltage_switch = acts_mmc_signal_voltage_switch,
	.card_busy = acts_mmc_busy,
};

static int acts_mmc_probe(struct platform_device *pdev)
{
	struct mmc_host *mmc;

	struct gl520xmmc_host *host;

	struct resource *res;

	dma_cap_mask_t mask;

	struct device_node *dn = pdev->dev.of_node;

	int ret = 0;

	mmc = mmc_alloc_host(sizeof(struct gl520xmmc_host), &pdev->dev);

	if(!mmc)
	{
		dev_err(&pdev->dev, "require memory for mmc_host failed\n");
		ret = -ENOMEM;

		goto out;
	}

	host = mmc_priv(mmc);

	spin_lock_init(&host->lock);

	mutex_init(&host->pin_mutex);

	host->mmc = mmc;

	host->power_state = host->bus_width = host->chip_select = -1;

	host->clock = 0;

	host->mrq = NULL;

	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

	if(!res)
	{
		dev_err(&pdev->dev, "no memory resource\n");
		ret = -ENODEV;

		goto out_free_host;
	}

	if(!request_mem_region(res->start, resource_size(res), pdev->name))
	{
		dev_err(&pdev->dev, "Unable to request register region\n");
		return -EBUSY;
	}

	host->iobase = ioremap(res->start, resource_size(res));

	if(host->iobase == NULL)
	{
		dev_err(&pdev->dev, "Unable to ioremap register region\n");
		return -ENXIO;
	}

	host->start = res->start;
	
	host->type_expected = of_get_card_type(dn);

	if(host->type_expected < 0)
	{
		goto out_free_host;
	}
	
	acts_mmc_sdc_config(host);

	if(alloc_mmc_add_host_workqueue(host))
	{
		pr_info("SDC%d request dma queue fail\n", host->id);

		goto err_dma_workqueue; 
	}

	memset(&host->nblock, 0, sizeof(host->nblock));

	host->nblock.notifier_call = acts_mmc_clkfreq_notify;

	ret = acts_mmc_get_power(host, dn);

	if(ret < 0)
	{
		goto err_add_host_workqueue;
	}

	// Request DMA channel

	dma_cap_zero(mask);

	dma_cap_set(DMA_SLAVE, mask);

	host->dma = dma_request_channel(mask, NULL, NULL);

	if(!host->dma)
	{
		dev_err(&pdev->dev, "Failed to request DMA channel\n");

		ret = -ENODEV;
		goto output_regulator;
	}

	dev_info(&pdev->dev, "using %s for DMA transfers\n", dma_chan_name(host->dma));

	host->dma_conf.src_addr = HOST_DAT_DMA(host);

	host->dma_conf.dst_addr = HOST_DAT_DMA(host);

	host->dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;

	host->dma_conf.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;

	host->dma_conf.device_fc = false;

	mmc->ops = &acts_mmc_ops;

	mmc->f_min = 100000;

	if(SDC0_SLOT == host->id)
	{
		mmc->f_max = 50000000; 
	}
	else
	{
		mmc->f_max = 100000000;
	}
 
	mmc->max_seg_size = 256 * 512;
	mmc->max_segs = 128;
	mmc->max_req_size = 512 * 256;
	mmc->max_blk_size = 512;
	mmc->max_blk_count = 256;

	mmc->ocr_avail = ACTS_MMC_OCR;

	mmc->caps = MMC_CAP_NEEDS_POLL | MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED | MMC_CAP_4_BIT_DATA;

	mmc->caps2 = MMC_CAP2_BOOTPART_NOACC;

	if(mmc_card_expected_emmc(host->type_expected))
	{
		mmc->caps |= MMC_CAP_1_8V_DDR | MMC_CAP_UHS_DDR50 | MMC_CAP_8_BIT_DATA;
	}

	// emmc and sd card support earse (discard,trim,sediscard)

	if(mmc_card_expected_emmc(host->type_expected))
	{
		mmc->caps |= MMC_CAP_ERASE;
	}

	// SD3.0 support

	if(SDC0_SLOT == host->id)
	{	
		mmc->caps |= MMC_CAP_UHS_SDR12 | MMC_CAP_UHS_SDR25 | MMC_CAP_UHS_SDR50;
	}

	if(mmc_card_expected_emmc(host->type_expected))
	{
		mmc->caps &= ~MMC_CAP_NEEDS_POLL;

		mmc->caps |= MMC_CAP_NONREMOVABLE;

		res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);

		if(!res)
		{
			dev_err(&pdev->dev, "can not get sdc transfer end irq resource\n");

			ret = -ENODEV;
			goto out_free_dma;
		}

		host->sdc_irq = res->start;

		//ret = request_irq(host->sdc_irq, (irq_handler_t)acts_sdc_irq_handler, 0, "emmc", host);

		if(ret < 0)
		{
			dev_err(&pdev->dev, "request eMMC SDC transfer end interrupt failed\n");
			goto out_free_dma;
		}
	}
	else
	{
		dev_err(&pdev->dev, "SDC%d not supported %d\n", host->id, host->type_expected);

		ret = -ENXIO;
		goto out_free_dma;
	}

	platform_set_drvdata(pdev, host);

	return 0;


out_free_sdc_irq:
	if(mmc_card_expected_emmc(host->type_expected))
	{
		//free_irq(host->sdc_irq, host);
	}

out_free_dma:
	if(host->dma)
	{
		dma_release_channel(host->dma);
	}

output_regulator:
	if(host->reg)
	{
		//regulator_disable(host->reg);
		//regulator_put(host->reg);
	}

err_add_host_workqueue:
	destroy_workqueue(host->add_host_wq);

err_dma_workqueue:
	destroy_workqueue(host->dma_wq);

out_free_host:
	mmc_free_host(mmc);

out:
	return ret;
}

static int __exit acts_mmc_remove(struct platform_device *pdev)
{
	struct gl520xmmc_host *host = platform_get_drvdata(pdev);

	if(host)
	{
		mmc_remove_host(host->mmc);

		if(mmc_card_expected_emmc(host->type_expected))
		{
			//free_irq(host->sdc_irq, host);
		}

		if(host->dma)
		{
			dma_release_channel(host->dma);
		}

		act_mmc_opt_regulator(host, REG_DISABLE);

		mmc_free_host(host->mmc);

		platform_set_drvdata(pdev, NULL);
	}

	return 0;
}

static const struct of_device_id acts_mmc_dt_match[]  = {
	{.compatible = "actions,owl-mmc", },
	{}
};

static struct platform_driver acts_mmc_driver = {
	.probe = acts_mmc_probe,
	.remove = acts_mmc_remove,
	.driver = {
		.name = "owl_mmc",
		.owner = THIS_MODULE,
		.of_match_table = acts_mmc_dt_match,
	},
};

static int __init acts_mmc_init(void)
{
	int ret;

	ret = platform_driver_register(&acts_mmc_driver);

	if(ret != 0)
	{
		pr_err("SD/MMC controller driver register failed\n");
		ret = -ENOMEM;
	}

	return ret;
}

module_init(acts_mmc_init);

static void __exit acts_mmc_exit(void)
{
	platform_driver_unregister(&acts_mmc_driver);
}

module_exit(acts_mmc_exit);

MODULE_LICENSE("GPL");

