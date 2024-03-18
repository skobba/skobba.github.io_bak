# LXD

## Getting started
###  Create profile
Profile:
```
config:
  limits.cpu: "2"
  limits.memory: 2GB
  limits.memory.swap: "false"
  linux.kernel_modules: ip_tables,ip6_tables,nf_nat,overlay,br_netfilter
  raw.lxc: "lxc.apparmor.profile=unconfined\nlxc.cap.drop= \nlxc.cgroup.devices.allow=a\nlxc.mount.auto=proc:rw
    sys:rw"
  security.privileged: "true"
  security.nesting: "true"
description: LXD profile for Kubernetes
devices:
  eth0:
    name: eth0
    nictype: bridged
    parent: lxdbr0
    type: nic
  kmsg:
    path: /dev/kmsg
    source: /dev/kmsg
    type: unix-char
  root:
    path: /
    pool: lxd
    type: disk
name: k8s
used_by: []
```

Create profile:
```
lxc profile create k8s
cat k8s-profile-config | lxc profile edit k8s
lxc profile list
```

### Init container
```
lxd init --minimal

lxc image list ubuntu:

lxc launch ubuntu:22.04 first
lxc launch ubuntu:22.04 second

```

## GUI
```
snap install --channel=stable lxd

snap set lxd ui.enable=true
lxc config set core.https_address :8443
systemctl reload snap.lxd.daemon


# Generate new


```
