# NFS
Ref: https://reintech.io/blog/setting-up-nfs-server-on-debian-12

## Setup
```sh
# Install
apt update
apt-get -y install nfs-kernel-server

# Create share
mkdir -p /var/nfs
chown nobody:nogroup /var/nfs

# Allow clients
vi /etc/exports

Add:
/var/nfs 192.168.1.100(rw,sync,no_subtree_check)

# Configuring the Firewall
ufw allow from 192.168.1.100 to any port nfs
ufw enable
ufw status


# Setup client
apt install nfs-common
mkdir -p /mnt/nfs_var
mount 192.168.1.100:/var/nfs /mnt/nfs_var

# Ensure the NFS share is mounted at boot
vi /etc/fstab file on the client:

Add:
192.168.1.100:/var/nfs /mnt/nfs_var nfs defaults 0 0
```
