# cloud-init
The cloud-utils package is required for us to be able to run the cloud-localds command, which allows us to create the cloud init ISO image later. It also allows us to validate our cloud-init configuration. The whois allows us to be able to run mkpasswd command later if we want to use it to generate the hashed version of our password for the cloud-init configuration. This was the command for Debian 10. Your distro may have a different name for the required packages.

## virt-customize
Edit images. Ref: https://wiki.debian.org/ThomasChung/CloudImage

## Debian qcow2
Lookup correct image for kvm: https://wiki.debian.org/Cloud/SystemsComparison

```
Image for kvm specific:
debian-<release version>-genericcloud-<architecture>.[iso|qcow2|raw|tar.xz]


wget https://cloud.debian.org/images/cloud/bookworm/20240211-1654/debian-12-genericcloud-amd64-20240211-1654.qcow2

Two other cloud images:
https://cloud.debian.org/images/cloud/bookworm/20240211-1654/debian-12-generic-amd64-20240211-1654.qcow2
https://cloud.debian.org/images/cloud/bookworm/20240211-1654/debian-12-nocloud-amd64-20240211-1654.qcow2
```

## KVM
```
virt-install --name debian-vm \
    --memory 2048 \
    --vcpus 2 \
    --disk path=debian-12-genericcloud-amd64-20240211-1654.qcow2,format=qcow2 \
    --os-variant debian11 \
    --graphics none \
    --network bridge=br0 \
    --import

virt-install \
--name deb1 \
--ram 2048 \
--vcpus 2 \
--disk path=debian-12-genericcloud-amd64-20240211-1654.qcow2,format=qcow2 \
--import \
--os-variant debian11 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--cloud-init

virt-install \
--name deb1 \
--ram 2048 \
--vcpus 2 \
--disk path=debian-12-genericcloud-amd64-20240211-1654.qcow2,format=qcow2 \
--import \
--os-variant debian11 \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--cloud-init user-data=cloud-config

myvm=deb1
virsh shutdown $myvm
virsh destroy $myvm ; virsh undefine $myvm
```

## Install
```
apt update && apt install cloud-utils whois -y
```

## Create
```
cat > my-cloud-init <<EOF
password: passw0rd
chpasswd: { expire: False }
ssh_pwauth: True
EOF

cloud-localds my-seed.img my-cloud-init

```
















## Validate
```
cloud-init schema --config-file cloud-init.cfg
```


## Deprecated
```
virt-customize -a debian-12-genericcloud-amd64-20240211-1654.qcow2 \
    --root-password password:passw0rd \
    --uninstall cloud-init
```