# Demo Nginx Pod

```sh
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: demo-nginx
spec:
  containers:
  - name: nginx
    image: nginx:latest
    ports:
    - containerPort: 80
    volumeMounts:
    - name: html-volume
      mountPath: /usr/share/nginx/html
  initContainers:
  - name: init-web-content
    image: busybox
    command: ['sh', '-c', 'echo "demo.skobba.net" > /usr/share/nginx/html/index.html']
    volumeMounts:
    - name: html-volume
      mountPath: /usr/share/nginx/html
  volumes:
  - name: html-volume
    emptyDir: {}
EOF
```
