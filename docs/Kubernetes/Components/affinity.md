# Affinity

* __Hard affinity__ AKA "required node affinity", defined in the pod template under spec: ___affinity:nodeAffinity:requiredDuringSchedulingIgnoredDuringExecution___. This specifies conditions that a node must meet for a pod to schedule to it.
* ___Soft affinity__ AKA "preferred known affinity", defined in the pod template under spec: ___affinity:nodeAffinity:preferredDuringSchedulingIgnoredDuringExecution___. This specifies conditions that a node should preferably meet, but if they are not present, it is still okay to schedule the pod (as long as hard affinity criteria are met).

## Assigning pods
```yml
apiVersion: v1
kind: Pod
metadata:
  name: your-pod
  namespace: your-namespace
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: special-node
            operator: In
            values:
            - "true"
  containers:
  - name: your-container
    image: your-image

```
