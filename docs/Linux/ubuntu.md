# Ubuntu

## Add zfs support
```
sudo apt udpate
sudo apt install zfsutils-linux
sudo modprobe zfs
zfs --version
```

Required for booting from zfs:
```
sudo apt install zfs-initramfs
```

## Root on ZFS
Ref.: https://openzfs.github.io/openzfs-docs/Getting%20Started/Ubuntu/Ubuntu%2022.04%20Root%20on%20ZFS.html#step-1-prepare-the-install-environment

__NB: Always use the long /dev/disk/by-id/* aliases with ZFS!__
```
ls -l /dev/disk/by-id/

# get the uuid
scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN -> ../../sdb

DISK1=/dev/disk/by-id/scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN
DISK2=/dev/disk/by-id/scsi-SATA_INTEL_SSDSC2KB24_BTYS82060704240AGN

same?

DISK1=/dev/disk/by-id/scsi-355cd2e414f68789a
DISK2=/dev/disk/by-id/scsi-355cd2e414f687946
```

### disable automount
gsettings set org.gnome.desktop.media-handling automount false
sudo -i
apt update
apt install --yes debootstrap gdisk zfsutils-linux
systemctl stop zed

swapoff --all

### If the disk was previously used with zfs:
```
wipefs -a $DISK1
wipefs -a $DISK2
```



```
