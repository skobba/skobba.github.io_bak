# argoncd

## Running Argo CD locally

### Clone repo
```
git clone https://github.com/argoproj/argo-cd
cd argo-cd
```

### Install
```kubectl create namespace argocd
kubectl apply -n argocd --force -f manifests/install.yaml
```

### Scale down any Argo CD instance in your cluster¶
Make sure that Argo CD is not running in your development cluster by scaling down the deployments.

```
kubectl -n argocd scale statefulset/argocd-application-controller --replicas 0
kubectl -n argocd scale deployment/argocd-dex-server --replicas 0
kubectl -n argocd scale deployment/argocd-repo-server --replicas 0
kubectl -n argocd scale deployment/argocd-server --replicas 0
kubectl -n argocd scale deployment/argocd-redis --replicas 0
kubectl -n argocd scale deployment/argocd-applicationset-controller --replicas 0
kubectl -n argocd scale deployment/argocd-notifications-controller --replicas 0
```

### Start local services (virtualized toolchain inside Docker)
The started services assume you are running in the namespace where Argo CD is installed.

You can set the current context default namespace as follows:
```
kubectl config set-context --current --namespace=argocd
```

When you use the virtualized toolchain, starting local services is as simple as running:
```
make start
```
