# uri
```
qemu:///system
    For creating KVM and QEMU guests to be run by the system libvirtd instance.
    This is the default mode that virt-manager uses, and what most KVM users
    want.

qemu:///session
    For creating KVM and QEMU guests for libvirtd running as the regular user.
```

WARNING  Defaulting to --cloud-init root-password-generate=yes,disable=yes

Starting install...
Password for first root login is: nKDd9VF5G8ichBHQ
Installation will continue in 10 seconds (press Enter to skip)...


#--extra-args 'console=ttyS0,115200n8 serial' \
--initrd-inject my-seed.img \
--extra-args "ks=file:/my-seed.img"

# Debian netinstall
https://cdimage.debian.org/cdimage/release/current/amd64/iso-cd/debian-12.5.0-amd64-netinst.iso

# Not working for user
virsh net-list --all

ls -l /etc/libvirt/qemu/networks

# Working for both
virsh --connect qemu:///system net-list --all

echo $VIRSH_DEFAULT_CONNECT_URI
echo $LIBVIRT_DEFAULT_URI

# 
vi /etc/libvirt/libvirt.conf
Uncomment:
uri_default = "qemu:///system"


virsh net-edit default

systemctl restart libvirtd

virsh --connect qemu:///system list --all
virsh --connect qemu:///system destroy debian-vm

virsh list
myvm=deb3
virsh shutdown $myvm
virsh destroy $myvm ; virsh undefine $myvm
virsh help
virsh console deb3

# Add access for user
vi /etc/polkit-1/rules.d/50-libvirt.rules

/* Allow users in kvm group to manage the libvirt VMs */
polkit.addRule(function(action, subject) {
    if ((action.id == "org.libvirt.unix.manage" ||
         action.id == "org.libvirt.unix.monitor" ||
         action.id == "org.libvirt.unix.manage-hook") &&
        subject.isInGroup("kvm")) {
        return polkit.Result.YES;
    }
});