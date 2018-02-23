#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/err.h>
#include <linux/slab.h>
#include <linux/types.h>
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/i2c.h>
#include <linux/init.h>
#include <linux/clk.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <linux/cpufreq.h>
#include <linux/errno.h>
#include <linux/ctype.h>
#include <linux/uaccess.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/pinctrl/consumer.h>

static int info_switch;
static int err_switch;

#define OWL_SDRAM_BASE UL(0x00000000)
#define OWL_IO_DEVICE_BASE UL(0xB0000000)
#define OWL_IO_ADDR_BASE 0xF8000000

#ifdef CONFIG_MMU
#define IO_ADDRESS(x) (OWL_IO_ADDR_BASE + ((x) & 0x03ffffff))
#else
#define IO_ADDRESS(x) (x)
#endif

#define __io_address(n)	__io(IO_ADDRESS(n))

#define owl_dump_mem(a, b, c, d)           do {} while (0);

#ifdef I2C_DEBUG_INFO
#define i2c_dbg(fmt, args...)   \
    printk(KERN_INFO fmt, ##args)
#else
#define i2c_dbg(fmt, args...)   \
    do {} while(0)
#endif

#ifdef I2C_DEBUG_WARNING
#define i2c_warn(fmt, args...)  \
    printk(KERN_WARNING "owl_i2c: "fmt, ##args)
#else
#define i2c_warn(fmt, args...)   \
    do {} while(0)
#endif

#ifdef I2C_DEBUG_SWITCH
#define i2c_info(fmt, args...) do { \
	if (info_switch) \
		pr_info(fmt, ##args); \
	} while (0)

#define i2c_err(fmt, args...)  do { \
	if (err_switch) \
		pr_err(fmt, ##args); \
	} while (0)
#else
	#define i2c_info(fmt, args...)
	#define i2c_err(fmt, args...)
#endif

#define I2C_CTL                     0x0000          /* I2C Control Register */
#define I2C_CLKDIV                  0x0004          /* I2C Clock Divide Register */
#define I2C_STAT                    0x0008          /* I2C Status Register */
#define I2C_ADDR                    0x000C          /* I2C Address Register */
#define I2C_TXDAT                   0x0010          /* I2C TX Data Register */
#define I2C_RXDAT                   0x0014          /* I2C RX Data Register */
#define I2C_CMD                     0x0018          /* I2C Command Register */
#define I2C_DATCNT                  0x0024          /* I2C Data transmit counter */
#define I2C_RCNT                    0x0028          /* I2C Data transmit remain counter */

/* I2Cx_CTL */
#define I2C_CTL_GRAS                (0x1 << 0)      /* Generate ACK or NACK Signal */
#define I2C_CTL_GRAS_ACK            0            /* generate the ACK signal at 9th clock of SCL */
#define I2C_CTL_GRAS_NACK           I2C_CTL_GRAS /* generate the NACK signal at 9th clock of SCL */
#define I2C_CTL_RB                  (0x1 << 1)     /* Release Bus */
#define I2C_CTL_GBCC_MASK           (0x3 << 2)     /* Loop Back Enable */
#define I2C_CTL_GBCC(x)             (((x) & 0x3) << 2)
#define I2C_CTL_GBCC_NONE           I2C_CTL_GBCC(0)
#define I2C_CTL_GBCC_START          I2C_CTL_GBCC(1)
#define I2C_CTL_GBCC_STOP           I2C_CTL_GBCC(2)
#define I2C_CTL_GBCC_RESTART        I2C_CTL_GBCC(3)
#define I2C_CTL_IRQE                (0x1 << 5)     /* IRQ Enable */
#define I2C_CTL_PUEN                (0x1 << 6)     /* Internal Pull-Up resistor (1.5k) enable. */
#define I2C_CTL_EN                  (0x1 << 7)     /* Enable. When enable, reset the status machine to IDLE */
#define I2C_CTL_AE                  (0x1 << 8)     /* Arbitor enable */

/* I2Cx_CLKDIV */
#define I2C_CLKDIV_DIV_MASK         (0xff << 0)     /* Clock Divider Factor (only for master mode). */
#define I2C_CLKDIV_DIV(x)           (((x) & 0xff) << 0)

/* I2Cx_STAT */
#define I2C_STAT_RACK               (0x1 << 0)      /* Receive ACK or NACK when transmit data or address */
#define I2C_STAT_BEB                (0x1 << 1)      /* IRQ Pending Bit, Write ¡°1¡± to clear this bit */
#define I2C_STAT_IRQP               (0x1 << 2)      /* IRQ Pending Bit, Write ¡°1¡± to clear this bit */
#define I2C_STAT_LAB                (0x1 << 3)      /* Lose arbitration bit, Write ¡°1¡± to clear this bit */
#define I2C_STAT_STPD               (0x1 << 4)      /* Stop detect bit, Write ¡°1¡± to clear this bit */
#define I2C_STAT_STAD               (0x1 << 5)      /* Start detect bit, Write ¡°1¡± to clear this bit */
#define I2C_STAT_BBB                (0x1 << 6)      /* Bus busy bit */
#define I2C_STAT_TCB                (0x1 << 7)      /* Transfer complete bit */
#define I2C_STAT_LBST               (0x1 << 8)      /* Last Byte Status Bit, 0: address, 1: data */
#define I2C_STAT_SAMB               (0x1 << 9)      /* Slave address match bit */
#define I2C_STAT_SRGC               (0x1 << 10)     /* Slave receive general call */

#define I2C_BUS_ERR_MSK             ( I2C_STAT_LAB | I2C_STAT_BEB)

/* I2Cx_CMD */
#define I2C_CMD_SBE                 (0x1 << 0)      /* Start bit enable */
#define I2C_CMD_AS_MASK             (0x7 << 1)      /* Address select */
#define I2C_CMD_AS(x)               (((x) & 0x7) << 1)
#define I2C_CMD_RBE                 (0x1 << 4)      /* Restart bit enable */
#define I2C_CMD_SAS_MASK            (0x7 << 5)      /* Second Address select */
#define I2C_CMD_SAS(x)              (((x) & 0x7) << 5)
#define I2C_CMD_DE                  (0x1 << 8)      /* Data enable */
#define I2C_CMD_NS                  (0x1 << 9)      /* NACK select */
#define I2C_CMD_SE                  (0x1 << 10)     /* Stop enable */
#define I2C_CMD_MSS                 (0x1 << 11)     /* MSS Master or slave mode select */
#define I2C_CMD_WRS                 (0x1 << 12)     /* Write or Read select */
#define I2C_CMD_EXEC                (0x1 << 15)     /* Start to execute the command list */

#define I2C_CTL_START_CMD               (  \
          I2C_CTL_IRQE |   \
          I2C_CTL_EN |     \
          I2C_CTL_GBCC_START |    \
          I2C_CTL_PUEN |     \
          I2C_CTL_RB   \
         )

#define I2C_CTL_STOP_CMD                (  \
            I2C_CTL_EN |  \
            I2C_CTL_PUEN | \
            I2C_CTL_GBCC_STOP | \
            I2C_CTL_RB | \
            I2C_CTL_IRQE \
        )

