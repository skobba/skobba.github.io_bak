# QEMU

## List vms
```
qm list
qm list | awk '{print $1, $2}'
```

## List vms using watch
```
# Create a file
cat >./list_vms.sh<<EOF
#!/bin/bash
qm list | awk '{print $1, $2}'
EOF
chmod +x ./list_vms.sh

# Time
watch -n 1 ./list_vms.sh 2>/dev/null
# No time
watch --no-title -n 1 ./list_vms.sh
```

## Snapshot
```
# Snap
qm snapshot <vmid> <snap-name>
qm snapshot 401 ip -d "New iP: 10.10.9.41"

# Delete
qm delsnapshot <vmid> <snap-name>

# Rollback
qm snapshot <vmid> rollback <snapshot_name>
```

## iso from vm
```
qm extractcd [VMID] [DEVICE] [ISO_FILENAME].iso
```

## vm from iso
```
 qemu-img convert -O raw /var/lib/vz/images/[VMID]/[DISKID].qcow2 [ISO_FILENAME].iso
```

