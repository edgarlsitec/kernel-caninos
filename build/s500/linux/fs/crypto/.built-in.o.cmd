cmd_fs/crypto/built-in.o :=  rm -f fs/crypto/built-in.o; arm-linux-gnueabihf-ar rcSTPD fs/crypto/built-in.o fs/crypto/fscrypto.o ; scripts/mod/modpost fs/crypto/built-in.o