#define I2C_CTL_RESTART_CMD             ( \
            I2C_CTL_IRQE | \
            I2C_CTL_EN | \
            I2C_CTL_GBCC_RESTART | \
            I2C_CTL_PUEN | \
            I2C_CTL_RB \
        )
        
#define I2C_MODULE_CLK		(100*1000*1000)
#define I2C_CLK_HDMI                    (87*1000)
#define I2C_TRANS_TIMEOUT               (5*HZ)
#define I2C_STATE_DEFAULT "default"

enum i2c_state {
    INVALIDSTATE,
    RESTARTSTATE,
    STARTSTATE,
    WRITESTATE,
    READSTATE,
    STOPSTATE,
};

struct pin_state{
	struct pinctrl *p;
	struct pinctrl_state *s;
};

struct owl_i2c_dev {
    struct device       *dev;
    struct resource     *ioarea;
    struct i2c_adapter  adapter;
    struct completion   cmd_complete;
    struct i2c_msg      *msgs;
    struct mutex        mutex;
    wait_queue_head_t   waitqueue;
    unsigned int        msg_num;
    unsigned int        msg_idx;
    unsigned int        msg_ptr;
	int i2c_addr_type;	/*1: HDMI,0 else */

    spinlock_t          lock;
    enum i2c_state           state;
    void __iomem        *base;      /* virtual */
    unsigned long       phys;
    u32                 speed;      /* Speed of bus in Khz */
    u32                 i2c_freq;
    u32                 i2c_freq_cfg;
    struct clk          *clk;
	struct clk *i2c_clk;
    int                 irq;
    u8                  rev;
    uint                in_suspend_state;
    struct pin_state    i2c_pin_state;
};

static inline void owl_i2c_writel(struct owl_i2c_dev *i2c_dev, u32 val, int reg)
{
    i2c_dbg("-->>write 0x%x to 0x%x\n",val, (u32)(i2c_dev->base +reg));
    
    __raw_writel(val, i2c_dev->base + reg);
}

static inline u32 owl_i2c_readl(struct owl_i2c_dev *i2c_dev, int reg)
{
    return __raw_readl(i2c_dev->base + reg);
}

