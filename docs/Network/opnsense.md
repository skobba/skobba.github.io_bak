# OPNSense

## DNS
Ref.: [How to Configure DNS over TLS (DoT) Using Unbound DNS in OPNsense](https://homenetworkguy.com/how-to/configure-dns-over-tls-unbound-opnsense/)

## Setup Wireguard
Ref.: https://www.youtube.com/watch?v=b58PpuIsQ3A

Enable Wireguard plugin:
```
System -> Firmware -> Plugins 
```

### Local profile
Add:
* Name: wg1
* Listen port: 51820
* Tunnel address: 10.50.50.1/24
* Generate SSL

### Interfaces
* Add device wg1 to a new interface WG1.
* Enabel WG1 interface.

### Firewall rules
* WG1: Allow all in
* WAN: Allow in, proto: UDP, Destination port range: 51820, Destination: WAN Address


### Create Peer
* Name: mac1
* Allowed IPs: 10.50.50.15/32

### Client - generate pub/pri-keys
```
brew install wireguard-tools
```

Add tunnel
```sh
wg genkey | tee privatekey | wg pubkey > publickey
```

Create Configuration File
```
[Interface]
PrivateKey = <privatekey>
Address = 10.50.50.15/32
DNS = 1.1.1.1

[Peer]
PublicKey = <publickey>
Endpoint = 84.214.96.160:51820
AllowedIPs = 0.0.0.0/0
```

Start the Tunnel
```sh
sudo wg-quick up ./config-file.conf

Verify Connection
```sh
wg show
```
