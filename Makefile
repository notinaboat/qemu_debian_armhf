# Install Debian Buster for 32-bit ARM (armhf)
#
# https://translatedcode.wordpress.com
# /2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/


BUSTER_URL=http://http.us.debian.org/debian/dists/buster/main
KERNEL_URL=$(BUSTER_URL)/installer-armhf/current/images/netboot/vmlinuz
INITRD_URL=$(BUSTER_URL)/installer-armhf/current/images/netboot/initrd.gz


all: boot_system

boot/vmlinuz_installer:
	@mkdir -p boot
	curl -L $(KERNEL_URL) > $@

boot/initrd_installer.gz:
	@mkdir -p boot
	curl -L $(INITRD_URL) > $@

boot/vmlinuz: boot_installer
	bash qemu_copyimage.sh $@

boot/initrd.gz: boot_installer
	bash qemu_copyimage.sh boot/initrd.img
	mv boot/initrd.img boot/initrd.gz

debian.qcow2:
	qemu-img create -f qcow2 $@ 4G

boot_installer: debian.qcow2 boot/vmlinuz_installer boot/initrd_installer.gz
	bash qemu_installer.sh

boot_system: debian.qcow2 boot/vmlinuz boot/initrd.gz
	bash qemu.sh
