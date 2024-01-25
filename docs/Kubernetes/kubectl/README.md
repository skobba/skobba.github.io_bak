# kubectl

## Autocomplete in zsh
```
source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc # add autocomplete permanently to your zsh shell
```

## Cheat sheet
Ref.: [https://kubernetes.io/docs/reference/kubectl/cheatsheet/](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

## 
Node IP address for Minikube using following command
```
kubectl cluster-info
```

## Patch
```
kubectl patch svc php-apache -p '{"spec":{"externalIPs":["127.0.0.1"]}}'
kubectl patch svc php-apache -p '{"spec":{"externalIPs":["10.153.134.11"]}}'
```

## Resources
```
clusterrole
clusterrolebinding
configmap
cronjob
deployment
ingress
job
namespace
poddisruptionbudget
priorityclass
quota
role
rolebinding
secret
secret docker-registry
secret generic
secret tls
service
service clusterip
service externalname
service loadbalancer
service nodeport
serviceaccount
```
