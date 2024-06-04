# ingress-nginx
Ref.:
* [Docs - deploy](https://kubernetes.github.io/ingress-nginx/deploy/) 
## Generate TSL
https://kubernetes.github.io/ingress-nginx/examples/PREREQUISITES/#test-http-service

```sh
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=nginxsvc/O=nginxsvc"

kubectl create secret tls tls-secret --key tls.key --cert tls.crt
```

## Check version
```sh
# Run /nginx-ingress-controller --version within the pod, for instance with kubectl exec:

POD_NAMESPACE=ingress-nginx
POD_NAME=$(kubectl get pods -n $POD_NAMESPACE -l app.kubernetes.io/name=ingress-nginx --field-selector=status.phase=Running -o name)
kubectl exec $POD_NAME -n $POD_NAMESPACE -- /nginx-ingress-controller --version

```
