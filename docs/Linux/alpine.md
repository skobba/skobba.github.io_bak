# Alpine
Ref.: 
* [Kubernetes on alpine](https://wiki.alpinelinux.org/wiki/K8s)
* [https://github.com/red-lichtie/alpine-cloud-init](https://github.com/red-lichtie/alpine-cloud-init)

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

## cloud-init
```
cat <<EOF >> /etc/cloud/cloud.cfg
# Set the datasource to be auto-discovered
datasource_list: [ None ]

# Specify users and groups to create
system_info:
  default_user:
    name: myuser
    lock_passwd: true
    gecos: My User
    groups: [wheel]
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]

network:
  version: 2
  ethernets:
    eth0:
      addresses: [10.10.9.84/24]
      gateway4: 10.10.9.1
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]

# Set the hostname
hostname: myhostname

# Disable managing resolv.conf
manage_resolv_conf: false

# Disable setting hostname during boot
set_hostname: false
EOF
```

