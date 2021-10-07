# Proxmox

## Directories
* Template ```/var/lib/vz/template/iso```
* LXC Template ```/var/lib/vz/template/cache```
* LXC Config ```/etc/pve/lxc```

## Some Commands
List ids
```
cat /etc/pve/.vmlist | jq '.ids |= keys | .ids  | .[]' | tr -d '"'
```

Stop all lxc
```
cat /etc/pve/.vmlist | jq '.ids |= keys | .ids  | .[]' | tr -d '"' | xargs -n1 pct stop
```

Destroy all lxc
```
cat /etc/pve/.vmlist | jq '.ids |= keys | .ids  | .[]' | tr -d '"' | xargs -n1 pct destroy
```

Run script on lxc
```
cat shellscript.sh | lxc-attach <id> bash
lxc-attach -n <id> -- /sbin/ip a
lxc-attach -n <id> -- /usr/bin/apt update
```

## VM
```
qm unlock 100
qm stop 100
qm destory 100
```

## LXC

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

Sample of creating an container:
```
pct create 200 /var/lib/vz/template/cache/debian-10-standard_10.7-1_amd64.tar.gz \
    -arch amd64 \
    -ostype ubuntu \
    -hostname deb10 \
    -features keyctl=1,nesting=1 \
    -cores 2 \
    -memory 4096 \
    -swap 0 \
    -storage local-zfs \
    -password \
    -unprivileged 1 \
    -net0 name=eth0,bridge=vmbr0,gw=10.10.2.1,ip=10.10.2.200/24,type=veth
```


