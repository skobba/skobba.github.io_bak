# Kubernetes
*Created by Google*

Building blocks:
* Pod
* Service
* ConfigMap
* Secret
* Volume
* Ingress
* Deployment
  - For stateless services, but also non-clustered databases together with a persistant Volume.
* StatefulSet
  - For scaling databases across noded, where one gets to write and the rest gets to read.

Join a new node
```
kubeadm token create --print-join-command
```

Assign worker role to a node
```
kubectl label node kworker1 node-role.kubernetes.io/worker=worker
```

Access a cluster
> copy ~/.kube/config to your machine

List kube-system
```
kubectl get pods -n kube-system
```

Get log from pod
```
kubectl -n kube-system logs kube-proxy-xxxxx
```

Set worker role on node
```
kubectl label node nodename node-role.kubernetes.io/worker=worker
```

##  Dashboard
Deploy
``` 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml
```

Enable access
```
kubectl proxy
```

Copy snippet and run to create Service Account
```
kubectl apply -f dashboard-adminuser.yaml
```

Snippets
```
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
```

Get token
```
{% raw %}
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
{% endraw %}
```

URL
> [http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)

## Private Registry
Creates a imagePullSecrets object that contains your credentials as a list of secrets:

```
kubectl create secret docker-registry <registry-credential-secrets> \
  --docker-server=<private-registry-url> \
  --docker-email=<private-registry-email> \
  --docker-username=<private-registry-user> \
  --docker-password=<private-registry-password>
```

View secret
```
kubectl get secret <registry-credential-secrets> -o=yaml
```

New pods that are created in the default namespace now includes credentials and have access to your container images in a private registry
```
kubectl patch serviceaccount default -p "{\"imagePullSecrets\": [{\"name\": \"container-registry\"}]}"
```

Verify
```
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: private-image-test-1
spec:
  containers:
    - name: uses-private-image
      image: $PRIVATE_IMAGE_NAME
      imagePullPolicy: Always
      command: [ "echo", "SUCCESS" ]
EOF
```

Output log (SUCCESS)
```
kubectl logs private-image-test-1
```


