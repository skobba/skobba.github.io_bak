# Kubernetes
*Created by Google*

Logical and distributed primitives
![primitives.png](primitives.png)

Common configuration for different vendors like Apache and nginx.

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