static void owl_i2c_message_restart(struct owl_i2c_dev *dev, struct i2c_msg *msg)
{
    u16 addr = (msg->addr & 0x7f) << 1;
    u32 ctl;

    i2c_dbg("%s()\n", __FUNCTION__);

    if(msg->flags & I2C_M_RD) {
        addr |= 1;
    }

    ctl = (owl_i2c_readl(dev, I2C_CTL) & ~I2C_CTL_GBCC_MASK) | I2C_CTL_GBCC_RESTART | I2C_CTL_RB;
    
    owl_i2c_writel(dev, addr, I2C_TXDAT);
    owl_i2c_writel(dev, ctl, I2C_CTL);
}

static void owl_master_trans_completion(struct owl_i2c_dev *dev, int retval)
{
    i2c_dbg("I2C Trans complete %s\n", retval? "failed" : "successfully");

    dev->msgs = NULL;
    dev->msg_num = 0;
    dev->msg_ptr = 0;
    dev->msg_idx++;
    
    if(retval) {
        dev->msg_idx = retval;
    }

    wake_up(&dev->waitqueue);
}

static void owl_i2c_stop(struct owl_i2c_dev *dev, int retval)
{
    u32 ctl;

    i2c_dbg("%s(): retval %d\n", __FUNCTION__, retval);

    dev->state = STOPSTATE;
    
    ctl = I2C_CTL_EN | I2C_CTL_GBCC_STOP | I2C_CTL_RB ;
    
    owl_i2c_writel(dev, ctl, I2C_CTL);
    
    udelay(10);
    
    owl_master_trans_completion(dev, retval);
}

static inline void owl_i2c_clear_tcb(struct owl_i2c_dev *dev)
{
    volatile unsigned int tmp;
    int retry_times = 10;

    i2c_dbg("clear tcb\n");

    do
    {
        tmp = owl_i2c_readl(dev, I2C_STAT) | I2C_STAT_IRQP;
        
        owl_i2c_writel(dev, tmp, I2C_STAT);

        // ensure write finished
        
        tmp = owl_i2c_readl(dev, I2C_STAT);
        
        if(!(tmp & I2C_STAT_IRQP)) {
            return;
        }

        retry_times--;
    } 
    while (retry_times > 0);

    // clear IRQ pending timeout, we have to reset the I2C controller

    i2c_warn("%s(): [i2c%d] clear IRQ pending error! reset controller\n", __FUNCTION__, dev->adapter.nr);

    // reset I2C controller
    
    owl_i2c_writel(dev, owl_i2c_readl(dev, I2C_CTL) & ~I2C_CTL_EN, I2C_CTL);
    
    udelay(1);
    
    owl_i2c_writel(dev, owl_i2c_readl(dev, I2C_CTL) | I2C_CTL_EN, I2C_CTL);
    
    udelay(1);
}

static inline int isMsgEnd(struct owl_i2c_dev *dev)
{
    return (dev->msg_ptr == (dev->msgs->len - 1));
}

static inline int isLastMsg(struct owl_i2c_dev *dev)
{
    return (dev->msg_idx == (dev->msg_num - 1));
}

static inline int isMsgFinish(struct owl_i2c_dev *dev)
{
    return (dev->msg_ptr >= dev->msgs->len);
}

