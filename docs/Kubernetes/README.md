# Kubernetes
* Created by Google
* First Cloud Native project member
* [Kubernetes Pattern](kubernetes-patterns.pdf)

__Logical and distributed primitives:__

![primitives.png](primitives.png)

__Building blocks:__
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
