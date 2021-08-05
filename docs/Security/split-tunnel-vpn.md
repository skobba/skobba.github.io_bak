# Split Tunnel VPN

## Install openvpn
Ref.: https://openvpn.net/download-open-vpn/

```
apt update && apt -y install ca-certificates wget net-tools gnupg
wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
echo "deb http://as-repository.openvpn.net/as/debian buster main">/etc/apt/sources.list.d/openvpn-as-repo.list
apt update && apt -y install openvpn-as
```
Install path
> /usr/local/openvpn_as

Set password
> passwd openvpn

Login
> https://x.x.x.x:943/admin/



## Download Config
```
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
unzip ovpn.zip
cp ./ovpn_tcp/nl816.nordvpn.com.tcp.ovpn  /etc/openvpn/openvpn.conf
```

# Gnome Setup
apt-get install network-manager-openvpn-gnome
service network-manager restart
