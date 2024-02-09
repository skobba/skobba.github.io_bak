# Alpine

## Network
Interfaces
```
/etc/network/interfaces
```

Nameservers
```
cat <<EOF >> /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF
```

## Services
```
/etc/init.d/networking restart

or

service networking restart
```

## Shutdown
```
poweroff
```
