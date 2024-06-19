# vm
* https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso

## qm
Ref.: [https://pve.proxmox.com/pve-docs/qm.1.html](https://pve.proxmox.com/pve-docs/qm.1.html)

## qmrestore
```sh
qmrestore vzdump-qemu-152-2024_04_30-11_44_04.vma.lzo 190
```

## CloudInit
```
mkdir /var/lib/vz/template/cloudinit
pushd /var/lib/vz/template/cloudinit

# download the image
wget https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/cloud/nocloud_alpine-3.19.1-x86_64-uefi-cloudinit-r0.qcow2

# create a new VM with VirtIO SCSI controller
qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-single

# import the downloaded disk to the local-lvm storage, attaching it as a SCSI drive
qm set 9000 --scsi0 local-zfs:0,import-from=/var/lib/vz/template/cloudinit/nocloud_alpine-3.19.1-x86_64-uefi-cloudinit-r0.qcow2

# Configure a CD-ROM drive
qm set 9000 --ide2 local-zfs:cloudinit

# This will speed up booting, because VM BIOS skips the testing for a bootable CD-ROM.
qm set 9000 --boot order=scsi0

# Configure a serial console and use it as a display
qm set 9000 --serial0 socket --vga serial0

# Convert the VM into a template, quickly create linked clones. The deployment from VM templates is much faster than creating a full clone (copy).
qm template 9000

# Deploy such a template by cloning:
qm clone 9000 123 --name alpineci

# SSH public key used for authentication, and configure the IP setup:
qm set 123 --sshkey ~/.ssh/id_rsa.pub
qm set 123 --ipconfig0 ip=10.0.10.123/24,gw=10.0.10.1
```



## Stop hanging machines
```
rm /var/lock/qemu-server/lock-ID.conf
qm unlock ID
qm stop ID
```
