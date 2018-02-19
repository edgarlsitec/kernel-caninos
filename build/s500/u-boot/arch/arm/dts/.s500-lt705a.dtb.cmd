cmd_arch/arm/dts/s500-lt705a.dtb := arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.s500-lt705a.dtb.d.pre.tmp -nostdinc -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/dts -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.s500-lt705a.dtb.dts.tmp /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/s500-lt705a.dts ; dtc -O dtb -o arch/arm/dts/s500-lt705a.dtb -b 0 -i /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/ -R 4 -p 0x1000 -d arch/arm/dts/.s500-lt705a.dtb.d.dtc.tmp arch/arm/dts/.s500-lt705a.dtb.dts.tmp ; cat arch/arm/dts/.s500-lt705a.dtb.d.pre.tmp arch/arm/dts/.s500-lt705a.dtb.d.dtc.tmp > arch/arm/dts/.s500-lt705a.dtb.d

source_arch/arm/dts/s500-lt705a.dtb := /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/s500-lt705a.dts

deps_arch/arm/dts/s500-lt705a.dtb := \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/s500.dtsi \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/skeleton.dtsi \

arch/arm/dts/s500-lt705a.dtb: $(deps_arch/arm/dts/s500-lt705a.dtb)

$(deps_arch/arm/dts/s500-lt705a.dtb):
