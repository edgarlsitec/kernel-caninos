cmd_drivers/gpu/drm/built-in.o :=  rm -f drivers/gpu/drm/built-in.o; arm-linux-gnueabihf-ar rcSTPD drivers/gpu/drm/built-in.o drivers/gpu/drm/amd/lib/built-in.o drivers/gpu/drm/omapdrm/built-in.o drivers/gpu/drm/tilcdc/built-in.o drivers/gpu/drm/i2c/built-in.o drivers/gpu/drm/panel/built-in.o drivers/gpu/drm/bridge/built-in.o drivers/gpu/drm/hisilicon/built-in.o ; scripts/mod/modpost drivers/gpu/drm/built-in.o
