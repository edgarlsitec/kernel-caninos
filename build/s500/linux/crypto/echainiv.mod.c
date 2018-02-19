#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x4b13db9e, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0x4f94649a, __VMLINUX_SYMBOL_STR(crypto_unregister_template) },
	{ 0x15ca5cc3, __VMLINUX_SYMBOL_STR(crypto_register_template) },
	{ 0xf5da0558, __VMLINUX_SYMBOL_STR(aead_register_instance) },
	{ 0x2cf66c6e, __VMLINUX_SYMBOL_STR(aead_exit_geniv) },
	{ 0x4174b366, __VMLINUX_SYMBOL_STR(aead_init_geniv) },
	{ 0x58798f72, __VMLINUX_SYMBOL_STR(aead_geniv_alloc) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x91dda801, __VMLINUX_SYMBOL_STR(scatterwalk_map_and_copy) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0xce83f6bf, __VMLINUX_SYMBOL_STR(aead_geniv_free) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

