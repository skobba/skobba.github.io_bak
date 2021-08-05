# Networking

## iptables
### Add rule
iptables -A INPUT -p tcp -s x.x.x.x --dport 22 -j ACCEPT

## Disable IPv6 on Debian
> vi /etc/sysctl.conf
 
Add the following at the bottom of the file and reboot:
```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.tun0.disable_ipv6 = 1
```
