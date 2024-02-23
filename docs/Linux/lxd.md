# LXD

## Getting started
```
lxd init --minimal

lxc image list ubuntu:

lxc launch ubuntu:22.04 first
lxc launch ubuntu:22.04 second

```

## GUI
```
snap install --channel=stable lxd

snap set lxd ui.enable=true
lxc config set core.https_address :8443
systemctl reload snap.lxd.daemon


# Generate new


```
