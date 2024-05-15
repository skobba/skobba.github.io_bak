# Routing
Ref.: https://jamielinux.com/docs/libvirt-networking-handbook/custom-routed-network.html

* The server has an Ethernet device called enp5s0f0.
* VMs bind to a virtual bridge called virbr10.
* The hosting provider has allocated two address blocks (see CIDR notation):
** one public IPv4 address block (192.168.10.0/24)
* The server binds statically to 10.10.1.250


## Configure static routes on router

Make LAN router aware that packets destined for the subnets above need to be routed to the libvirt server. Packets will only reach VMs if you configure static routes on the LAN router:

```sh
ip -4 route add 192.168.10.0/24 via 10.10.1.250
```

## Create a dummy interface
A bridge inherits the MAC address of the first interface that is attached, so it will keep changing unless the same VM is always powered on first. To keep the MAC address constant, create a dummy network interface with a chosen MAC address and attach it to the bridge before anything else.

Choose a MAC address for the virtual bridge. Use hexdump to generate a random MAC address in the format that libvirt expects (52:54:00:xx:xx:xx for KVM, 00:16:3e:xx:xx:xx for Xen).
```sh
hexdump -vn3 -e '/3 "52:54:00"' -e '/1 ":%02x"' -e '"\n"' /dev/urandom
```

Create a dummy network interface called virbr10-dummy and set the MAC address to the one generated above.
```sh
ip link add virbr10-dummy address 52:54:00:81:a2:1b type dummy
```

To create a persistent dummy interface at every boot:
```sh
vi /etc/network/interfaces

Add:
auto virbr10-dummy
iface virbr10-dummy inet manual
    pre-up /sbin/ip link add virbr10-dummy type dummy
    up /sbin/ip link set virbr10-dummy address 52:54:00:81:a2:1b
```

## Create a virtual bridge
```sh
brctl addbr virbr10
brctl stp virbr10 on
brctl addif virbr10 virbr10-dummy
ip address add 192.168.10.0/24 dev virbr10 broadcast 192.168.10.255
```

Persistent:
```sh
vi /etc/network/interfaces

Add:
auto virbr10
iface virbr10 inet static
    # Make sure bridge-utils is installed!
    bridge_ports virbr10-dummy
    bridge_stp on
    bridge_fd 2
    address 192.168.10.0
    netmask 255.255.255.0
```

## Start
```sh
ifup virbr10-dummy
ifup virbr10
```

## Configure the firewall
Modify some kernel parameters to allow forwarding to the virtual bridge:
```sh
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "net.ipv4.conf.all.forwarding=1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding=1" >> /etc/sysctl.conf
sysctl -p
```

Allow IPv4 forwarding for iptables:
```sh
# This format is understood by iptables-restore. See `man iptables-restore`.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

... snipped ...
# Allow inbound traffic to the private subnet.
-A FORWARD -d 192.168.10.0/24 -o virbr10 -j ACCEPT
# Allow outbound traffic from the private subnet.
-A FORWARD -s 192.168.10.0/24 -i virbr10 -j ACCEPT
# Allow traffic between virtual machines.
-A FORWARD -i virbr10 -o virbr10 -j ACCEPT
# Reject everything else.
-A FORWARD -i virbr10 -j REJECT --reject-with icmp-port-unreachable
-A FORWARD -o virbr10 -j REJECT --reject-with icmp-port-unreachable
... snipped ...
COMMIT
```

## Run dnsmasq
DHCP server and a DNS server.

```sh
mkdir -p /var/lib/dnsmasq/virbr10
touch /var/lib/dnsmasq/virbr10/hostsfile
touch /var/lib/dnsmasq/virbr10/leases

cat << EOF > /var/lib/dnsmasq/virbr10/dnsmasq.conf
# Only bind to the virtual bridge. This avoids conflicts with other running
# dnsmasq instances.
except-interface=lo
bind-dynamic
interface=virbr10

# If using dnsmasq 2.62 or older, remove "bind-dynamic" and "interface" lines
# and uncomment these lines instead:
#bind-interfaces
#listen-address=203.0.113.88
#listen-address=2001:db8:aa::1

# IPv4 addresses to offer to VMs. This should match the chosen subnet.
dhcp-range=192.168.10.200,192.168.10.250

# Set this to at least the total number of addresses in DHCP-enabled subnets.
dhcp-lease-max=1000

# Assign IPv6 addresses via stateless address autoconfiguration (SLAAC).
#dhcp-range=2001:db8:aa::,ra-only

# Assign IPv6 addresses via DHCPv6 instead (requires dnsmasq 2.64 or later).
# Remember to allow all incoming UDP port 546 traffic on the VM.
#dhcp-range=2001:db8:aa::1000,2001:db8:aa::1fff
#enable-ra
#dhcp-lease-max=5000

# File to write DHCP lease information to.
dhcp-leasefile=/var/lib/dnsmasq/virbr10/leases
# File to read DHCP host information from.
dhcp-hostsfile=/var/lib/dnsmasq/virbr10/hostsfile
# Avoid problems with old or broken clients.
dhcp-no-override
# https://www.redhat.com/archives/libvir-list/2010-March/msg00038.html
strict-order
EOF


service dnsmasq restart
```


