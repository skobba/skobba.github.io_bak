# mtr
## Basic
```
mtr 10.10.9.167

Result:
                                    My traceroute  [v0.95]
kc2n1 (192.168.2.11) -> 10.10.9.167 (10.10.9.167)                    2024-04-11T13:21:40+0000
Keys:  Help   Display mode   Restart statistics   Order of fields   quit
                                                     Packets               Pings
 Host                                              Loss%   Snt   Last   Avg  Best  Wrst StDev
 1. 192.168.2.1                                     0.0%     7    0.2   0.2   0.2   0.3   0.0
 2. raspberrypi                                     0.0%     7    0.5   0.5   0.5   0.6   0.0
```

## Report
```sh
# On the host 192.168.2.11
mtr --report 10.10.9.167

# Result
Start: 2024-04-11T13:19:01+0000
HOST: kc2n1                       Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 192.168.2.1                0.0%    10    0.3   0.3   0.3   0.3   0.0
  2.|-- raspberrypi                0.0%    10    0.4   0.5   0.4   0.6   0.1

```
