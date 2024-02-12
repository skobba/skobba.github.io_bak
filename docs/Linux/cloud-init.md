# cloud-init (Alpine)
Ref.: [https://git.alpinelinux.org/aports/tree/community/cloud-init/README.Alpine](https://git.alpinelinux.org/aports/tree/community/cloud-init/README.Alpine)

__Enable and start__
```
rc-update add cloud-init default
rc-service cloud-init start
```

__Config__
```
cat <<EOF >> /etc/cloud/cloud.cfg
# Set the datasource to be auto-discovered
datasource_list: [ None ]

# Specify users and groups to create
system_info:
  default_user:
    name: myuser
    lock_passwd: true
    gecos: My User
    groups: [wheel]
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]

network:
  version: 2
  ethernets:
    eth0:
      addresses: [10.10.9.84/24]
      gateway4: 10.10.9.1
      nameservers:
        addresses: [1.1.1.1, 8.8.8.8]

# Set the hostname
hostname: myhostname

# Disable managing resolv.conf
manage_resolv_conf: false

# Disable setting hostname during boot
set_hostname: false
EOF
```

