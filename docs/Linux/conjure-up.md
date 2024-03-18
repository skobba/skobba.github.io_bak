# conjure-up
Ref: https://ubuntu.com/blog/running-kmaster-inside-lxd
```

lxc launch ubuntu:22.04 kmaster -c security.privileged=true -c security.nesting=true -c linux.kernel_modules=ip_tables,ip6_tables,netlink_diag,nf_nat,overlay

Skipped: -c raw.lxc=lxc.aa_profile=unconfined

lxc config device add kmaster mem unix-char path=/dev/mem

lxc exec kmaster -- apt-add-repository ppa:conjure-up/next -y
lxc exec kmaster -- apt-add-repository ppa:juju/stable -y
lxc exec kmaster -- apt update
lxc exec kmaster -- apt dist-upgrade -y
lxc exec kmaster -- apt install conjure-up -y

# Install w/ snap
sudo snap install juju
sudo snap install conjure-up --classic

lxc exec kmaster -- sudo -u ubuntu -i conjure-up

sudo apt-add-repository ppa:conjure-up/next


lxc exec kmaster -- lxd init
* Use the “dir” storage backend (“zfs” doesn’t work in a nested container
* Do NOT configure IPv6 networking (conjure-up/juju don’t play well with it)

lxc exec kmaster -- sudo -u ubuntu -i conjure-up
* Select “Kubernetes Core”
* Then select “localhost” as the deployment target (uses LXD)
* And hit “Deploy all remaining applications”

```
