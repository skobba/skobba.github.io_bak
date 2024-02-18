# Tools

## gdisk
gdisk - Partition tool
```
gdisk /dev/sdc
```

lsblk - Lists connected disks
```
lsblk -o name,mountpoint,label,size,uuid
```

## /dev/disk
```
ls -l /dev/disk/by-id/

Result:
lrwxrwxrwx 1 root root  9 Feb 18 20:59 scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN -> ../../sdb
lrwxrwxrwx 1 root root 10 Feb 18 20:59 scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN-part1 -> ../../sdb1
lrwxrwxrwx 1 root root 10 Feb 18 20:59 scsi-SATA_INTEL_SSDSC2KB24_BTYS820606UV240AGN-part9 -> ../../sdb9
lrwxrwxrwx 1 root root  9 Feb 18 20:59 scsi-SATA_INTEL_SSDSC2KB24_BTYS82060704240AGN -> ../../sda
lrwxrwxrwx 1 root root 10 Feb 18 20:59 scsi-SATA_INTEL_SSDSC2KB24_BTYS82060704240AGN-part1 -> ../../sda1
lrwxrwxrwx 1 root root 10 Feb 18 20:59 scsi-SATA_INTEL_SSDSC2KB24_BTYS82060704240AGN-part9 -> ../../sda9
```

## lsblk
```
lsblk -o NAME,UUID /dev/sda
blkid /dev/sda
```
