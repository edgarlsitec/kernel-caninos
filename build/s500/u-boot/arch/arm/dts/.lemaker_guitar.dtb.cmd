cmd_arch/arm/dts/lemaker_guitar.dtb := arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.lemaker_guitar.dtb.d.pre.tmp -nostdinc -I/home/edgar/kernel-caninos/uboot/arch/arm/dts -I/home/edgar/kernel-caninos/uboot/arch/arm/dts/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.lemaker_guitar.dtb.dts.tmp /home/edgar/kernel-caninos/uboot/arch/arm/dts/lemaker_guitar.dts ; dtc -O dtb -o arch/arm/dts/lemaker_guitar.dtb -b 0 -i /home/edgar/kernel-caninos/uboot/arch/arm/dts/ -R 4 -p 0x1000 -d arch/arm/dts/.lemaker_guitar.dtb.d.dtc.tmp arch/arm/dts/.lemaker_guitar.dtb.dts.tmp ; cat arch/arm/dts/.lemaker_guitar.dtb.d.pre.tmp arch/arm/dts/.lemaker_guitar.dtb.d.dtc.tmp > arch/arm/dts/.lemaker_guitar.dtb.d

source_arch/arm/dts/lemaker_guitar.dtb := /home/edgar/kernel-caninos/uboot/arch/arm/dts/lemaker_guitar.dts

deps_arch/arm/dts/lemaker_guitar.dtb := \
  /home/edgar/kernel-caninos/uboot/arch/arm/dts/include/dt-bindings/input/input.h \
  /home/edgar/kernel-caninos/uboot/arch/arm/dts/actduino.dtsi \
  /home/edgar/kernel-caninos/uboot/arch/arm/dts/skeleton.dtsi \

arch/arm/dts/lemaker_guitar.dtb: $(deps_arch/arm/dts/lemaker_guitar.dtb)

$(deps_arch/arm/dts/lemaker_guitar.dtb):
