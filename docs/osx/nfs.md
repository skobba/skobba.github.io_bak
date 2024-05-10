# NFS

## Mount from osx
```sh
mount -o vers=4,resvport -t nfs 10.10.1.200:/mnt/rpool/movies /Users/youruser/nfs_share

# Umount
# diskutil unmount force  /Users/youruser/nfs_share
```
