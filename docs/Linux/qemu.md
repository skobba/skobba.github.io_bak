# QEMU
Virtualization with KVM ( Kernel-based Virtual Machine ) + QEMU.
It requires that the CPU on your computer has a feature Intel VT or AMD-V. 

## Install
```
# KVM and qemu
apt update
apt -y install qemu-kvm libvirt-clients libvirt-daemon-system virtinst bridge-utils
apt -y install qemu-utils qemu-system-x86 qemu-system-gui

# KVM - the --no-install-recommends apt option prevent installation of extraneous graphical packages:
apt -y install --no-install-recommends qemu-system libvirt-clients libvirt-daemon-system

# setup libvirtd
systemctl start libvirtd
systemctl enable libvirtd

# Add user to group
adduser youruser libvirt
usermod -a -G libvirt youruser

# Creating a new guest
virt-install --virt-type kvm --name bookworm-amd64 \
--cdrom ~/debian-testing-amd64-netinst.iso \
--disk size=10 --memory 1024

# Check CPU flags
egrep -m 1 "svm|vmx" /proc/cpuinfo
svm -> AMD CPU capable of virtualization.
vmx -> Intel CPU capable of virtualization.

# cpu-checker
apt install cpu-checker -y
kvm-ok

# module check
lsmod|grep kvm

```
## Config
```
vi /etc/libvirt/qemu.conf
```

## Basic
```
qemu-img create -f qcow2 debian.qcow 2G
wget  https://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso
qemu-system-x86_64 -hda debian.img -cdrom debian-testing-amd64-netinst.iso -boot d -m 512
```

## Files
```
# Check file info
qemu-img info debian.qcow2
```

## Resize
```
# Image
qemu-img resize debian.qcow2 8G

# Disk
qm resize 400 scsi0 +5G
```

## Show info on vm
```
qm show 400
```

## Run with qemu-system-x86_64
```sh
qemu-system-x86_64 \
    -m 2048 \
    -smp 2 \
    -drive file=debian-11-nocloud-amd64-20240211-1654.qcow2,media=disk,if=virtio \
    -nic user,model=virtio \
    -nographic
```

## List vms
```
qm list
qm list | awk '{print $1, $2}'
```

## List running vms using watch
```
# Create a file
cat >./list_vms.sh<<EOF
#!/bin/bash
qm list | awk '$3 == "running" {print $1, $2}'
EOF
chmod +x ./list_vms.sh

# Time
watch -n 1 ./list_vms.sh 2>/dev/null
# No time
watch --no-title -n 1 ./list_vms.sh
```

## Snapshot
```
# Snap
qm snapshot <vmid> <snap-name>
qm snapshot 401 ip -d "New iP: 10.10.9.41"

# Delete
qm delsnapshot <vmid> <snap-name>

# Rollback
qm snapshot <vmid> rollback <snapshot_name>
```

## iso from vm
```
qm extractcd [VMID] [DEVICE] [ISO_FILENAME].iso
```

## vm from iso
```
 qemu-img convert -O raw /var/lib/vz/images/[VMID]/[DISKID].qcow2 [ISO_FILENAME].iso
```

