# qemu_debian_armhf

Makefile to install Debian Buster for 32-bit ARM in a QEMU virtual machine.

Intented for building code for Raspberry Pi Zero.

The [`versatilepb`](https://www.qemu.org/docs/master/system/arm/versatile.html)
QEMU machine type is often used for Raspberry Pi Zero emulation.
However, this is limited to 1 CPU and 256MB RAM.

Here the [`virt`](https://www.qemu.org/docs/master/system/arm/virt.html)
machine type is used with 4 CPUs and 4G RAM in an attempt to improve
compile performance.

To start the [Debian installer](https://www.debian.org/distrib/netinst) type:

```sh
% make boot_installer
```

To boot the installed system type:

```sh
% make boot_system
```

Based on:
https://translatedcode.wordpress.com/2016/11/03/installing-debian-on-qemus-32-bit-arm-virt-board/
