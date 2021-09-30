# Kubernetes

## Running Kubernetes on Linux Containers (LXC)
Ref: https://github.com/MarijnKoesen/kubernetes-in-proxmox-with-kubeadm-lxc-and-wireshark/blob/master/README.md

### Step 1: Prepare the proxmox host

```
# <- execute inside the (proxmox) host
$ <- execite inside the container
```

Ensure the following modules are loaded:

```
cat /proc/sys/net/bridge/bridge-nf-call-iptables
```
or
```
grep 'BRIDGE_NETFILTER' /boot/config-$(uname -r)
CONFIG_BRIDGE_NETFILTER=y
```

Now make sure swapiness is on 0, so that swap will not be used, otherwise kubernetes will not start:

```
cat /proc/sys/vm/swappiness
[should be 0]
```

Define the new one

```
sysctl vm.swappiness=0
```

Disable SWAP, it'll take some times to clean the SWAP area
```
swapoff -a
```

Now wait for swap to be empty.

### Step 2: Creating the kubernetes container

1) Create a new container in proxmox, making sure to give it 0 swap, and make it a privileged container
2) Edit the config file `/etc/pve/lxc/$ID.conf` and add the following part:

```
lxc.apparmor.profile: unconfined
lxc.cgroup.devices.allow: a
lxc.cap.drop:
lxc.mount.auto: "proc:rw sys:rw"
```

If you are using zfs on proxmos, make sure to create a ext4 volume, as zfs is not supported with kubeadm
See: https://github.com/corneliusweig/kubernetes-lxd

List zpools with ```zpool list```.

Create zfs volumes:
```
zfs create -V 50G mypool/my-dockervol
zfs create -V 5G mypool/my-kubeletvol
mkfs.ext4 /dev/zvol/mypool/my-dockervol
mkfs.ext4 /dev/zvol/mypool/my-kubeletvol
```

