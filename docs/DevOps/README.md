# DevOps

## Blue-Green Deployment
Ref.: [https://kubernetes.io/blog/2018/04/30/zero-downtime-deployment-kubernetes-jenkins/](https://kubernetes.io/blog/2018/04/30/zero-downtime-deployment-kubernetes-jenkins/)

Blue green deployment is an application release model that gradually transfers user traffic from a previous version of an app or microservice to a nearly identical new release—both of which are running in production. 

The old version can be called the blue environment while the new version can be known as the green environment. Once production traffic is fully transferred from blue to green, blue can standby in case of rollback or pulled from production and updated to become the template upon which the next update is made.
