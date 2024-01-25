# Busybox
_The platform has no-MMU, no shared libraries and FLAT executables_

__With kubectl for generating load:__
```
kubectl run -i --tty load-generator2 --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.02; do wget -q -O- http://php-apache; done"
```
