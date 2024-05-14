# NFS

* Statefullness from version 4
* By default ```mount``` begins from upper NFS protocol version and descends to lower

## NFSv4 ACL
Set NFSv4 ACL -> Datasets -> Edit -> Advanced -> ACL Mode -> SMB/NFSv4

_Changes to ACL type affect how on-disk ZFS ACL is written and read. When the ACL type is changed from POSIX to NFSv4, no migration is performed for default and access ACLs encoded in the posix1e acl extended attributes to native ZFS ACLs. When ACL type is changed from NFSv4 to POSIX, native ZFS ACLs are not converted to posix1e extended attributes, but the native ACL will be used internally by ZFS for access checks. This means that the user must manually set new ACLs recursively on the dataset after ACL type changes in order to avoid unexpected permissions behavior. This action will be destructive, and so it is advised to take a ZFS snapshot of the dataset prior to ACL type changes and permissions modifications._

## Connecting from Linux

```sh
apt-get -y install nfs-common

# mount -t nfs {IPaddressOfTrueNASsystem}:{path/to/nfsShare} {localMountPoint}
mount -t nfs 10.10.1.200:/mnt/rpool/movies /mnt/movies
```
