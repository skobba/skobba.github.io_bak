# ssh
Enable root login via ssh on Debian:
```
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

/etc/init.d/ssh restart
```
