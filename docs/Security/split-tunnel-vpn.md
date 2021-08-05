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

