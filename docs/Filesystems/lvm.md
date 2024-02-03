# LVM
Main components:
* Physical Volumes
* Volume Groups
* Logical Volumes


Direct counterparts:
```
Disk Partitioning System 	      LVM
Partitions               ->     Logical Volumes
Disks                    ->     Volume Groups
```

```sh
lvm> vgs
  VG  #PV #LV #SN Attr   VSize    VFree 
  pve   1   6   0 wz--n- <930.51g 16.00g
lvm> pvs
  PV             VG  Fmt  Attr PSize    PFree 
  /dev/nvme0n1p3 pve lvm2 a--  <930.51g 16.00g
lvm> 
lvm> lvs
  LV            VG  Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  data          pve twi-aotz-- 794.30g             0.28   0.25                            
  root          pve -wi-ao----  96.00g                                                    
  swap          pve -wi-ao----   8.00g                                                    
  vm-100-disk-0 pve Vwi-aotz--  50.00g data        3.13                                   
  vm-202-disk-0 pve Vwi-aotz--   4.00g data        16.25                                  
  vm-301-disk-0 pve Vwi-aotz--  50.00g data        0.00                                   
lvm> 
```

```sh
root@pvemini:/dev# lsblk
NAME                         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                            8:0    1   3.8G  0 disk 
├─sda1                         8:1    1   240K  0 part 
├─sda2                         8:2    1     8M  0 part 
├─sda3                         8:3    1   1.2G  0 part 
└─sda4                         8:4    1   300K  0 part 
nvme0n1                      259:0    0 931.5G  0 disk 
├─nvme0n1p1                  259:1    0  1007K  0 part 
├─nvme0n1p2                  259:2    0     1G  0 part /boot/efi
└─nvme0n1p3                  259:3    0 930.5G  0 part 
  ├─pve-swap                 252:0    0     8G  0 lvm  [SWAP]
  ├─pve-root                 252:1    0    96G  0 lvm  /
  ├─pve-data_tmeta           252:2    0   8.1G  0 lvm  
  │ └─pve-data-tpool         252:4    0 794.3G  0 lvm  
  │   ├─pve-data             252:5    0 794.3G  1 lvm  
  │   ├─pve-vm--100--disk--0 252:6    0    50G  0 lvm  
  │   ├─pve-vm--202--disk--0 252:7    0     4G  0 lvm  
  │   └─pve-vm--301--disk--0 252:8    0    50G  0 lvm  
  └─pve-data_tdata           252:3    0 794.3G  0 lvm  
    └─pve-data-tpool         252:4    0 794.3G  0 lvm  
      ├─pve-data             252:5    0 794.3G  1 lvm  
      ├─pve-vm--100--disk--0 252:6    0    50G  0 lvm  
      ├─pve-vm--202--disk--0 252:7    0     4G  0 lvm  
      └─pve-vm--301--disk--0 252:8    0    50G  0 lvm
```

lvs
```
root@pvemini:~# lvs
  LV            VG  Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  data          pve twi-aotz-- 794.30g             0.49   0.25                            
  root          pve -wi-ao----  96.00g                                                    
  swap          pve -wi-ao----   8.00g                                                    
  vm-100-disk-0 pve Vwi-aotz--  50.00g data        3.26                                   
  vm-202-disk-0 pve Vwi-aotz--   4.00g data        17.97                                  
  vm-301-disk-0 pve Vwi-aotz--  50.00g data        3.15
```
