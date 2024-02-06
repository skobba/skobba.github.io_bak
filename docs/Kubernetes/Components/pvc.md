# PVC

# pvc-inspector

```sh
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: pvc-inspector
spec:
  containers:
  - image: busybox
    name: pvc-inspector
    command: ["tail"]
    args: ["-f", "/dev/null"]
    volumeMounts:
    - mountPath: /pvc
      name: pvc-mount
  volumes:
  - name: pvc-mount
    persistentVolumeClaim:
      claimName: YOUR_CLAIM_NAME_HERE

EOF
```

Alternatively, I've created a templating service to simplify these kind of tasks:

```sh
kubectl apply -f 'https://k8s.sauerburger.com/t/pvc-inspect.yaml?image=busybox&name=pvc-inspector&pvc=YOUR_CLAIM_NAME_HERE'
```

Inspect the contents
```sh
kubectl exec -it pvc-inspector -- sh
$ ls /pvc
```

Clean Up
```sh
kubectl delete pod pvc-inspector
```
