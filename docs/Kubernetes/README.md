# Kubernetes

## Running Kubernetes on Linux Containers (LXC)
Ref: https://github.com/MarijnKoesen/kubernetes-in-proxmox-with-kubeadm-lxc-and-wireshark/blob/master/README.md

Prepare the proxmox host

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
