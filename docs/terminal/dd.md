# dd usb/sd operations

## Write iso image to sd card
1. List disk on mac
``` 
diskutil list
```

2. Unmount disk
```
diskutil unmountDisk /dev/diskX
```

3. Write image with dd
```
dd if=./proxmox-ve_7.0-2.iso of=/dev/diskX bs=1m
```
4. Add Progress Bar
```
status=progress
