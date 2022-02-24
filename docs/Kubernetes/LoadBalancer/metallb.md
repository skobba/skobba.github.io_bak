# MetalLb
* [https://metallb.universe.tf/](https://metallb.universe.tf/)

MetalLB hooks into your Kubernetes cluster, and provides a network load-balancer implementation. In short, it allows you to create Kubernetes services of type LoadBalancer in clusters that don’t run on a cloud provider, and thus cannot simply hook into paid products to provide load balancers.

# Setup
```
kubectl edit configmap -n kube-system kube-proxy

and set:

apiVersion: kubeproxy.config.k8s.io/v1alpha1
kind: KubeProxyConfiguration
mode: "ipvs"
ipvs:
  strictARP: true
```

# Install

## Create nginx test deploy and expose it
```
kubectl create deploy nginx --image nginx

kubectl expose deploy nginx --port 80 --type LoadBalancer
```

Observe that LoadBalancer is pending.

## Setup
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml
```

## Create Config
The ip-range must be in the same range as the nodes.

```yaml

# Create config from stdin
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 10.10.2.240-10.10.2.250
EOF
```

## Test
```
curl 10.10.2.240
```
