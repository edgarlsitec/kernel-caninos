cmd_arch/arm/boot/dts/caninos-labrador.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.caninos-labrador.dtb.d.pre.tmp -nostdinc -I/home/edgar/repo/kernel-caninos/linux/scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.caninos-labrador.dtb.dts.tmp /home/edgar/repo/kernel-caninos/linux/arch/arm/boot/dts/caninos-labrador.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/caninos-labrador.dtb -b 0 -i/home/edgar/repo/kernel-caninos/linux/arch/arm/boot/dts/ -i/home/edgar/repo/kernel-caninos/linux/scripts/dtc/include-prefixes -Wno-unit_address_vs_reg -Wno-simple_bus_reg -Wno-unit_address_format -Wno-pci_bridge -Wno-pci_device_bus_num -Wno-pci_device_reg  -d arch/arm/boot/dts/.caninos-labrador.dtb.d.dtc.tmp arch/arm/boot/dts/.caninos-labrador.dtb.dts.tmp ; cat arch/arm/boot/dts/.caninos-labrador.dtb.d.pre.tmp arch/arm/boot/dts/.caninos-labrador.dtb.d.dtc.tmp > arch/arm/boot/dts/.caninos-labrador.dtb.d

source_arch/arm/boot/dts/caninos-labrador.dtb := /home/edgar/repo/kernel-caninos/linux/arch/arm/boot/dts/caninos-labrador.dts

deps_arch/arm/boot/dts/caninos-labrador.dtb := \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/boot/dts/owl-s500.dtsi \
  /home/edgar/repo/kernel-caninos/linux/scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  /home/edgar/repo/kernel-caninos/linux/scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \
  /home/edgar/repo/kernel-caninos/linux/scripts/dtc/include-prefixes/dt-bindings/power/owl-s500-powergate.h \
  /home/edgar/repo/kernel-caninos/linux/scripts/dtc/include-prefixes/dt-bindings/clock/owl-s500-clk.h \

arch/arm/boot/dts/caninos-labrador.dtb: $(deps_arch/arm/boot/dts/caninos-labrador.dtb)

$(deps_arch/arm/boot/dts/caninos-labrador.dtb):
