# Gremlin
_Validate the resiliency of your Highly Available (HA) Kubernetes_

Ref.: [https://www.gremlin.com/community/tutorials/how-to-test-your-high-availability-ha-kubernetes-cluster-using-gremlin/](https://www.gremlin.com/community/tutorials/how-to-test-your-high-availability-ha-kubernetes-cluster-using-gremlin/)

## Install
```
helm repo add gremlin https://helm.gremlin.com/

kubectl create namespace gremlin

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

## Attack
While the attack is running, check the state of your cluster using the Kubernetes Dashboard, kdash or a cluster management/monitoring tool like K9s.


