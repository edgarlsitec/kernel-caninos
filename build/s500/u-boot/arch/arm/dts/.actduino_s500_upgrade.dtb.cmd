cmd_arch/arm/dts/actduino_s500_upgrade.dtb := arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.actduino_s500_upgrade.dtb.d.pre.tmp -nostdinc -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/dts -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.actduino_s500_upgrade.dtb.dts.tmp /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/actduino_s500_upgrade.dts ; dtc -O dtb -o arch/arm/dts/actduino_s500_upgrade.dtb -b 0 -i /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/ -R 4 -p 0x1000 -d arch/arm/dts/.actduino_s500_upgrade.dtb.d.dtc.tmp arch/arm/dts/.actduino_s500_upgrade.dtb.dts.tmp ; cat arch/arm/dts/.actduino_s500_upgrade.dtb.d.pre.tmp arch/arm/dts/.actduino_s500_upgrade.dtb.d.dtc.tmp > arch/arm/dts/.actduino_s500_upgrade.dtb.d

source_arch/arm/dts/actduino_s500_upgrade.dtb := /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/actduino_s500_upgrade.dts

deps_arch/arm/dts/actduino_s500_upgrade.dtb := \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/actduino.dtsi \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/skeleton.dtsi \

arch/arm/dts/actduino_s500_upgrade.dtb: $(deps_arch/arm/dts/actduino_s500_upgrade.dtb)

$(deps_arch/arm/dts/actduino_s500_upgrade.dtb):
