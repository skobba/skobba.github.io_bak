# Debian

## View Services
```
systemctl list-units -t service --state running
```

## Static IP
vi /etc/network/interfaces
```
auto enp5s0f0
iface enp5s0f0 inet static
    address 10.10.9.250/24
    gateway 10.10.9.1
```
