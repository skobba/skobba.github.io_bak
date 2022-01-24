# Docker

## Understanding Docker
Ref.: [https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci](https://www.tutorialworks.com/difference-docker-containerd-runc-crio-oci)

```
   ┌─────────────┐          ┌─────────────────┐
   │             │          │                 │
   │   docker    │          │   Kubernetes    │
   │             │          │                 │
   └──────┬──────┘          └───────┬─────────┘
          │                         │
          │         ┌───────────────▼─────────────────┐
          │         │                                 │
          │         │              CRI                │
          │         │                                 │
          │         │  Container Runtime Interface    │
          │         │                                 │
          │         └────────────────┬────────────────┘
          │                          │
          │     ┌────────────────────┤
          │     │                    │
    ┌─────▼─────▼────┐       ┌───────▼─────┐
    │                │       │             │
    │   containerd   │       │   docker    │
    │                │       │             │
    └────────┬───────┘       └───────┬─────┘
             │                       │
             │                       │
  ┌──────────▼───────────────────────▼─────┐
  │                                        │
  │ Open Container Initiative (OCI) spec   │
  │                                        │
  └───────────────────┬────────────────────┘
                      │
                      │
                 ┌────▼─────┐
                 │          │
                 │   runc   │
                 │          │
                 └────┬─────┘
                      │
       ┌──────────────┴──────────────┐
       │                             │
       │                             │
┌──────▼───────┐            ┌────────▼──────┐
│              │            │               │
│  container   │            │   container   │
│              │            │               │
└──────────────┘            └───────────────┘
```

## Directories
- Containers: /var/lib/docker
## Docker on zfs
* https://docs.docker.com/storage/storagedriver/zfs-driver/


## Setup fuse-overlayfs
Ref: https://c-goes.github.io/posts/proxmox-lxc-docker-fuse-overlayfs/

In Proxmox VE create a unprivileged LXC container with fuse=1,keyctl=1,mknod=1,nesting=1 (I’m not sure if all are needed). In this case I use a Ubuntu 18.04 container.

1. Installation of fuse-overlayfs
fuse-overlayfs is a similar to overlayfs runs in userspace and can be used without root permissions1. Unlike overlayfs, fuse-overlayfs can be also used when the backing filesystem is ZFS, like on Proxmox VE.
Download [fuse-overlayfs](https://github.com/containers/fuse-overlayfs/releases)
```
curl -L https://github.com/containers/fuse-overlayfs/releases/download/v1.7.1/fuse-overlayfs-x86_64 -o /usr/local/bin/fuse-overlayfs

chmod +x /usr/local/bin/fuse-overlayfs
```

2. Inside container, install a static version of fuse-overlayfs. and place it in /usr/local/bin so it’s named /usr/local/bin/fuse-overlayfs.

3. Tell docker to use fuse-overlayfs
```
systemctl stop docker
echo -e '{\n  "storage-driver": "fuse-overlayfs"\n}' >> /etc/docker/daemon.json
systemctl start docker
```
