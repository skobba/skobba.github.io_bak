# Alpine
Ref.: 
* [Kubernetes on alpine](https://wiki.alpinelinux.org/wiki/K8s)
* [https://github.com/red-lichtie/alpine-cloud-init](https://github.com/red-lichtie/alpine-cloud-init)

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
