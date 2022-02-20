# cert-manager

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
