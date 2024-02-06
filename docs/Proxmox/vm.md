# vm
* https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso

## Stop hanging machines
```
rm /var/lock/qemu-server/lock-ID.conf
qm unlock ID
qm stop ID
```
