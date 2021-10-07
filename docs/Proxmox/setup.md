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

