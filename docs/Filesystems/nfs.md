# nfs

## Server
Install server that allows you to share directories
```
apt -y install nfs-kernel-server
```

Create folder
```
mkdir /mnt/kubedata
chown nobody:nogroup kubedata
``` 

Configuring the NFS Exports
```
vi /etc/exports

format:
directory_to_share    client_ip(share_option1,...,share_optionN)
directory_to_share    *(share_option1,...,share_optionN)

/mnt/kubedata       *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
```
Options
* ___rw___: This option gives the client computer both read and write access to the volume.
* ___sync___: This option forces NFS to write changes to disk before replying. This results in a more stable and consistent environment since the reply reflects the actual state of the remote volume. However, it also reduces the speed of file operations.
* ___no_subtree_check___: This option prevents subtree checking, which is a process where the host must check whether the file is actually still available in the exported tree for every request. This can cause many problems when a file is renamed while the client has it opened. In almost all cases, it is better to disable subtree checking.
* ___no_root_squash___: By default, NFS translates requests from a root user remotely into a non-privileged user on the server. This was intended as security feature to prevent a root account on the client from using the file system of the host as root. no_root_squash disables this behavior for certain shares.


with sed
```
echo "/mnt/kubedata       *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)" >> /etc/exports
```

Restart and enable server
```
systemctl restart nfs-kernel-server
systemctl enable nfs-kernel-server
```

## Client
```
apt -y install nfs-common
```

Create directory for the mount
```
mkdir -p /nfs/kubedata
```

Mount nfs share
```
mount host_ip:/mnt/kubedata /nfs/kubedata
```

