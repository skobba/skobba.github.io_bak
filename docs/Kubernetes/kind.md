# Kind
_Tool for running local Kubernetes clusters using Docker container “nodes”. kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI._

## Install
```
brew install minikub
```

## Create cluster
### Ingress ready (not working)
```sh
cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
EOF
```

### Generic from file:
```sh

cat <<EOF | kind create cluster --config=-
# 4 node (3 workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  image: kindest/node:v1.28.0
- role: worker
  image: kindest/node:v1.28.0
- role: worker
  image: kindest/node:v1.28.0
- role: worker
  image: kindest/node:v1.28.0
EOF
```

## Use cluster 
```
kubectl cluster-info --context kind-kind

outouts:
Kubernetes control plane is running at https://127.0.0.1:50102
CoreDNS is running at https://127.0.0.1:50102/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

## Basic
```
kind get clusters

kubectl cluster-info
```

## port-forward
```
kubectl port-forward -n default svc/php-apache 30008:80
```

## Ingress Countour
```
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/control-plane","operator":"Equal","effect":"NoSchedule"},{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'
```


## Install Kubernetes Dashboard
```
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

Time to deploy our Kubernetes Dashboard with one single command —

helm install dashboard kubernetes-dashboard/kubernetes-dashboard -n kubernetes-dashboard --create-namespace
```

Run proxy
```
kubectl proxy
```

Create a user and attach the necessary permission with service-account.yaml:
```
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF
```

Create user
```
kubectl apply -f service-account.yaml
```

Create token
```
kubectl create token admin-user -n kubernetes-dashboard
```

Get the token
```
kubectl describe serviceaccount admin-user -n kubernetes-dashboard
```

Open Dashboard
* [http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:dashboard-kubernetes-dashboard:https/proxy/#/login](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:dashboard-kubernetes-dashboard:https/proxy/#/login)
