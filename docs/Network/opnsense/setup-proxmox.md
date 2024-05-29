# Setup OPNSense on Proxmox

## Install opnsense
Download the amd64 - dvd -> [https://opnsense.org/download](https://opnsense.org/download)

Unzip to iso with:
```sh
bzip2 -d OPNsense-xxxxxxxx.iso
```

Create virtual bridges in Proxmox.

Create vm in Proxmox.

Start the vm, let it boot into live mode and login as installer/opnsense, and the installer will start.

Select:
* ZFS
* stripe

NB: After install is completed, don´t let it reboot! Press Ctl-C to abort reboot and run ```shutdown``` from terminal so you can remove the CDROM from the vm before starting.