static int owl_i2c_irq_nextbyte(struct owl_i2c_dev *dev, unsigned int status)
{
    u8 byte, ctl_reg, spec = 0;
    int ret = 0;
    unsigned long flags;

    i2c_dbg("%s(): status 0x%x, dev->state 0x%x\n", __FUNCTION__, status, dev->state);

    spin_lock_irqsave(&dev->lock, flags);
    
    switch(dev->state)
    {
        case STOPSTATE:
            i2c_dbg("%s(): STOPSTATE\n", __FUNCTION__);
            goto out;
            
        case STARTSTATE:
            i2c_dbg("%s(): STARTSTATE\n", __FUNCTION__);

            if(dev->msgs->flags & I2C_M_RD) {
                dev->state = READSTATE;
            }
            else {
                dev->state = WRITESTATE;
            }

            if(dev->msgs->len == 0)
            {
                owl_i2c_stop(dev, 0);
                goto out;
            }
            
            i2c_dbg("%s(): -> dev->state 0x%x\n", __FUNCTION__, dev->state);

            if(dev->state == READSTATE ) {
                goto pre_read;
            } 
            else if(dev->state == WRITESTATE) {
                goto retry_write;
            }

        case READSTATE:

            i2c_dbg("%s(): READSTATE\n", __FUNCTION__);

            byte = owl_i2c_readl(dev, I2C_RXDAT);
            
            dev->msgs->buf[dev->msg_ptr++] = byte;
            
pre_read:
            i2c_dbg("%s(): READSTATE - %d, %d, %d\n", __FUNCTION__, isMsgEnd(dev), isMsgFinish(dev), isLastMsg(dev));

            if(isMsgEnd(dev))
            {
                spec = I2C_CTL_GRAS;
            }
            else if(isMsgFinish(dev))
            {
                if(!isLastMsg(dev))
                {
                    dev->msgs++;
                    dev->msg_idx++;
                    dev->msg_ptr = 0;
                    dev->state = STARTSTATE;
                    
                    owl_i2c_message_restart(dev, dev->msgs);
                    goto out;
                }
                else
                {
                    owl_i2c_stop(dev, 0);
                    goto out;
                }
            }
            break;

        case WRITESTATE:
            i2c_dbg("%s(): WRITESTATE\n", __FUNCTION__);

retry_write:
            i2c_dbg("%s(): WRITESTATE - %d, %d, %d\n", __FUNCTION__,
                isMsgEnd(dev), isMsgFinish(dev), isLastMsg(dev));

            if(!isMsgFinish(dev))
            {
                byte = dev->msgs->buf[dev->msg_ptr++];
                owl_i2c_writel(dev, byte, I2C_TXDAT);
            } 
            else if(!isLastMsg(dev))
            {
                dev->msgs++;
                dev->msg_idx++;
                dev->msg_ptr = 0;
                dev->state = STARTSTATE;
                
                owl_i2c_message_restart(dev, dev->msgs);
                goto out;
            }
            else
            {
                owl_i2c_stop(dev, 0);
                goto out;
            }

            break;
        default:
            i2c_warn("Invalid State..\n");
            ret = -EINVAL;
            break;
    }

    ctl_reg = (owl_i2c_readl(dev, I2C_CTL) & ~I2C_CTL_GBCC_MASK) | I2C_CTL_GBCC_NONE | I2C_CTL_RB | spec;
    owl_i2c_writel(dev, ctl_reg, I2C_CTL);
    
out:
    spin_unlock_irqrestore(&dev->lock, flags);
    
    return ret;
}

static irqreturn_t owl_i2c_interrupt(int irq, void *dev_id)
{
    struct owl_i2c_dev *dev = dev_id;
    unsigned int status = 0, ctl_reg = 0;
    int flags, stop_detected;
    
    i2c_dbg("%s(): irq %d, I2C_STAT 0x%x, dev->state %d\n", __FUNCTION__, irq, owl_i2c_readl(dev, I2C_STAT), dev->state);

    stop_detected = (owl_i2c_readl(dev, I2C_STAT) & I2C_STAT_STPD) ? 1 : 0;

    // clear STPD/IRQP
    
    owl_i2c_clear_tcb(dev);

    status = owl_i2c_readl(dev, I2C_STAT);
    
    if(status & I2C_BUS_ERR_MSK)
    {
        i2c_warn("I2C trans failed <stat: 0x%x>\n", status);
        goto out;
    }

    if(dev->state == STOPSTATE) {
        goto out;
    }

    if(dev->msgs == NULL)
    {
        i2c_warn("I2C: skip spurious interrupt, status 0x%x\n", status);
        goto out;
    }

    flags = dev->msgs->flags;

    ctl_reg = owl_i2c_readl(dev, I2C_CTL);
    
    if (!(flags & I2C_M_RD) && !(flags & I2C_M_IGNORE_NAK))
    {
        if(status & I2C_STAT_RACK) {
            i2c_dbg("ACK\n");                   
        }
        else
        {                    
            i2c_warn("No Ack\n");
            goto no_ack;
        }
    }

    owl_i2c_irq_nextbyte(dev, status);

out:
    return IRQ_HANDLED;
    
no_ack:
    owl_i2c_stop(dev, -ENXIO);
    goto out;
}

static int owl_i2c_set_speed(struct owl_i2c_dev *dev)
{
	u32 ret = 0;
	u32 freq = 0;
	u32 divide = 0;
	
	ret = of_property_read_u32(dev->dev->of_node, "clock-frequency", &freq);
	
	if(ret)
	{
		ret = -ENODATA;
		goto of_property_read_err;
	}
	
	if(freq == 0)
	{
		ret = -EINVAL;
		goto freq_err;
	}
	
	dev->i2c_addr_type = 0;
	
	dev->i2c_freq_cfg = dev->i2c_freq = freq;
	
	divide = I2C_MODULE_CLK / (freq * 16);
	
	owl_i2c_writel(dev, divide, I2C_CLKDIV);
	
	return 0;

of_property_read_err:
	i2c_err("of_property_read_u32() failed\n");
	return ret;
	
freq_err:
	i2c_err("freq error\n");
	return ret;
}

