# Incus
_Incus is a modern, secure and powerful system container and virtual machine manager._

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
