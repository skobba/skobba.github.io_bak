# OPNSense
## Setup
Download the amd64 - dvd -> [https://opnsense.org/download](https://opnsense.org/download)

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


