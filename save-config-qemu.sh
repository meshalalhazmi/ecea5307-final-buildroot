#!/bin/bash
#Script to save the modified QEMU configuration as modified_qemu_aarch64_virt_defconfig and linux kernel configuration.


cd `dirname $0`
source shared.sh
mkdir -p base_external/configs/
make -C buildroot O=output-qemu savedefconfig BR2_DEFCONFIG=${AESD_QEMU_MODIFIED_DEFCONFIG_REL_BUILDROOT}

if [ -e buildroot/output-qemu/.config ] && [ -e buildroot/output-qemu/build/linux-*/.config ]; then
	grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" buildroot/output-qemu/.config > /dev/null
	if [ $? -eq 0 ]; then
		echo "Saving linux defconfig"
		make -C buildroot O=output-qemu linux-update-defconfig
	fi
fi