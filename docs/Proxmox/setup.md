# Setup

## Repositories
Remove enterprise repository
```
rm /etc/apt/sources.list.d/pve-enterprise.list
apt update && apt -y full-upgrade
```

Add no-subscription or pve-test repository 
```
vi /etc/apt/sources.list

deb http://download.proxmox.com/debian bullseye pve-no-subscription
apt update && apt -y full-upgrade
reboot
```

## Setup zsh and apt
Script that setup zsh, OhMyZsh, Powerlevel10k

```
apt update
apt -y install zsh git screen


chsh -s /bin/zsh
apt-get -y install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'>>~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc
exec zsh

cat <<EOF >> ~/.zshrc
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8
EOF


```
## Download lxc images
```
pushd /var/lib/vz/template/cache/
wget http://download.proxmox.com/images/system/ubuntu-20.04-standard_20.04-1_amd64.tar.gz
wget http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst
wget http://download.proxmox.com/images/system/debian-11-standard_11.7-1_amd64.tar.zst
popd
```

## Setup bridges

```sh
cat <<EOF >> /etc/network/interfaces
auto vmbr1
iface vmbr1 inet manual
        bridge-ports none
        bridge-stp off
        bridge-fd 0

auto clust1
iface clust1 inet manual
        bridge-ports none
        bridge-stp off
        bridge-fd 0

auto clust2
iface clust2 inet manual
        bridge-ports none
        bridge-stp off
        bridge-fd 0

auto clust3
iface clust3 inet manual
        bridge-ports none
        bridge-stp off
        bridge-fd 0
EOF

systemctl restart network.service
```

## Create first lxc
```sh
ID=900
GW=10.10.9.1
IP=10.10.9.107/24
pct create $ID /var/lib/vz/template/cache/debian-12-standard_12.2-1_amd64.tar.zst \
    -arch amd64 \
    -ostype ubuntu \
    -hostname debterm \
    -features keyctl=1,nesting=1 \
    -cores 1 \
    -memory 2048 \
    -swap 0 \
    -storage local-zfs \
    -password password \
    -unprivileged 1 \
    -net0 name=eth0,bridge=vmbr0,gw=$GW,ip=$IP,type=veth

pct start 900

```
