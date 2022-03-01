# LXC

## Images
* [http://download.proxmox.com/images/system/](http://download.proxmox.com/images/system/)

Path to images:
* LXC Template ```/var/lib/vz/template/cache```
* LXC Config ```/etc/pve/lxc```

Create
```
pct create XXX /var/lib/vz/template/cache/ubuntu-20.04-standard_20.04-1_amd64.tar.gz \
    -arch amd64 \
    -ostype ubuntu \
    -hostname ubXXX \
    -features keyctl=1,nesting=1 \
    -cores 2 \
    -memory 4096 \
    -swap 0 \
    -storage local-zfs \
    -password \
    -unprivileged 1 \
    -net0 name=eth0,bridge=vmbr0,gw=10.10.2.1,ip=10.10.2.XXX/24,type=veth
```

Destroy

    pct destroy XXX --destroy-unreferenced-disks --purge
