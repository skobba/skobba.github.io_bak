# KVM

3 ways to get a ZFS pool to a Proxmox VM (TrueNAS).

* ZFS over SCSI - Could I import my existing ZFS pool or do I have to create a new one?
  Would I have to use this? https://github.com/TheGrandWazoo/freenas-proxmox
* Virtual Disk - 
https://pve.proxmox.com/wiki/Physical_disk_to_kvm
https://forum.proxmox.com/threads/passing-a-volume-zfs-pool-through-to-a-vm.36026/
Would I have to do anything other than just export the pool in Proxmox and then import them in FreeNAS?
* PCI Pass-through - 
FreeNAS Recommended
I have 1 PCI RAID controller with 6 disks on it but I just want 1 disk to be passed through. Will I be able to pass through just one disk? Or could I pass through all even though Proxmox itself is installed on a disk on that same RAID controller?

Which one will be the fastest?
