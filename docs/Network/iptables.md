# iptables
_iptables is a user-space utility that interacts with the Netfilter framework to configure packet filtering rules in the Linux kernel's networking stack._

Consists of:
* 5 tables
* chains
* rules

## Tables
### FILTER
Filter is default table for iptables with the built-in chains:
* INPUT chain – Incoming to firewall. For packets coming to the local server.
* OUTPUT chain – Outgoing from firewall. For packets generated locally and going out of the local server.
* FORWARD chain – Packet for another NIC on the local server. For packets routed through the local server.

### NAT
Iptable’s NAT table has the following built-in chains:
* PREROUTING chain – Alters packets before routing. i.e Packet translation happens immediately after the packet comes to the system (and before routing). This helps to translate the destination ip address of the packets to something that matches the routing on the local server. This is used for DNAT (destination NAT).
* POSTROUTING chain – Alters packets after routing. i.e Packet translation happens when the packets are leaving the system. This helps to translate the source ip address of the packets to something that might match the routing on the desintation server. This is used for SNAT (source NAT).
* OUTPUT chain – NAT for locally generated packets on the firewall.

### MANGLE
Iptables’s Mangle table is for specialized packet alteration. This alters QOS bits in the TCP header. Mangle table has the following built-in chains:
* PREROUTING chain
* OUTPUT chain
* FORWARD chain
* INPUT chain
* POSTROUTING chain

### RAW
Iptable’s Raw table is for configuration excemptions. Raw table has the following built-in chains.
* PREROUTING chain
* OUTPUT chain

### SECURITY

## Chains
* REP ROUTING
* INPUT
* FORWARD
* OUTPUT
* POST ROUTING

## Div
Clear all IPv4 based firewall rules:
```sh
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
```

Accept traffic from an ethernet port to a virtual bridge (virbr2)
```sh
iptables -A FORWARD -s 10.10.2.0/24 -d 192.168.1.0/16 -i enp5s0f0 -o virbr2 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 192.168.0.0/16 -d 10.10.2.0/24 -i virbr2 -o enp5s0f0 -j ACCEPT
iptables --flush
```
