# Incus
_Incus is a modern, secure and powerful system container and virtual machine manager._

## Install
Setup the key
```
mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.zabbly.com/key.asc -o /etc/apt/keyrings/zabbly.asc
```

Add the apt repository
```
vi /etc/apt/sources.list.d/zabbly-incus-stable.sources
NB: Change bookworm to bullseye for debian 11

Enabled: yes
Types: deb
URIs: https://pkgs.zabbly.com/incus/stable
Suites: bookworm
Components: main
Signed-By: /etc/apt/keyrings/zabbly.asc
```

```
apt update
apt install incus
```

## Initialize Incus
```
incus admin init
incus admin init --minimal

NB: skipped this:
config:
  core.https_address: 192.0.2.1:9999
  images.auto_update_interval: 15

cat <<EOF | incus admin init --preseed
networks:
- name: incusbr0
  type: bridge
  config:
    ipv4.address: auto
    ipv6.address: none
EOF

```

## Profile
View:
```
incus profile list

incus profile show k8s
```

Create
```
cat <<EOF | incus profile edit k8s
config:
  limits.cpu: "2"
  limits.memory: 2GB
  limits.memory.swap: "false"
  linux.kernel_modules: ip_tables,ip6_tables,nf_nat,overlay,br_netfilter
  raw.lxc: "lxc.apparmor.profile=unconfined\nlxc.cap.drop= \nlxc.cgroup.devices.allow=a\nlxc.mount.auto=proc:rw
    sys:rw"
  security.privileged: "true"
  security.nesting: "true"
description: Incus profile for Kubernetes
devices:
  eth0:
    name: eth0
    nictype: bridged
    parent: incusbr0
    type: nic
  kmsg:
    path: /dev/kmsg
    source: /dev/kmsg
    type: unix-char
  root:
    path: /
    pool: default
    type: disk
name: k8s
used_by: []
EOF
```

## Network
Add bridge
```
incus profile device add k8s eth0 nic nictype=bridged parent=lxdbr0

incus network list
```

## Basics
```
incus launch images:ubuntu/22.04 first --profile k8s

incus copy first second

incus list

incus stop first ; incus delete first

incus exec first -- bash

incus file pull first/root/k8s-setup.sh .
incus file push k8s-setup.sh first/root/k8s-setup.sh
```
