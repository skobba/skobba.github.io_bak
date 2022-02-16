# nginx ingress

## Install with Helm (nginx.com)
* [https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-helm/)

Get

  git clone https://github.com/nginxinc/kubernetes-ingress/
  helm repo add nginx-stable https://helm.nginx.com/stable
  helm repo update

Installing via Helm Repository

  helm install my-release nginx-stable/nginx-ingress --skip-crds

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
  
Upgrade via Helm Repository:

  helm upgrade my-release nginx-stable/nginx-ingress

## Instasll with Helm (kubernetes.io)
* [https://kubernetes.github.io/ingress-nginx/deploy/](https://kubernetes.github.io/ingress-nginx/deploy/)

Local testing
  
Let's create a simple web server and the associated service:

  kubectl create deployment demo --image=httpd --port=80
  kubectl expose deployment demo
  
Then create an ingress resource. The following example uses an host that maps to localhost:

  kubectl create ingress demo-localhost --class=nginx \
    --rule=demo.localdev.me/*=demo:80

Now, forward a local port to the ingress controller:

  kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 8080:80

## Install with Manifests
* [https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/)