static void owl_i2cdev_reinit(struct owl_i2c_dev *dev)
{
	u32 iiccon = I2C_CTL_EN | I2C_CTL_IRQE | I2C_CTL_PUEN;
	
	i2c_dbg("owl_i2cdev_reinit\n");

	if(owl_i2c_set_speed(dev)) {
		i2c_err("owl_i2c_set_speed failed\n");
	}
	
	//stop i2c
	owl_i2c_writel(dev, 0x8a, I2C_CTL);
	
	//disable i2c
	owl_i2c_writel(dev, 0x00, I2C_CTL);
	
	//clear state
	owl_i2c_writel(dev, 0xff, I2C_STAT);
	
	//enable i2c
	owl_i2c_writel(dev, iiccon, I2C_CTL);
}

static void owl_i2cdev_init(struct owl_i2c_dev *dev)
{
    u32 iiccon = I2C_CTL_EN | I2C_CTL_IRQE | I2C_CTL_PUEN;

    i2c_dbg("owl_i2cdev_init\n");
    
    owl_i2c_writel(dev, 0xff, I2C_STAT);
    owl_i2c_writel(dev, iiccon, I2C_CTL);
}

static void owl_i2c_message_start(struct owl_i2c_dev *dev, struct i2c_msg *msg)
{
    u16 addr = (msg->addr & 0x7f) << 1;
    u32 ctl;

    i2c_dbg("%s()\n", __FUNCTION__);

    if(msg->flags & I2C_M_RD){
        addr |= 1;
    }

    dev->state = STARTSTATE;
    
    ctl = I2C_CTL_IRQE | I2C_CTL_EN | I2C_CTL_GBCC_START | I2C_CTL_PUEN | I2C_CTL_RB;
    
    owl_i2c_writel(dev, addr, I2C_TXDAT);
    owl_i2c_writel(dev, ctl, I2C_CTL);
}

static int owl_i2c_doxfer(struct owl_i2c_dev *dev, struct i2c_msg *msgs, int num)
{
    unsigned long timeout;
    int ret = 0;
    int i;

    spin_lock_irq(&dev->lock);
    
    dev->state = STARTSTATE;
    dev->msgs = msgs;
    dev->msg_num = num;
    dev->msg_idx = dev->msg_ptr = 0;
    
    spin_unlock_irq(&dev->lock);

    i2c_dbg("%s(): msg num %d\n", __FUNCTION__, num);

    for(i = 0; i < num; i++)
    {
        i2c_dbg("  msg[%d]: addr 0x%x, len %d, flags 0x%x\n", i, msgs[i].addr, msgs[i].len, msgs[i].flags);
        owl_dump_mem(msgs[i].buf, msgs[i].len, 0, 1);
    }

    owl_i2c_message_start(dev, msgs);

    timeout = wait_event_timeout(dev->waitqueue, dev->msg_num == 0, I2C_TRANS_TIMEOUT);
    
    if(!timeout)
    {
        ret = -EAGAIN;
        i2c_warn("Timedout..\n");
        goto out;
    }

    if(dev->msg_idx < 0)
    {
        ret = -EAGAIN;
        owl_i2cdev_init(dev);
        i2c_warn("Transition failed\n");
    }
    else {
        ret = dev->msg_idx;
    }

out:
    owl_i2c_writel(dev, 0, I2C_CTL);
    return ret;
}

static int owl_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *pmsg, int num)
{
    struct owl_i2c_dev *dev = i2c_get_adapdata(adap);
    int ret = 0;
	u32 divide;
	u32 freq = 0;
	
    if(!adap || !pmsg) {
        return -EINVAL;
    }

    if(mutex_lock_interruptible(&dev->mutex) < 0) {
        return -EAGAIN;
    }

	if(dev->in_suspend_state != 0)
	{
		dev_err(&adap->dev, "%s() someone call this API while we are in suspend state, drop it.\n", __func__);
		dump_stack();
		return -EBUSY;
	}

    // Sometimes the TP i2c address is 0x30 at I2C1
    
	if((((0x60 >> 1) == pmsg->addr) || ((0xA0 >> 1) == pmsg->addr) || ((0x74 >> 1) == pmsg->addr)))
	{
		if (I2C_CLK_HDMI != dev->i2c_freq)
		{
			dev->i2c_freq = I2C_CLK_HDMI;
		}
	}
	else
	{
		dev->i2c_freq = dev->i2c_freq_cfg;
	}
	
	i2c_dbg("owl_i2c_xfer i2c freq is %d\n", dev->i2c_freq);
	
	freq = dev->i2c_freq;
	
	divide = I2C_MODULE_CLK / (freq * 16);
	
	owl_i2c_writel(dev, divide, I2C_CLKDIV);
	
    owl_i2cdev_init(dev);
    
    ret = owl_i2c_doxfer(dev, pmsg, num);

    mutex_unlock(&dev->mutex);

    return ret;
}

