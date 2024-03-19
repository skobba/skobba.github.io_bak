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

# Changing Boot Order
sudo efibootmgr -o 0013,0012,0014

# Add entry
sudo apt install grub-efi
sudo mount /dev/sda7 /boot/efi/
sudo grub-install /dev/sda --target=x86_64-efi --efi-directory=/boot/efi/

# Deleting entry
sudo efibootmgr -b <bootnum> -B
```
