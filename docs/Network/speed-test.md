# Speed Testing

## iperf3
```sh
# Server
iperf3 -s -p 5201

# Client
iperf3 -i 10 -t 60 -c 10.10.1.10
```
