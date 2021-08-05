# Split Tunnel VPN

## Install OpenVPN Community Edition
Ref.: https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-debian-10
```
apt update
apt install openvpn
```

## Create vpn User
```
adduser --disabled-login vpn
```

## Create VPN Config
Download from NordVPN:
```
apt -y install unzip
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
unzip ovpn.zip
cp ./ovpn_tcp/nl816.nordvpn.com.tcp.ovpn  /etc/openvpn/openvpn.conf
```

Add to /etc/openvpn/openvpn.conf:
```
auth-nocache
disable-occ
script-security 2
route-noexec
```

Create /etc/openvpn/login.txt:
```
yourusername
yourpassword
```

Change login cred:
> sed -i -e 's/auth-user-pass/auth-user-pass \/etc\/openvpn\/login.txt/g' /etc/openvpn/openvpn.conf

## Create systemd Service for OpenVPN
vi /etc/systemd/system/openvpn@openvpn.service

```
[Unit]
# HTPC Guides - www.htpcguides.com
Description=OpenVPN connection to %i
Documentation=man:openvpn(8)
Documentation=https://community.openvpn.net/openvpn/wiki/Openvpn23ManPage
Documentation=https://community.openvpn.net/openvpn/wiki/HOWTO
After=network.target

[Service]
RuntimeDirectory=openvpn
PrivateTmp=true
KillMode=mixed
Type=forking
ExecStart=/usr/sbin/openvpn --daemon ovpn-%i --status /run/openvpn/%i.status 10 --cd /etc/openvpn --script-security 2 --config /etc/openvpn/%i.conf --writepid /run/openvpn/%i.pid
PIDFile=/run/openvpn/%i.pid
ExecReload=/bin/kill -HUP $MAINPID
WorkingDirectory=/etc/openvpn
Restart=on-failure
RestartSec=3
ProtectSystem=yes
LimitNPROC=10
DeviceAllow=/dev/null rw
DeviceAllow=/dev/net/tun rw

[Install]
WantedBy=multi-user.target
```
Create service:
> systemctl enable openvpn@openvpn.service

## Create iptables
vi /etc/openvpn/iptables.sh

```
#! /bin/bash
# Niftiest Software – www.niftiestsoftware.com
# Modified version by HTPC Guides – www.htpcguides.com

export INTERFACE="tun0"
export VPNUSER="vpn"
export LOCALIP="10.10.2.120"
export NETIF="eth0"

# flushes all the iptables rules, if you have other rules to use then add them into the script
iptables -F -t nat
iptables -F -t mangle
iptables -F -t filter

# mark packets from $VPNUSER
iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
iptables -t mangle -A OUTPUT ! --dest $LOCALIP -m owner --uid-owner $VPNUSER -j MARK --set-mark 0x1
iptables -t mangle -A OUTPUT --dest $LOCALIP -p udp --dport 53 -m owner --uid-owner $VPNUSER -j MARK --set-mark 0x1
iptables -t mangle -A OUTPUT --dest $LOCALIP -p tcp --dport 53 -m owner --uid-owner $VPNUSER -j MARK --set-mark 0x1
iptables -t mangle -A OUTPUT ! --src $LOCALIP -j MARK --set-mark 0x1
iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

# allow responses
iptables -A INPUT -i $INTERFACE -m conntrack --ctstate ESTABLISHED -j ACCEPT

# block everything incoming on $INTERFACE to prevent accidental exposing of ports
iptables -A INPUT -i $INTERFACE -j REJECT

# let $VPNUSER access lo and $INTERFACE
iptables -A OUTPUT -o lo -m owner --uid-owner $VPNUSER -j ACCEPT
iptables -A OUTPUT -o $INTERFACE -m owner --uid-owner $VPNUSER -j ACCEPT

# all packets on $INTERFACE needs to be masqueraded
iptables -t nat -A POSTROUTING -o $INTERFACE -j MASQUERADE

# reject connections from predator IP going over $NETIF
iptables -A OUTPUT ! --src $LOCALIP -o $NETIF -j REJECT

# Start routing script
/etc/openvpn/routing.sh

exit 0
```
Make executable
chmod +x /etc/openvpn/iptables.sh


## Create Resolv
vi /etc/openvpn/update-resolv-conf
foreign_option_1='dhcp-option DNS 209.222.18.222'
foreign_option_2='dhcp-option DNS 209.222.18.218'
foreign_option_3='dhcp-option DNS 8.8.8.8'

up and down scripts to be executed when VPN starts or stops:
```
up /etc/openvpn/iptables.sh
down /etc/openvpn/update-resolv-conf
```

sudo iptables -A OUTPUT ! -o lo -m owner --uid-owner vpn -j DROP
