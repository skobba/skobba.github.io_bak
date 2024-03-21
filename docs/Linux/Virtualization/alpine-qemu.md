# Alpine in qemu
Ref: https://wiki.alpinelinux.org/wiki/Install_Alpine_in_QEMU

```
cd /kvm/base
wget https://dl-cdn.alpinelinux.org/alpine/v3.19/releases/x86_64/alpine-standard-3.19.1-x86_64.iso

qemu-img create -f qcow2 alpine.qcow2 8G

# This does not specify disk like "sda", it becomes "vda"
qemu-system-x86_64 \
    -enable-kvm \
    -m 2048 \
    -nic user,model=virtio \
    -drive file=alpine.qcow2,media=disk,if=virtio \
    -cdrom /kvm/base/alpine-standard-3.19.1-x86_64.iso \
    -nographic

# Install to hda
qemu-system-x86_64 \
    -enable-kvm \
    -m 2048 \
    -nic user,model=virtio \
    -hda alpine.qcow2 \
    -cdrom /kvm/base/alpine-standard-3.19.1-x86_64.iso \
    -nographic

# Start after install (without cdrom)
qemu-system-x86_64 \
    -enable-kvm \
    -m 2048 \
    -nic user,model=virtio \
    -hda alpine.qcow2 \
    -nographic


apk add lsblk
lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
fd0      2:0    1    0B  0 disk
sda      8:0    0    8G  0 disk
├─sda1   8:1    0  300M  0 part /boot
├─sda2   8:2    0    2G  0 part [SWAP]
└─sda3   8:3    0  5.7G  0 part /
sr0     11:0    1 1024M  0 rom

pkill -f qemu-system-x86_64

virt-install \
  --name alp1 \
  --memory 2048 \
  --vcpus 2 \
  --disk /kvm/images/alpine.qcow2 \
  --import \
  --os-variant debian11 \
  --noautoconsole

myvm=alp1
virsh shutdown $myvm
virsh destroy $myvm ; virsh undefine $myvm

noautoconsole
```
