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

### Create zfs pool and lxd storage configuration
Ref: https://documentation.ubuntu.com/lxd/en/stable-4.0/storage/#zfs
```
sudo zpool create lxd-pool mirror /dev/sdc /dev/sdb -f
lxc storage create lxd-pool zfs source=lxd-pool
lxc storage show lxd
```

### Create lxd container from profile
```
lxc launch ubuntu:22.04 kmaster --profile k8s
```

### Using container
```
cat bootstrap-kube.sh | lxc exec kmaster bash
```

## k8s init
```
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -qq -y net-tools curl ssh software-properties-common

apt-get install -qq -y apt-transport-https ca-certificates curl gnupg lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -qq -y containerd.io
containerd config default > /etc/containerd/config.toml
sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
systemctl restart containerd
systemctl enable containerd

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' > /etc/apt/sources.list.d/kubernetes.list

apt-get update -qq
apt-get install -qq -y kubeadm kubelet kubectl
echo 'KUBELET_EXTRA_ARGS="--fail-swap-on=false"' > /etc/default/kubelet
systemctl restart kubelet

sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo -e "kubeadmin\nkubeadmin" | passwd root
echo "export TERM=xterm" >> /etc/bash.bashrc
```

Only on master
```
kubeadm config images pull

kubeadm init --pod-network-cidr=192.168.0.0/16 --ignore-preflight-errors=all

mkdir /root/.kube
cp /etc/kubernetes/admin.conf /root/.kube/config

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/tigera-operator.yaml
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/custom-resources.yaml

kubeadm token create --print-join-command

echo "$joinCommand --ignore-preflight-errors=all" > /joincluster.sh

# If failed, try again with:
sudo kubeadm reset
```

## Init container
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
