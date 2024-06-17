# Pod

## Create
```sh
kubectl run pod1 --image=httpd:2.4.41-alpine --dry-run=client -oyaml > pod1.yaml
kubectl create -f pod1.yaml
```
