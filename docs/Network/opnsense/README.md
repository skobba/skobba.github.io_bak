# OPNSense
## Setup
Download the amd64 - dvd -> [https://opnsense.org/download](https://opnsense.org/download)

Unzip to iso with:
```sh
bzip2 -dk OPNsense-xxxxxxxx.iso

# and if physical install - NB: note the "r" in front of the disk name
sudo dd if=./Downloads/OPNsense-24.1-dvd-amd64.iso of=/dev/rdisk4 bs=16k status=progress
```

Create virtual bridges.

Create vm.

### Install opnsense
Start the vm, let it boot into live mode and login as installer/opnsense.

Run:
```sh
installer
```
Select:
* ZFS
* stripe

Shutdown and remove the CDROM from the vm.

## DNS
Ref.: 
* [How to Configure DNS over TLS (DoT) Using Unbound DNS in OPNsense](https://homenetworkguy.com/how-to/configure-dns-over-tls-unbound-opnsense/)
* [HAProxy + Let's Encrypt Wildcard Certificates](https://forum.opnsense.org/index.php?topic=23339.0)


