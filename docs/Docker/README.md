# Docker

## Docker on zfs
* https://docs.docker.com/storage/storagedriver/zfs-driver/


### Setup fuse-overlayfs
Ref: https://c-goes.github.io/posts/proxmox-lxc-docker-fuse-overlayfs/
In Proxmox VE create a unprivileged LXC container with fuse=1,keyctl=1,mknod=1,nesting=1 (I’m not sure if all are needed). In this case I use a Ubuntu 18.04 container.

1. Installation of fuse-overlayfs
fuse-overlayfs is a similar to overlayfs runs in userspace and can be used without root permissions1. Unlike overlayfs, fuse-overlayfs can be also used when the backing filesystem is ZFS, like on Proxmox VE.

2. Inside container, install a static version of fuse-overlayfs. and place it in /usr/local/bin so it’s named /usr/local/bin/fuse-overlayfs.

3. Tell docker to use fuse-overlayfs
```
echo -e '{\n  "storage-driver": "fuse-overlayfs"\n}' >> /etc/docker/daemon.json
```
