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

Ensure overlay module is loaded
```
lsmod | grep overlay
```

enable the kernel module with
```
modprobe overlay
```
or add overlay to systemd :
```
echo "overlay" > /etc/modules-load.d/overlay.conf
```
or add to startup
```
echo overlay >> /etc/modules
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

Mount it inside of the container:
```
pct set 210 -mp0 /dev/zvol/mypool/my-dockervol,mp=/var/lib/docker,backup=0
pct set 210 -mp1 /dev/zvol/mypool/my-kubeletvol,mp=/var/lib/kubelet,backup=0
```

To make sure we start the vpn on boot, and to fix some other small issues create the following rc.local file:

```
cat > /etc/rc.local
#!/bin/sh -e

# Kubeadm 1.15 needs /dev/kmsg to be there, but it's not in lxc, but we can just use /dev/console instead
# see: https://github.com/kubernetes-sigs/kind/issues/662
if [ ! -e /dev/kmsg ]; then
    ln -s /dev/console /dev/kmsg
fi

# https://medium.com/@kvaps/run-kubernetes-in-lxc-container-f04aa94b6c9c
mount --make-rshared /' > /etc/rc.local

exit 0
```

Install kubernetes:

```
apt-get update --allow-releaseinfo-change
apt-get install -y apt-transport-https curl

apt-get install -y gnupg

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
```

Install docker
```
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

docker run hello-world
```
 
Pull images
```
kubeadm config images pull
...
[config/images] Pulled k8s.gcr.io/kube-apiserver:v1.22.2
[config/images] Pulled k8s.gcr.io/kube-controller-manager:v1.22.2
[config/images] Pulled k8s.gcr.io/kube-scheduler:v1.22.2
[config/images] Pulled k8s.gcr.io/kube-proxy:v1.22.2
[config/images] Pulled k8s.gcr.io/pause:3.5
[config/images] Pulled k8s.gcr.io/etcd:3.5.0-0
[config/images] Pulled k8s.gcr.io/coredns/coredns:v1.8.4
```

Create cluster

```
--service-cidr string     Default: "10.96.0.0/12"

kubeadm init --pod-network-cidr=10.250.0.0/16 --apiserver-advertise-address 10.10.2.210 --ignore-preflight-errors=all
```

Need overlay driver for docker...
Ref:
* https://docs.docker.com/storage/storagedriver/overlayfs-driver/#prerequisites
* https://stackoverflow.com/questions/54128045/errors-while-creating-master-in-cluster-of-kubernetes-in-lxc-container
* https://www.youtube.com/watch?v=nfPf0pJ1YLI&ab_channel=JustmeandOpensource


LXC Config for k8s;
https://github.com/debiasej/k8s-lxc/blob/master/lxd-provisioning/profile-config

lxc launch images:ubuntu/16.04 CONTAINER_NAME --profile PROFILE_NAME


LXC Profile
```
config:
  limits.cpu: "2"
  limits.memory: 2GB
  limits.memory.swap: "false"
  linux.kernel_modules: ip_tables,ip6_tables,netlink_diag,nf_nat,overlay,br_netfilter
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
  root:
    path: /
    pool: default
    type: disk
name: k8s
used_by: []
```
