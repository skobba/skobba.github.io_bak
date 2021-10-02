# Proxmox

## Directories
* Template ```/var/lib/vz/template/iso```
* LXC Config ```/etc/pve/lxc```

## VM
### Commands
```
qm unlock 100
qm stop 100
qm destory 100
```

## LXC
### Config files
```
/etc/pve/lxc/
``` 

### Create
Create command and div setup:
```
pct create <id> /var/lib/vz/template/cache/debian-10-standard_10.5-1_amd64.tar.gz \
    -arch amd64 \
    -ostype <centos|ubuntu|etc> \
    -hostname <hostname> \
    -cores <cores> \
    -memory <memory(MB)> \
    -swap <swap(MB)> \
    -storage local-zfs \
    -password \
    -unprivileged 1 \
    -net0 name=eth0,bridge=<bridge>,gw=<gateway>,ip=<cidr>,type=veth  &&\
pct start <id> &&\
sleep 10 &&\
pct resize <id> rootfs <storage(ex: +4G)> &&\
pct exec <id> -- bash -c "yum update -y &&\
    yum install -y openssh-server &&\
    systemctl start sshd &&\
    useradd -mU someuser &&\
    echo "somepassword" | passwd --stdin someuser"
```

Sample of creating an unprivileged container:
```
pct create 210 /var/lib/vz/template/cache/debian-10-standard_10.5-1_amd64.tar.gz \
    -arch amd64 \
    -ostype ubuntu \
    -hostname debcons \
    -cores 2 \
    -memory 4096 \
    -swap 0 \
    -storage local-zfs \
    -password \
    -unprivileged 0 \
    -net0 name=eth0,bridge=vmbr0,gw=10.10.2.1,ip=10.10.2.210/24,type=veth
```


