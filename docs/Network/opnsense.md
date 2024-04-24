# OPNSense

## DNS
Ref.: 
* [How to Configure DNS over TLS (DoT) Using Unbound DNS in OPNsense](https://homenetworkguy.com/how-to/configure-dns-over-tls-unbound-opnsense/)
* [HAProxy + Let's Encrypt Wildcard Certificates](https://forum.opnsense.org/index.php?topic=23339.0)

## Setup Wireguard
Ref.: https://www.youtube.com/watch?v=b58PpuIsQ3A

Enable Wireguard plugin:
```
System -> Firmware -> Plugins 
```

### Add Instance
Add:
* Name: wg1
* Listen port: 51820
* Tunnel address: 10.15.2.0/24
* Generate server SSL
![wireguard-instances](wireguard-instances.png)

### Add Interface
* Add device wg1 to a new interface WG1.
* NB: Enabel WG1 interface!!

### Install wireguard-tools
```
brew install wireguard-tools
```

### Generate client-keys
```sh
wg genkey | tee clientprivatekey | wg pubkey > clientpublickey
```

### Create Peer
* Name: mac1
* Allowed IPs: 10.15.2.10/32
* Public key: <client public key>
![wireguard-peers](wireguard-peers.png)

### Create Configuration File
```
[Interface]
PrivateKey = <client private key>
Address = 10.15.2.10/32
DNS = 10.10.1.1

[Peer]
PublicKey = <server public key>
Endpoint = 84.214.96.160:51820
AllowedIPs = 0.0.0.0/0
```

### Firewall rules
* WG1: Allow all in
* WAN: Allow in, proto: UDP, Destination port range: 51820, Destination: WAN Address
![wireguard-fw-rules](wireguard-fw-rules.png)

### Start/stop the Tunnel
```sh
sudo wg-quick up ./config-file.conf
sudo wg-quick down ./config-file.conf
```

### Verify Connection
```sh
wg show
```
![opnsense-wireguard-dash](opnsense-wireguard-dash.png)

### scriptmanager
```sh
brew install danielfiller30/tap/scriptmanager
```

### Apple script for easy access (not working)
1. Create an Automator Application:

Open Automator
Choose "Application" as the document type.
Search for "Run Shell Script" in the Library pane and drag it to the workflow area.
Paste your bash script into the Run Shell Script action.

2. Save the Automator Application:

Save the Automator application with a descriptive name like "VPN Starter".

3. Create an AppleScript to Trigger the Automator Application:

Open AppleScript Editor (you can find it in the Applications folder or by searching with Spotlight).
Write an AppleScript to trigger your Automator application. It should be something like:
```
tell application "System Events"
    tell application process "VPN Starter" -- Replace "VPN Starter" with the name of your Automator application
        click menu bar item 1 of menu bar 1
        click menu item "Start VPN" of menu 1 of menu bar item 1 of menu bar 1 -- Change "Start VPN" to the name of your menu item if it's different
    end tell
end tell
```
