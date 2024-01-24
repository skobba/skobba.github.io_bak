# HorizontalPodAutoscaler
Ref.: [https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)

## Install metrics-server

For kind:
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

## Run and expose php-apache server
php-apache.yaml
```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: php-apache
spec:
  selector:
    matchLabels:
      run: php-apache
  template:
    metadata:
      labels:
        run: php-apache
    spec:
      containers:
      - name: php-apache
        image: registry.k8s.io/hpa-example
        ports:
        - containerPort: 80
        resources:
          limits:
            cpu: 500m
          requests:
            cpu: 200m
---
apiVersion: v1
kind: Service
metadata:
  name: php-apache
  labels:
    run: php-apache
spec:
  ports:
  - port: 80
  selector:
    run: php-apache

```

Apply:
```
kubectl apply -f php-apache.yaml
```

## Create the HorizontalPodAutoscaler 
* Creates a HorizontalPodAutoscaler that maintains between 1 and 10 replicas of the Pods controlled by the php-apache Deployment above.
* The HPA controller will increase and decrease the number of replicas (by updating the Deployment) to maintain an average CPU utilization across all Pods of 50%.
* The Deployment then updates the ReplicaSet - this is part of how all Deployments work in Kubernetes - and then the ReplicaSet either adds or removes Pods based on the change to its .spec.

Since each pod requests 200 milli-cores by kubectl run, this means an average CPU usage of 100 milli-cores. See Algorithm details for more details on the algorithm.

```
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
```

## Check hpa
```
# You can use "hpa" or "horizontalpodautoscaler"; either name works OK.
kubectl get hpa
```

## Increase the load
To do this, you'll start a different Pod to act as a client. The container within the client Pod runs in an infinite loop, sending queries to the php-apache service.

Watch:
```
kubectl get hpa php-apache --watch
```

Load:
```
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"
```
