# qemu_debian_armhf

Makefile to install Debian Buster for 32-bit ARM in a QEMU virtual machine.

Intented for building code for for Raspberry Pi Zero.

The [`versatilepb` QEMU machine type](https://www.qemu.org/docs/master/system/arm/versatile.html)
is often used for Raspberry Pi Zero emulation. However, this is limited to 1 CPU and 256MB RAM.

Here the [`virt` QEMU machine type](https://www.qemu.org/docs/master/system/arm/virt.html)
is used with 4 CPUs and 4G RAM in an attempt to improve compile performance.

Based on:
https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/
