# Setup OPNSense on Proxmox

## Install OPNSense
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

## Setup OPNSense
### Initial Setup
At this step:
* OPNSense __does not__ have internet
* Proxmox has internet

![opnsense-init-setup.png](opnsense-init-setup.png)

### Intermediat Setup
* Proxmox __does not__ have internet
At this step:
* OPNSense has internet
* Setup is more or less complete with the following interfaces
** WAN <- for internet access
** LAN <- for servers
** OPT2 <- for wifi router.

![opnsense-intermediat-setup.png](opnsense-intermediat-setup.png)

### Final Setup
* OPNSense has internet
* Proxmox has internet (via the loopback cabel from ```VIR``` to ```MNG```

![opnsense-final-setup.png](opnsense-final-setup.png)
