# Kubernetes
Join a new node
```
kubeadm token create --print-join-command
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
