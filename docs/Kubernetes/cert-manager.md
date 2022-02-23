# cert-manager
Docs: [https://cert-manager.io/docs/](https://cert-manager.io/docs/)

## Securing nginx-ingress
* [https://cert-manager.io/docs/tutorials/acme/nginx-ingress/](https://cert-manager.io/docs/tutorials/acme/nginx-ingress/)

## Install

Install CRD
```
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.7.1/cert-manager.crds.yaml
```

To install the chart with the release name my-cert-manager
```
# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Install the cert-manager helm chart and create namespace
helm install my-cert-manager --namespace cert-manager --create-namespace --version v1.7.1 jetstack/cert-manager
```

## Install with manifest
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml
``` 

## Create Cluster Issuer (ACME)
Ref.: [https://cert-manager.io/docs/configuration/acme/](https://cert-manager.io/docs/configuration/acme/)

Create a basic ACME issues (nginx ingress)
```
cat <<EOF | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    # You must replace this email address with your own.
    # Let's Encrypt will use this to contact you about expiring
    # certificates, and issues related to your account.
    email: gjermund@skobba.net
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      # Secret resource that will be used to store the account's private key.
      name: example-issuer-account-key
    # Add a single challenge solver, HTTP01 using nginx
    solvers:
    - http01:
        ingress:
          class: nginx
EOF
```
     
Create Cluster Issuer from stdin
```
cat <<EOF | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: letsencrypt-staging
spec:
  acme:
    # The ACME server URL
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: gjermund@skobba.net
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-staging
    # Enable the HTTP-01 challenge provider
    solvers:
      - http01:
          ingress:
            class:  pomerium
EOF
```

Create nginx sample from stdin
```
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: nginx
  name: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - image: nginx
        name: nginx
EOF
```

Expose nginx as a Service of type ClusterIP
```
kubectl expose deploy nginx --port 80
```

Create ingress resource
```
cat <<EOF | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-resource
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-staging
spec:
  tls:
  - hosts:
    - nginx.example.com
    secretName: letsencrypt-staging
  rules:
  - host: nginx.example.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx
            port:
              number: 80
EOF
```
