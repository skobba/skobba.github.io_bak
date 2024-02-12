# Alpine
Ref.: 
* [Kubernetes on alpine](https://wiki.alpinelinux.org/wiki/K8s)
* [https://github.com/red-lichtie/alpine-cloud-init](https://github.com/red-lichtie/alpine-cloud-init)

## Install from iso
1. Download iso from [https://alpinelinux.org/downloads/](https://alpinelinux.org/downloads/) and boot from the iso.
2. Install on local hd with:

```
setup-alpine

# select
Allow root ssh login: yes
How would you like to use it: sys
```

## Enable ssh
```
vi /etc/ssh/sshd_config
PermitRootLogin yes

service sshd restart
```

## apk
Common repos:
```
cat <<EOF > /etc/apk/repositories
http://dl-cdn.alpinelinux.org/alpine/latest-stable/main
http://dl-cdn.alpinelinux.org/alpine/latest-stable/community
http://dl-cdn.alpinelinux.org/alpine/edge/main
http://dl-cdn.alpinelinux.org/alpine/edge/community
EOF

apk update
```

## Network
Interfaces
```
/etc/network/interfaces
```

Nameservers
```
cat <<EOF >> /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF
```

## Services
```
/etc/init.d/networking restart

or

service networking restart
```

## Shutdown
```
poweroff
```

## Disk management
__To see the mounted disks__
```
apk update

apk add util-linux
lsblk

or

apk add udisks2
udisksctl status
```

