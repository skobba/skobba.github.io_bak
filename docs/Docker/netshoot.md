# netshoow
*a Docker + Kubernetes network trouble-shooting swiss-army container*

* [https://github.com/nicolaka/netshoot](https://github.com/nicolaka/netshoot)

# Docker
```
docker run -it --net container:<container_name> nicolaka/netshoot
```

# Kubernetes
Throw away container for debugging
```
kubectl run tmp-shell --rm -i --tty --image nicolaka/netshoot -- /bin/bash
```

On host network
```
kubectl run tmp-shell --rm -i --tty --overrides='{"spec": {"hostNetwork": true}}' --image nicolaka/netshoot -- /bin/bash
```
