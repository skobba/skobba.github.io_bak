# Debian

## View Services
```
systemctl list-units -t service --state running
```

## Static IP
vi /etc/network/interfaces
```
    auto eth0
    iface eth0 inet static
        address 10.0.0.2/24
        gateway 10.0.0.1
```
