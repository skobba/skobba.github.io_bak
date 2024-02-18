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

__Setup disks__
```
ls -l /dev/disk/by-id/

# 1) get the uuid
scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN -> ../../sdb

DISK1=/dev/disk/by-id/scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN
DISK2=/dev/disk/by-id/scsi-SATA_INTEL_SSDSC2KB24_BTYS82060704240AGN

same?

DISK1=/dev/disk/by-id/scsi-355cd2e414f68789a
DISK2=/dev/disk/by-id/scsi-355cd2e414f687946

# 2) disable automount
gsettings set org.gnome.desktop.media-handling automount false

# 3) install zfs and utils
sudo -i
apt update
apt install --yes debootstrap gdisk zfsutils-linux
systemctl stop zed

swapoff --all

# 4) If the disk was previously used with zfs
wipefs -a $DISK1
wipefs -a $DISK2

# 5) full-disk discard (TRIM/UNMAP), which can improve performance
blkdiscard -f $DISK1
blkdiscard -f $DISK2

# 6) Clear the partition table
sgdisk --zap-all $DISK1
sgdisk --zap-all $DISK2

# 7) Create bootloader partition
sgdisk     -n1:1M:+512M   -t1:EF00 $DISK1
sgdisk     -n1:1M:+512M   -t1:EF00 $DISK2
```

___Note:___ _While the Ubuntu installer uses an MBR label for legacy (BIOS) booting, this HOWTO uses GPT partition labels for both UEFI and legacy (BIOS) booting. This is simpler than having two options. It is also provides forward compatibility (future proofing). In other words, for legacy (BIOS) booting, this will allow you to move the disk(s) to a new system/motherboard in the future without having to rebuild the pool (and restore your data from a backup). The ESP is created in both cases for similar reasons. Additionally, the ESP is used for /boot/grub in single-disk installs._

Choose one of the following options if you want swap:
```
# For a single-disk install:
sgdisk     -n2:0:+500M    -t2:8200 $DISK1

# For a mirror or raidz topology:
sgdisk     -n2:0:+500M    -t2:FD00 $DISK
```

Adjust the swap swize
```
sgdisk     -n3:0:+2G      -t3:BE00 $DISK1
```

Create a root pool partition:
```
# Unencrypted or ZFS native encryption:
sgdisk     -n4:0:0        -t4:BF00 $DISK1
```

_If you are creating a mirror or raidz topology, repeat the partitioning commands for all the disks which will be part of the pool._

_You should not need to customize any of the options for the boot pool. Ignore the warnings about the features "not in specified ‘compatibility’ feature set."_

Create the boot pool:
```
zpool create \
    -o ashift=12 \
    -o autotrim=on \
    -o cachefile=/etc/zfs/zpool.cache \
    -o compatibility=grub2 \
    -o feature@livelist=enabled \
    -o feature@zpool_checkpoint=enabled \
    -O devices=off \
    -O acltype=posixacl -O xattr=sa \
    -O compression=lz4 \
    -O normalization=formD \
    -O relatime=on \
    -O canmount=off -O mountpoint=/boot -R /mnt \
    bpool ${DISK1}-part3
```

If you are creating a mirror topology, create the pool using:
```
zpool create \
    ... \
    bpool mirror \
    /dev/disk/by-id/scsi-SATA_disk1-part3 \
    /dev/disk/by-id/scsi-SATA_disk2-part3
```

Create the root pool:
```
zpool create \
    -o ashift=12 \
    -o autotrim=on \
    -O acltype=posixacl -O xattr=sa -O dnodesize=auto \
    -O compression=lz4 \
    -O normalization=formD \
    -O relatime=on \
    -O canmount=off -O mountpoint=/ -R /mnt \
    rpool ${DISK1}-part4
```

If you are creating a mirror topology, create the pool using:
```
zpool create \
    ... \
    rpool mirror \
    /dev/disk/by-id/scsi-SATA_disk1-part4 \
    /dev/disk/by-id/scsi-SATA_disk2-part4
```

Create filesystem datasets to act as containers:
```
zfs create -o canmount=off -o mountpoint=none rpool/ROOT
zfs create -o canmount=off -o mountpoint=none bpool/BOOT
```

Create filesystem datasets for the root and boot filesystems:
```
UUID=$(dd if=/dev/urandom bs=1 count=100 2>/dev/null |
    tr -dc 'a-z0-9' | cut -c-6)

zfs create -o mountpoint=/ \
    -o com.ubuntu.zsys:bootfs=yes \
    -o com.ubuntu.zsys:last-used=$(date +%s) rpool/ROOT/ubuntu_$UUID

zfs create -o mountpoint=/boot bpool/BOOT/ubuntu_$UUID
```

















