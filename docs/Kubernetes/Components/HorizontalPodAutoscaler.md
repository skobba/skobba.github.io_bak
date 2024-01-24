# HorizontalPodAutoscaler
Ref.: [https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)

## Install

### metrics-server
```
minikube addons enable metrics-server
```

### kind
```
wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
```

Add insecure TLS parameter to the components.yaml file:
```
metadata:
      labels:
        k8s-app: metrics-server
    spec:
      containers:
      - args:
        - --cert-dir=/tmp
        - --secure-port=4443
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --kubelet-insecure-tls   <=========================================== Add this
        - --metric-resolution=15s
        image: k8s.gcr.io/metrics-server/metrics-server:v0.6.2
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          httpGet:
            path: /livez
```

Apply:
```
kubectl apply -f components.yaml
```
