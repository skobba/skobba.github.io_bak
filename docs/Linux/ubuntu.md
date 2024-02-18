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
