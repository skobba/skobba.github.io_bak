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

## Shutdown/Reboot
```
poweroff
reboot
```

## Enable ssh
```
apk add openssh

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

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
cat >/etc/network/interfaces<<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 192.168.122.41/24
    gateway 192.168.122.1
EOF
```

Hostname
```
hostname myhost

Set hostname permanently:
echo myhost > /etc/hostname

vi /etc/hosts
echo "127.0.0.1   myhost" >> /etc/hosts

uuidgen > /etc/machine-id

service networking restart
```

Nameservers
```
cat <<EOF >> /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF
```

## Services
List:
```
rc-status --servicelist
rc-status --servicelist | grep started
```

## Start/Stop
```sh
service <service_name> start
service <service_name> stop
service <service_name> restart
```

## boot
Enable service on boot:
```
rc-update add containerd boot

# See result
rc-update
```

Network:
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
### View mounted disks
```
apk update

apk add util-linux
lsblk

or

apk add udisks2
udisksctl status
```

### Resize disk
```
# after the virtual disk has already been expanded
apk add --no-cache cfdisk e2fsprogs-extra

# choose partition then "Resize" > "Write" (to finalize)
cfdisk

# replace * with partition you are resizing
resize2fs /dev/*
```
