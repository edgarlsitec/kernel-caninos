cmd_drivers/clocksource/built-in.o :=  rm -f drivers/clocksource/built-in.o; arm-linux-gnueabihf-ar rcSTPD drivers/clocksource/built-in.o drivers/clocksource/timer-of.o drivers/clocksource/timer-probe.o drivers/clocksource/mmio.o drivers/clocksource/owl-timer.o drivers/clocksource/arm_global_timer.o drivers/clocksource/dummy_timer.o 
