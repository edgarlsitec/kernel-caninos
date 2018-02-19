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
	{ 0x9b4737cb, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0x8cf5ce23, __VMLINUX_SYMBOL_STR(crypto_unregister_template) },
	{ 0x8cb8cf7a, __VMLINUX_SYMBOL_STR(crypto_register_template) },
	{ 0xb802e55, __VMLINUX_SYMBOL_STR(aead_register_instance) },
	{ 0x13262353, __VMLINUX_SYMBOL_STR(aead_init_geniv) },
	{ 0xba1d021d, __VMLINUX_SYMBOL_STR(aead_exit_geniv) },
	{ 0xc822f996, __VMLINUX_SYMBOL_STR(aead_geniv_alloc) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x91dda801, __VMLINUX_SYMBOL_STR(scatterwalk_map_and_copy) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0x3e849720, __VMLINUX_SYMBOL_STR(aead_geniv_free) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

