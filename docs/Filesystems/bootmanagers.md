# Bootmanagers
## UEFI
Ref: [https://www.linuxbabe.com/command-line/how-to-use-linux-efibootmgr-examples](https://www.linuxbabe.com/command-line/how-to-use-linux-efibootmgr-examples)

UEFI stands for Unified Extensible Firmware Interface. It's a modern replacement for the traditional BIOS (Basic Input/Output System) firmware found on most computers. UEFI provides more functionality and flexibility compared to BIOS, including:
* support for larger hard drives
* faster boot times
* improved security features
* support for newer hardware standards

UEFI firmware is stored on a special non-volatile memory chip on the motherboard of a computer, known as the SPI (Serial Peripheral Interface) flash memory. This memory chip holds the UEFI firmware code and data necessary to initialize hardware components and boot the operating system.

*Faster boot then legacy BIOS* 

Check if system is using UEFI
```
ls /sys/firmware/efi
```

Check boot order
```
# View entries
efibootmgr

BootCurrent: 0000
Timeout: 1 seconds
BootOrder: 0003,0000,0006,0007,0002,0001
Boot0000* ubuntu
Boot0001  Network Card
Boot0002* UEFI: Built-in EFI Shell
Boot0003  Hard Drive
Boot0006* ubuntu
Boot0007* UEFI OS

# Changing Boot Order
sudo efibootmgr -o 0013,0012,0014

# Add entry
sudo apt install grub-efi
sudo mount /dev/sda7 /boot/efi/
sudo grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi/

# Deleting entry
sudo efibootmgr -b <bootnum> -B
```

### /boo/efi during installation
``` 
root@supermicro:~# cat /etc/fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# systemd generates mount units based on this file, see systemd.mount(5).
# Please run 'systemctl daemon-reload' after making changes here.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sdb2 during installation
UUID=d007fa48-229f-40d9-a1d1-b7e90a2249ac /               ext4    errors=remount-ro 0       1
# /boot/efi was on /dev/sdb1 during installation
UUID=FEB1-680E  /boot/efi       vfat    umask=0077      0       1
# swap was on /dev/sdb3 during installation
UUID=fc18ccfa-e8da-400d-9ab7-8e7fe19e9056 none            swap    sw              0       0
```
