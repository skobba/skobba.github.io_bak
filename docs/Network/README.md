# Networking

## iptables
### Add rule
iptables -A INPUT -p tcp -s x.x.x.x --dport 22 -j ACCEPT