static u32 owl_i2c_func(struct i2c_adapter *adapter)
{
    return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
}

static struct i2c_algorithm owl_i2c_algo = {
    .master_xfer    = owl_i2c_xfer,
    .functionality  = owl_i2c_func,
};

static int owl_i2c_set_pin_mux(struct platform_device *pdev)
{
	int ret;
	struct owl_i2c_dev *dev = platform_get_drvdata(pdev);

	dev->i2c_pin_state.p = pinctrl_get(&pdev->dev);
	
	if(IS_ERR(dev->i2c_pin_state.p))
	{
		i2c_err("owl i2c get pinctrl handle failed\n");
		return PTR_ERR(dev->i2c_pin_state.p);
	}
	
	dev->i2c_pin_state.s = pinctrl_lookup_state(dev->i2c_pin_state.p, I2C_STATE_DEFAULT);
	
	if(IS_ERR(dev->i2c_pin_state.s))
	{
		i2c_err("alloc find pinctrl state failed\n");
		pinctrl_put(dev->i2c_pin_state.p);
		return PTR_ERR(dev->i2c_pin_state.s);
	}

	ret = pinctrl_select_state(dev->i2c_pin_state.p, dev->i2c_pin_state.s);
	
	if (ret < 0)
	{
		i2c_err("alloc set pinctrl state failed\n");
		pinctrl_put(dev->i2c_pin_state.p);
		return ret;
	}

	i2c_info("i2c pinctrl select state successfully\n");
	return 0;

}

static void owl_i2c_put_pin_mux(struct pin_state *i2c_pin_state)
{
	if(i2c_pin_state->p) {
		pinctrl_put(i2c_pin_state->p);
	}
}

static int owl_i2c_set_clk_tree(struct platform_device *pdev)
{
	int ret = 0;
	u32 freq = 0;
	
	struct owl_i2c_dev *dev = platform_get_drvdata(pdev);

	switch (pdev->id)
	{
	case 0:
		//dev->i2c_clk = clk_get(NULL, CLKNAME_I2C0_CLK);
		
		freq = clk_round_rate(dev->i2c_clk, I2C_MODULE_CLK);
		
		if(freq == I2C_MODULE_CLK) {
			ret = clk_set_rate(dev->i2c_clk, freq);
		}
		else {
			goto round_rate_failed;
		}
		
		clk_prepare(dev->i2c_clk);
		clk_enable(dev->i2c_clk);
		clk_put(dev->i2c_clk);
		
		//module_clk_enable(MOD_ID_I2C0);
		break;

	case 1:
		//dev->i2c_clk = clk_get(NULL, CLKNAME_I2C1_CLK);
		
		freq = clk_round_rate(dev->i2c_clk, I2C_MODULE_CLK);
		
		if(freq == I2C_MODULE_CLK) {
			ret = clk_set_rate(dev->i2c_clk, freq);
		}
		else {
			goto round_rate_failed;
		}
		
		clk_prepare(dev->i2c_clk);
		clk_enable(dev->i2c_clk);
		clk_put(dev->i2c_clk);
		
		//module_clk_enable(MOD_ID_I2C1);
		break;

	case 2:
		//dev->i2c_clk = clk_get(NULL, CLKNAME_I2C2_CLK);
		
		freq = clk_round_rate(dev->i2c_clk, I2C_MODULE_CLK);
		
		if(freq == I2C_MODULE_CLK) {
			ret = clk_set_rate(dev->i2c_clk, freq);
		}
		else {
			goto round_rate_failed;
		}
		
		clk_prepare(dev->i2c_clk);
		clk_enable(dev->i2c_clk);
		clk_put(dev->i2c_clk);
		
		//module_clk_enable(MOD_ID_I2C2);
		break;

	case 3:
		//dev->i2c_clk = clk_get(NULL, CLKNAME_I2C3_CLK);
		
		freq = clk_round_rate(dev->i2c_clk, I2C_MODULE_CLK);
		
		if(freq == I2C_MODULE_CLK) {
			ret = clk_set_rate(dev->i2c_clk, freq);
		}
		else {
			goto round_rate_failed;
		}
		
		clk_prepare(dev->i2c_clk);
		clk_enable(dev->i2c_clk);
		clk_put(dev->i2c_clk);
		
		//module_clk_enable(MOD_ID_I2C3);
		break;

	default:
		goto clk_get_failed;
		break;
	}

	return 0;

round_rate_failed:
	i2c_err("Round i2c module rate failed\n");
	return -2;

clk_get_failed:
	i2c_err("Get i2c_clk failed\n");
	return -1;
}

