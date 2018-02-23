cmd_lib/libfdt/fdt.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/libfdt/.fdt.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -Iinclude  -I/home/edgar/repo/kernel-caninos/uboot/include -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/include -include /home/edgar/repo/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/uboot/lib/libfdt -Ilib/libfdt -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(fdt)"  -D"KBUILD_MODNAME=KBUILD_STR(fdt)" -c -o lib/libfdt/fdt.o /home/edgar/repo/kernel-caninos/uboot/lib/libfdt/fdt.c

source_lib/libfdt/fdt.o := /home/edgar/repo/kernel-caninos/uboot/lib/libfdt/fdt.c

deps_lib/libfdt/fdt.o := \
  /home/edgar/repo/kernel-caninos/uboot/include/libfdt_env.h \
  /home/edgar/repo/kernel-caninos/uboot/include/compiler.h \
    $(wildcard include/config/use/stdint.h) \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stddef.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/string.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/posix_types.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/stddef.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/posix_types.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/types.h \
    $(wildcard include/config/arm64.h) \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stdbool.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/string.h \
    $(wildcard include/config/use/arch/memcpy.h) \
    $(wildcard include/config/use/arch/memset.h) \
  include/config.h \
    $(wildcard include/config/boarddir.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/config_defaults.h \
    $(wildcard include/config/defaults/h/.h) \
    $(wildcard include/config/bootm/linux.h) \
    $(wildcard include/config/bootm/netbsd.h) \
    $(wildcard include/config/bootm/plan9.h) \
    $(wildcard include/config/bootm/rtems.h) \
    $(wildcard include/config/bootm/vxworks.h) \
    $(wildcard include/config/gzip.h) \
    $(wildcard include/config/zlib.h) \
    $(wildcard include/config/partitions.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/config_uncmd_spl.h \
    $(wildcard include/config/uncmd/spl/h//.h) \
    $(wildcard include/config/spl/build.h) \
    $(wildcard include/config/cmd/cdp.h) \
    $(wildcard include/config/cmd/dhcp.h) \
    $(wildcard include/config/cmd/dns.h) \
    $(wildcard include/config/cmd/link/local.h) \
    $(wildcard include/config/cmd/nfs.h) \
    $(wildcard include/config/cmd/ping.h) \
    $(wildcard include/config/cmd/rarp.h) \
    $(wildcard include/config/cmd/sntp.h) \
    $(wildcard include/config/cmd/tftpput.h) \
    $(wildcard include/config/cmd/tftpsrv.h) \
    $(wildcard include/config/of/control.h) \
    $(wildcard include/config/spl/dm.h) \
    $(wildcard include/config/dm/serial.h) \
    $(wildcard include/config/dm/gpio.h) \
    $(wildcard include/config/dm/i2c.h) \
    $(wildcard include/config/dm/spi.h) \
    $(wildcard include/config/dm/warn.h) \
    $(wildcard include/config/dm/device/remove.h) \
    $(wildcard include/config/dm/stdio.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/configs/s500.h \
    $(wildcard include/config/s500/h.h) \
    $(wildcard include/config/bootcommand.h) \
    $(wildcard include/config/extra/env/settings.h) \
    $(wildcard include/config/sys/hz.h) \
    $(wildcard include/config/sys/no/flash.h) \
    $(wildcard include/config/ident/string.h) \
    $(wildcard include/config/nr/dram/banks.h) \
    $(wildcard include/config/sys/sdram/base.h) \
    $(wildcard include/config/sys/sdram/size.h) \
    $(wildcard include/config/sys/malloc/len.h) \
    $(wildcard include/config/env/size.h) \
    $(wildcard include/config/sys/text/base.h) \
    $(wildcard include/config/sys/load/addr.h) \
    $(wildcard include/config/sys/init/sp/addr.h) \
    $(wildcard include/config/of/libfdt.h) \
    $(wildcard include/config/fit.h) \
    $(wildcard include/config/sys/generic/board.h) \
    $(wildcard include/config/owl.h) \
    $(wildcard include/config/owl/serial.h) \
    $(wildcard include/config/baudrate.h) \
    $(wildcard include/config/cmd/booti.h) \
    $(wildcard include/config/cmd/bootz.h) \
    $(wildcard include/config/cmd/memory.h) \
    $(wildcard include/config/cmd/run.h) \
    $(wildcard include/config/android/boot/image.h) \
    $(wildcard include/config/bootdelay.h) \
    $(wildcard include/config/autoboot.h) \
    $(wildcard include/config/autoboot/keyed.h) \
    $(wildcard include/config/autoboot/delay/str.h) \
    $(wildcard include/config/autoboot/prompt.h) \
    $(wildcard include/config/cmd/mmc.h) \
    $(wildcard include/config/mmc.h) \
    $(wildcard include/config/generic/mmc.h) \
    $(wildcard include/config/owl/mmc.h) \
    $(wildcard include/config/misc/info.h) \
    $(wildcard include/config/sys/vsnprintf.h) \
    $(wildcard include/config/cmd/echo.h) \
    $(wildcard include/config/use/irq.h) \
    $(wildcard include/config/stacksize/irq.h) \
    $(wildcard include/config/stacksize/fiq.h) \
    $(wildcard include/config/usb/storage.h) \
    $(wildcard include/config/atm9009/nand.h) \
    $(wildcard include/config/dos/partition.h) \
    $(wildcard include/config/cmd/fat.h) \
    $(wildcard include/config/fat/write.h) \
    $(wildcard include/config/cmd/ext2.h) \
    $(wildcard include/config/cmd/ext4.h) \
    $(wildcard include/config/cmd/fs/generic.h) \
    $(wildcard include/config/efi/partition.h) \
    $(wildcard include/config/partition/uuids.h) \
    $(wildcard include/config/cmd/smc.h) \
    $(wildcard include/config/owl/spi.h) \
    $(wildcard include/config/env/is/in/mmc.h) \
    $(wildcard include/config/sys/mmc/env/dev.h) \
    $(wildcard include/config/env/offset.h) \
    $(wildcard include/config/env/offset/redund.h) \
    $(wildcard include/config/sys/redundand/environment.h) \
    $(wildcard include/config/env/is/in/fat.h) \
    $(wildcard include/config/env/is/in/spi/flash.h) \
    $(wildcard include/config/env/sect/size.h) \
    $(wildcard include/config/spi/flash.h) \
    $(wildcard include/config/spi/flash/winbond.h) \
    $(wildcard include/config/spi/flash/macronix.h) \
    $(wildcard include/config/sf/default/speed.h) \
    $(wildcard include/config/spi/flash/size.h) \
    $(wildcard include/config/spi/bus.h) \
    $(wildcard include/config/spi/cs.h) \
    $(wildcard include/config/cmd/sf.h) \
    $(wildcard include/config/env/is/nowhere.h) \
    $(wildcard include/config/sys/cbsize.h) \
    $(wildcard include/config/sys/prompt.h) \
    $(wildcard include/config/sys/pbsize.h) \
    $(wildcard include/config/sys/hush/parser.h) \
    $(wildcard include/config/sys/prompt/hush/ps2.h) \
    $(wildcard include/config/sys/bargsize.h) \
    $(wildcard include/config/sys/longhelp.h) \
    $(wildcard include/config/sys/maxargs.h) \
    $(wildcard include/config/atm7059a.h) \
    $(wildcard include/config/owl/pinctrl.h) \
    $(wildcard include/config/owl/gpio/generic.h) \
    $(wildcard include/config/owl/gpio.h) \
    $(wildcard include/config/sys/i2c/owl.h) \
    $(wildcard include/config/sys/cacheline/size.h) \
    $(wildcard include/config/usb/gadget.h) \
    $(wildcard include/config/usb/gadget/actions.h) \
    $(wildcard include/config/usb/gadget/dualspeed.h) \
    $(wildcard include/config/usb/gadget/vbus/draw.h) \
    $(wildcard include/config/usbd/hs.h) \
    $(wildcard include/config/usbdownload/gadget.h) \
    $(wildcard include/config/g/dnl/vendor/num.h) \
    $(wildcard include/config/g/dnl/product/num.h) \
    $(wildcard include/config/g/dnl/ums/vendor/num.h) \
    $(wildcard include/config/g/dnl/ums/product/num.h) \
    $(wildcard include/config/g/dnl/manufacturer.h) \
    $(wildcard include/config/usb/gadget/mass/storage.h) \
    $(wildcard include/config/cmd/usb/mass/storage.h) \
    $(wildcard include/config/cmd/fastboot.h) \
    $(wildcard include/config/usb/fastboot/buf/size.h) \
    $(wildcard include/config/usb/fastboot/buf/addr.h) \
    $(wildcard include/config/fastboot/flash.h) \
    $(wildcard include/config/fastboot/flash/mmc/dev.h) \
    $(wildcard include/config/bootloader/addr.h) \
    $(wildcard include/config/uboot/addr.h) \
    $(wildcard include/config/usb/ether.h) \
    $(wildcard include/config/usb/eth/rndis.h) \
    $(wildcard include/config/cmd/net.h) \
    $(wildcard include/config/acts/owl/mac.h) \
    $(wildcard include/config/lib/rand.h) \
    $(wildcard include/config/ipaddr.h) \
    $(wildcard include/config/serverip.h) \
    $(wildcard include/config/usbnet/dev/addr.h) \
    $(wildcard include/config/usbnet/host/addr.h) \
    $(wildcard include/config/usb/xhci.h) \
    $(wildcard include/config/usb/xhci/owl.h) \
    $(wildcard include/config/cmd/usb.h) \
    $(wildcard include/config/sys/usb/xhci/max/root/ports.h) \
    $(wildcard include/config/android/recovery.h) \
    $(wildcard include/config/owl/pwm.h) \
    $(wildcard include/config/owl/pwm/backlight.h) \
    $(wildcard include/config/video.h) \
    $(wildcard include/config/video/owl.h) \
    $(wildcard include/config/cfb/console.h) \
    $(wildcard include/config/vga/as/single/device.h) \
    $(wildcard include/config/video/logo.h) \
    $(wildcard include/config/splash/screen.h) \
    $(wildcard include/config/splash/screen/align.h) \
    $(wildcard include/config/video/bmp/logo.h) \
    $(wildcard include/config/video/bmp/gzip.h) \
    $(wildcard include/config/sys/video/logo/max/size.h) \
    $(wildcard include/config/sys/video/logo/name.h) \
    $(wildcard include/config/sys/battery/low/name.h) \
    $(wildcard include/config/sys/charger/logo/name.h) \
    $(wildcard include/config/sys/recovery/logo/name.h) \
    $(wildcard include/config/sys/charger/frame/name.h) \
    $(wildcard include/config/sys/console/is/in/env.h) \
    $(wildcard include/config/console/mux.h) \
    $(wildcard include/config/owl/display/lcd.h) \
    $(wildcard include/config/owl/display/dsi.h) \
    $(wildcard include/config/owl/display/hdmi.h) \
    $(wildcard include/config/owl/display/cvbs.h) \
    $(wildcard include/config/lcd/framebuf/size.h) \
    $(wildcard include/config/sys/gamma/name.h) \
    $(wildcard include/config/sys/gamma/size.h) \
    $(wildcard include/config/boot/power.h) \
    $(wildcard include/config/gauge/bq27441.h) \
    $(wildcard include/config/check/key.h) \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/config.h \
    $(wildcard include/config/h/.h) \
    $(wildcard include/config/lmb.h) \
    $(wildcard include/config/sys/boot/ramdisk/high.h) \
    $(wildcard include/config/phys/64bit.h) \
    $(wildcard include/config/static/rela.h) \
    $(wildcard include/config/fsl/lsch3.h) \
    $(wildcard include/config/ls102xa.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/config_fallbacks.h \
    $(wildcard include/config/fallbacks/h.h) \
    $(wildcard include/config/spl.h) \
    $(wildcard include/config/spl/pad/to.h) \
    $(wildcard include/config/spl/max/size.h) \
    $(wildcard include/config/sys/baudrate/table.h) \
    $(wildcard include/config/fs/fat.h) \
    $(wildcard include/config/fs/ext4.h) \
    $(wildcard include/config/cmd/ext4/write.h) \
    $(wildcard include/config/ext4/write.h) \
    $(wildcard include/config/cmd/ide.h) \
    $(wildcard include/config/cmd/sata.h) \
    $(wildcard include/config/cmd/scsi.h) \
    $(wildcard include/config/cmd/part.h) \
    $(wildcard include/config/cmd/gpt.h) \
    $(wildcard include/config/systemace.h) \
    $(wildcard include/config/sandbox.h) \
    $(wildcard include/config/random/uuid.h) \
    $(wildcard include/config/cmd/uuid.h) \
    $(wildcard include/config/bootp/pxe.h) \
    $(wildcard include/config/lib/uuid.h) \
    $(wildcard include/config/lib/hw/rand.h) \
    $(wildcard include/config/api.h) \
    $(wildcard include/config/lcd.h) \
    $(wildcard include/config/cmd/bmp.h) \
    $(wildcard include/config/fit/signature.h) \
    $(wildcard include/config/image/format/legacy.h) \
    $(wildcard include/config/disable/image/legacy.h) \
    $(wildcard include/config/sys/i2c.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/linux_string.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/byteorder.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/byteorder/little_endian.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/byteorder/swab.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/byteorder/generic.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/types.h \
  /home/edgar/repo/kernel-caninos/uboot/include/fdt.h \
  /home/edgar/repo/kernel-caninos/uboot/include/libfdt.h \
  /home/edgar/repo/kernel-caninos/uboot/lib/libfdt/libfdt_internal.h \

lib/libfdt/fdt.o: $(deps_lib/libfdt/fdt.o)

$(deps_lib/libfdt/fdt.o):
