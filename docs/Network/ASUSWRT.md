# ASUSWRT-MERLIN
Ref.: https://www.asuswrt-merlin.net

## Install Wireguard

### Kernel (Choose your router version)

__(RT-AC86U, GT-AC2900)__

```sh
wget https://github.com/odkrys/entware-makefile-for-merlin/raw/main/wireguard-kernel_1.0.20210219-k27_1_aarch64-3.10.ipk
opkg install wireguard-kernel_1.0.20210219-k27_1_aarch64-3.10.ipk
```

__(RT-AX88U, GT-AX11000)__
```sh
wget https://github.com/odkrys/entware-makefile-for-merlin/raw/main/wireguard-kernel_1.0.20210219-k51_1_aarch64-3.10.ipk
opkg install wireguard-kernel_1.0.20210219-k51_1_aarch64-3.10.ipk
```

__(RT-AX68U, RT-AX86U)__

```sh
wget https://github.com/odkrys/entware-makefile-for-merlin/raw/main/wireguard-kernel_1.0.20210219-k52_1_aarch64-3.10.ipk
opkg install wireguard-kernel_1.0.20210219-k52_1_aarch64-3.10.ipk
```

### Install Wireguard Tools (For all version)
```sh
wget https://github.com/odkrys/entware-makefile-for-merlin/raw/main/wireguard-tools_1.0.20210315-1_aarch64-3.10.ipk
opkg install wireguard-tools_1.0.20210315-1_aarch64-3.10.ipk
cp /opt/etc/wireguard/S50wireguard /opt/etc/init.d
```
