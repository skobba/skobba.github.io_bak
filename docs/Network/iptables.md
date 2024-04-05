# iptables

## Clear all IPv4 based firewall rules
```
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
```

## Accept traffic from an ethernet port to a virtual bridge (virbr2)
```
iptables -A FORWARD -s 10.10.2.0/24 -d 192.168.1.0/16 -i enp5s0f0 -o virbr2 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 192.168.0.0/16 -d 10.10.2.0/24 -i virbr2 -o enp5s0f0 -j ACCEPT
iptables --flush
```
