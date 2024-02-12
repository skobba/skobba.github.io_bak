# QEMU

## iso from vm
```
qm extractcd [VMID] [DEVICE] [ISO_FILENAME].iso
```

## vm from iso
```
 qemu-img convert -O raw /var/lib/vz/images/[VMID]/[DISKID].qcow2 [ISO_FILENAME].iso
```

