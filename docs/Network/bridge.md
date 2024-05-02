# Bridge

## Debian
```sh
apt-get -y install bridge-utils

ip link set eth0 down
ip link set eth0 master br0
ip link set br0 up

ip link add br0 type bridge

# Use ethernet port eno1s1 as a member of the bridge br0.
ip link set eth0 master br0

# Configure the Bridge Interface
ip addr add 10.10.1.0/24 dev br0

# Bring up the bridge interface:
ip link set dev br0 up

# Verify the configuration:
brctl show br0
```

## Config
```
auto br0
iface br0 inet dhcp
bridge_ports eth0
```

