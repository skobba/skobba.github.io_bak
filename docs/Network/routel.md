# routel
Pretty output routing table like:
```
routel -L

Dst             Gateway         Prefsrc         Protocol Scope   Dev              Table
default         10.10.9.1                                        enp5s0f0
10.10.9.0/24                    10.10.9.250     kernel   link    enp5s0f0
192.168.1.0/24                  192.168.1.1     kernel   link    virbr1
192.168.2.0/24                  192.168.2.1     kernel   link    virbr2
192.168.122.0/24                 192.168.122.1   kernel   link    virbr0
10.10.9.250                     10.10.9.250     kernel   host    enp5s0f0         local
10.10.9.255                     10.10.9.250     kernel   link    enp5s0f0         local
127.0.0.0/8                     127.0.0.1       kernel   host    lo               local
127.0.0.1                       127.0.0.1       kernel   host    lo               local
127.255.255.255                 127.0.0.1       kernel   link    lo               local
192.168.1.1                     192.168.1.1     kernel   host    virbr1           local
192.168.1.255                   192.168.1.1     kernel   link    virbr1           local
192.168.2.1                     192.168.2.1     kernel   host    virbr2           local
192.168.2.255                   192.168.2.1     kernel   link    virbr2           local
192.168.122.1                   192.168.122.1   kernel   host    virbr0           local
192.168.122.255                 192.168.122.1   kernel   link    virbr0           local

```
