# Incus
_Incus is a modern, secure and powerful system container and virtual machine manager._

## Basics
```
incus launch images:ubuntu/22.04 first

incus copy first second

incus list

incus exec first -- bash

incus file pull first/etc/hosts .
incus file push hosts first/etc/hosts
```
