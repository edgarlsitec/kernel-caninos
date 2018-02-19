cmd_u-boot-dtb.img := ./tools/mkimage -A arm -T firmware -C none -O u-boot -a 0x08000000 -e 0x08000040 -n "U-Boot 2015.04 for owl board" -d u-boot-dtb.bin u-boot-dtb.img  >/dev/null
