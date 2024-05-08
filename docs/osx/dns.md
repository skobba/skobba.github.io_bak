# DNS

## Network information
```sh
networksetup -listallnetworkservices

networksetup -getinfo Wi-Fi

networksetup -getinfo "iPhone USB"
```

## Check and set DNS
```sh
networksetup -getdnsservers Wi-Fi

networksetup -setdnsservers Wi-Fi 1.1.1.1 8.8.8.8

networksetup -setdnsservers "iPhone USB" 1.1.1.1 8.8.8.8
```