static int owl_i2c_module_init(struct platform_device *pdev)
{
	struct device_node *np = pdev->dev.of_node;

	pdev->id = of_alias_get_id(np, "i2c");
	
	if(pdev->id < 0) {
		goto alias_get_id_failed;
	}

	// Pinctrol I2C0 MFP UART0
	if(owl_i2c_set_pin_mux(pdev)) {
		goto set_pin_mux_failed;
	}

	if(owl_i2c_set_clk_tree(pdev)) {
		goto set_clk_tree_failed;
	}

	return 0;

alias_get_id_failed:
	i2c_err("%s: Alias_get_id failed\n", __func__);
	return -EINVAL;

set_pin_mux_failed:
	i2c_err("%s: set_pin_mux failed\n", __func__);
	return -EINVAL;

set_clk_tree_failed:
	i2c_err("%s: set_clk_tree failed\n", __func__);
	return -EINVAL;

}

static void owl_i2c_disable(struct owl_i2c_dev *dev)
{
    owl_i2c_writel(dev, owl_i2c_readl(dev, I2C_CTL) & ~I2C_CTL_EN, I2C_CTL);

    clk_disable(dev->clk);
}

static void owl_i2c_enable(struct owl_i2c_dev *dev)
{
	clk_enable(dev->i2c_clk);

	owl_i2cdev_reinit(dev);
}

static ssize_t info_show(struct device *dev, struct device_attribute *attr, char *buf)
{
	int cnt;

	cnt = sprintf(buf, "%d\n(Note: 1: open, 0:close)\n", info_switch);
	
	return cnt;
}

static ssize_t info_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
{
	int cnt, tmp;
	
	cnt = sscanf(buf, "%d", &tmp);
	
	switch (tmp)
	{
	case 0:
	case 1:
		info_switch = tmp;
		break;
	default:
		pr_err("invalid input\n");
		break;
	}
	
	return count;
}

static ssize_t err_show(struct device *dev, struct device_attribute *attr, char *buf)
{
	int cnt;

	cnt = sprintf(buf, "%d\n(Note: 1: open, 0:close)\n", err_switch);
	
	return cnt;
}

static ssize_t err_store(struct device *dev, struct device_attribute *attr, const char *buf,size_t count)
{
	int cnt, tmp;
	
	cnt = sscanf(buf, "%d", &tmp);
	
	switch (tmp)
	{
	case 0:
	case 1:
		err_switch = tmp;
		break;
	default:
		pr_err("invalid input\n");
		break;
	}
	
	return count;
}

static struct device_attribute owl_i2c_attr[] = {
	__ATTR(msg_info, S_IRUSR | S_IWUSR, info_show, info_store),
	__ATTR(msg_error, S_IRUSR | S_IWUSR, err_show, err_store),
};

