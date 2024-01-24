# Chaos Engineering
_Chaos engineering can be used to simulate various types of failures that may occur in a cluster, such as node failures, network partitions, and application failures._

Before introducing chaos into a Kubernetes cluster, it is essential to define the objective of the experiment. This could be to test the resilience of a specific application, identify bottlenecks in the system, or evaluate the effectiveness of a new feature
 
## Tools
These tools allow you to simulate various types of failures and disruptions, such as node outages, network issues, and resource constraints:
* Chaos Mesh
* LitmusChaos
* Chaos Toolkit
* Kube-Monkey
* Chaos Kube

### Chaos Mesh
![chaos-mesh.png](chaos-mesh.png)

```
curl -sSL https://mirrors.chaos-mesh.org/v2.3.0/install.sh | bash

# For kind
curl -sSL https://mirrors.chaos-mesh.org/v2.6.2/install.sh | bash -s -- --local kind
```

Accessing the Chaos Mesh Dashboard:
```
# Initiate the following port-forward command
kubectl port-forward -n chaos-testing svc/chaos-dashboard 2333:2333

# Browser
http://localhost:2333/#/dashboard
```

Run some Chaos experiments...


### Gremlin

Install
```
helm repo add gremlin https://helm.gremlin.com

kubectl create namespace gremlin

GREMLIN_TEAM_ID=GTeam
GREMLIN_CLUSTER_ID=kind
GREMLIN_TEAM_SECRET=sOmeSecreT

helm install gremlin gremlin/gremlin --namespace gremlin \
    --set gremlin.hostPID=true \
    --set gremlin.secret.managed=true \
    --set gremlin.secret.type=secret \
    --set gremlin.secret.teamID=$GREMLIN_TEAM_ID \
    --set gremlin.secret.clusterID=$GREMLIN_CLUSTER_ID \
    --set gremlin.secret.teamSecret=$GREMLIN_TEAM_SECRET \
    --set 'tolerations[0].effect=NoSchedule' \
    --set 'tolerations[0].key=node-role.kubernetes.io/master' \
    --set 'tolerations[0].operator=Exists'
```
