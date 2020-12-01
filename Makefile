# Install Debian Buster for 32-bit ARM (armhf)
#
# https://translatedcode.wordpress.com
# /2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/

KERNEL_URL=\
http://http.us.debian.org\
/debian/dists/buster/main/installer-armhf/current/images/netboot/vmlinuz

INITRD_URL=\
http://http.us.debian.org\
/debian/dists/buster/main/installer-armhf/current/images/netboot/initrd.gz


all: boot_system

boot/vmlinuz_installer:
	curl -L $KERNEL_URL > $@

boot/initrd_installer.gz:
	curl -L $INITRD_URL > $@

debian.qcow2:
	qemu-img create -f qcow2 $@ 4G

boot_installer: boot/vmlinuz_installer boot/initrd_installer.gz debian.qcow2
	bash qemu_installer.sh

boot_system: boot/vmlinuz boot/initrd.gz debian.qcow2
	bash qemu.sh