static int owl_i2c_probe(struct platform_device *pdev)
{
	struct owl_i2c_dev *dev;
	struct i2c_adapter *adap;
	struct resource *mem, *irq, *ioarea;
	int ret = 0;
	int i = 0;

	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	
	if(!mem)
	{
		dev_err(&pdev->dev, "no mem resource?\n");
		return -ENODEV;
	}

	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
	
	if(!irq)
	{
		dev_err(&pdev->dev, "no irq resource?\n");
		return -ENODEV;
	}

	ioarea = request_mem_region(mem->start, resource_size(mem), pdev->name);
	
	if(!ioarea)
	{
		dev_err(&pdev->dev, "I2C region already claimed\n");
		return -EBUSY;
	}

	dev = kzalloc(sizeof(struct owl_i2c_dev), GFP_KERNEL);
	
	if(!dev)
	{
		i2c_err("alloc i2c device failed\n");
		ret = -ENOMEM;
		goto err_release_region;
	}

	mutex_init(&dev->mutex);
	
	dev->dev = &pdev->dev;
	dev->irq = irq->start;
	
	spin_lock_init(&dev->lock);

	dev->phys = (unsigned long)mem->start;
	
	if(!dev->phys)
	{
		ret = -ENOMEM;
		goto err_free_mem;
	}

	dev->base = (void __iomem *)IO_ADDRESS(dev->phys);

	platform_set_drvdata(pdev, dev);
	
	init_waitqueue_head(&dev->waitqueue);

	ret = request_irq(dev->irq, owl_i2c_interrupt, 0, pdev->name, dev);
	
	if(ret)
	{
		dev_err(dev->dev, "failure requesting irq %i\n", dev->irq);
		goto err_free_mem;
	}

	adap = &dev->adapter;
	
	i2c_set_adapdata(adap, dev);
	
	adap->owner = THIS_MODULE;
	
	adap->class = I2C_CLASS_HWMON;
	
	strlcpy(adap->name, "OWL I2C adapter", sizeof(adap->name));
	
	adap->algo = &owl_i2c_algo;
	
	adap->dev.parent = &pdev->dev;
	
	adap->dev.of_node = pdev->dev.of_node;

	ret = owl_i2c_module_init(pdev);
	
	if(ret)
	{
		dev_err(dev->dev, "owl_i2c_module_init failed\n");
		ret = ENOMEM;
		goto err_free_irq;
	}

	ret = owl_i2c_set_speed(dev);
	
	if(ret)
	{
		dev_err(dev->dev, "owl_i2c_set_speed failed\n");
		ret = ENOMEM;
		goto err_free_irq;
	}

	owl_i2cdev_init(dev);
	
	adap->nr = pdev->id;
	
	ret = i2c_add_numbered_adapter(adap);
	
	if(ret)
	{
		dev_err(dev->dev, "failure adding adapter\n");
		ret = ENOMEM;
		goto err_free_irq;
	}

	for(i = 0; i < ARRAY_SIZE(owl_i2c_attr); i++)
	{
		ret = device_create_file(&pdev->dev, &owl_i2c_attr[i]);
		
		if(ret)
		{
			i2c_err("Add device file failed\n");
			goto err_free_irq;
		}
	}

	return 0;

err_free_irq:
	free_irq(dev->irq, dev);

err_free_mem:
	platform_set_drvdata(pdev, NULL);
	kfree(dev);
	
err_release_region:
	release_mem_region(mem->start, resource_size(mem));
	return ret;
}

static int owl_i2c_remove(struct platform_device *pdev)
{
	struct owl_i2c_dev *dev = platform_get_drvdata(pdev);
	struct resource *mem;

	platform_set_drvdata(pdev, NULL);
	
	free_irq(dev->irq, dev);
	
	i2c_del_adapter(&dev->adapter);
	
	owl_i2c_disable(dev);
	
	owl_i2c_put_pin_mux(&dev->i2c_pin_state);
	
	kfree(dev);
	
	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	
	release_mem_region(mem->start, (mem->end - mem->start) + 1);

	return 0;
}

static int owl_i2c_suspend(struct device *dev)
{
	struct owl_i2c_dev *i2c_dev = dev_get_drvdata(dev);

	dev_info(dev, "suspend.\n");
	
	if(mutex_lock_interruptible(&i2c_dev->mutex) < 0) {
		return -EAGAIN;
	}
	
	disable_irq(i2c_dev->irq);
	
	owl_i2c_disable(i2c_dev);
	
	i2c_dev->in_suspend_state = 1;
	
	mutex_unlock(&i2c_dev->mutex);
	
	return 0;
}

static int owl_i2c_resume(struct device *dev)
{
	struct owl_i2c_dev *i2c_dev = dev_get_drvdata(dev);

	dev_info(dev, "resume.\n");
	
	if(mutex_lock_interruptible(&i2c_dev->mutex) < 0) {
		return -EAGAIN;
	}

	pr_debug("%s %d\n", __FUNCTION__, __LINE__);

	owl_i2c_enable(i2c_dev);
	
	enable_irq(i2c_dev->irq);
	
	i2c_dev->in_suspend_state = 0;
	
	mutex_unlock(&i2c_dev->mutex);
	return 0;
}

static const struct of_device_id owl_i2c_of_match[] = {
	{ .compatible = "actions,owl-i2c" },
	{}
};

MODULE_DEVICE_TABLE(of, owl_i2c_of_match);

static const struct dev_pm_ops owl_i2c_pm_ops = {
	.suspend_noirq = owl_i2c_suspend,
	.resume_noirq = owl_i2c_resume,
};

static struct platform_driver owl_fdt_driver = {
	.driver = {
		   .name = "owl-i2c",
		   .owner = THIS_MODULE,
		   .of_match_table = owl_i2c_of_match,
		   },
	.probe = owl_i2c_probe,
	.remove = owl_i2c_remove,
	.driver.pm	= &owl_i2c_pm_ops,
};

static int __init owl_i2c_init(void)
{
	return platform_driver_register(&owl_fdt_driver);
}

subsys_initcall(owl_i2c_init);

static void __exit owl_i2c_exit(void)
{
    platform_driver_unregister(&owl_fdt_driver);
}

module_exit(owl_i2c_exit);

MODULE_LICENSE("GPL");

