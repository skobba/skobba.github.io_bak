# Kubernetes
*Created by Google*

Building blocks:
* Pod
* Service
* ConfigMap
* Secret
* Volume
* Ingress
* Deployment
* StatefulSet

Join a new node
```
kubeadm token create --print-join-command
```

Assign worker role to a node
```
kubectl label node kworker1 node-role.kubernetes.io/worker=worker
```

Access a cluster
> copy ~/.kube/config to your machine

List kube-system
```
kubectl get pods -n kube-system
```

Get log from pod
```
kubectl -n kube-system logs kube-proxy-xxxxx
```

##  Dashboard
Deploy
``` 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml
```

Enable access
```
kubectl proxy
```

URL
> [http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)
