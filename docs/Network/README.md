# Networking
## Ports
Identify open ports (netstat require net-tools, ss does not)
```
netstat -nplt

or

ss -nplt
```

## iptables
### Add rule
iptables -A INPUT -p tcp -s x.x.x.x --dport 22 -j ACCEPT

## ipcalc
* [http://jodies.de/ipcalc?host=10.10.0.0&mask1=16&mask2=255.255.150](http://jodies.de/ipcalc?host=10.10.0.0&mask1=16&mask2=255.255.150)
* ```apt -y install ipcalc```

## Disable IPv6 on Debian
> vi /etc/sysctl.conf
 
Add the following at the bottom of the file and reboot:
```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.tun0.disable_ipv6 = 1
```

## Static IP on Debian
> vi /etc/network/interfaces

```
    auto eth0
    iface eth0 inet static
        address 10.0.0.2/24
        gateway 10.0.0.1
```
