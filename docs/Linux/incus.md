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

cat <<EOF | incus admin init --preseed
config:
  core.https_address: 192.0.2.1:9999
  images.auto_update_interval: 15
networks:
- name: incusbr0
  type: bridge
  config:
    ipv4.address: auto
    ipv6.address: none
EOF

```

## Basics
```
incus launch images:ubuntu/22.04 first

incus copy first second

incus list

incus exec first -- bash

incus file pull first/etc/hosts .
incus file push hosts first/etc/hosts
```
