cmd_arch/arm/dts/actduino_bubble_gum_v10.dtb := arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.actduino_bubble_gum_v10.dtb.d.pre.tmp -nostdinc -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/dts -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.actduino_bubble_gum_v10.dtb.dts.tmp /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/actduino_bubble_gum_v10.dts ; dtc -O dtb -o arch/arm/dts/actduino_bubble_gum_v10.dtb -b 0 -i /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/ -R 4 -p 0x1000 -d arch/arm/dts/.actduino_bubble_gum_v10.dtb.d.dtc.tmp arch/arm/dts/.actduino_bubble_gum_v10.dtb.dts.tmp ; cat arch/arm/dts/.actduino_bubble_gum_v10.dtb.d.pre.tmp arch/arm/dts/.actduino_bubble_gum_v10.dtb.d.dtc.tmp > arch/arm/dts/.actduino_bubble_gum_v10.dtb.d

source_arch/arm/dts/actduino_bubble_gum_v10.dtb := /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/actduino_bubble_gum_v10.dts

deps_arch/arm/dts/actduino_bubble_gum_v10.dtb := \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/include/dt-bindings/input/input.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/actduino.dtsi \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/dts/skeleton.dtsi \

arch/arm/dts/actduino_bubble_gum_v10.dtb: $(deps_arch/arm/dts/actduino_bubble_gum_v10.dtb)

$(deps_arch/arm/dts/actduino_bubble_gum_v10.dtb):