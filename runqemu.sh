# Shell script to start Raspberry Pi 5 (64-bit) on QEMU
#!/bin/sh
IMAGES_DIR="buildroot/output-qemu/images"

KERNEL="${IMAGES_DIR}/Image"
 ROOTFS="${IMAGES_DIR}/rootfs.ext4"

if [ ! -e $KERNEL ]
then
	echo "$KERNEL does not exist"
	exit 1
fi
 

if [ ! -e $ROOTFS ]
then
	echo "$ROOTFS does not exist"
	exit 1
fi


qemu-system-aarch64 \
  -M virt \
  -cpu cortex-a72 \
  -smp 4 \
  -m 1024 \
  -nographic \
  -kernel "$KERNEL" \
  -append "rw console=ttyAMA0,115200 root=/dev/vda rootwait" \
  -drive if=none,file="$ROOTFS",format=raw,id=hd0 \
  -device virtio-blk-device,drive=hd0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -device virtio-net-device,netdev=net0
