# Ingress
* [https://www.youtube.com/watch?v=chwofyGr80c&t=904s&ab_channel=JustmeandOpensource](https://www.youtube.com/watch?v=chwofyGr80c&t=904s&ab_channel=JustmeandOpensource)
* [https://kubernetes.github.io/ingress-nginx](https://kubernetes.github.io/ingress-nginx)
* [https://github.com/nginxinc/kubernetes-ingress](https://github.com/nginxinc/kubernetes-ingress)

### Clone repo

        git clone git@github.com:nginxinc/kubernetes-ingress.git

## Installation with Manifests

        cd kubernetes-ingress/deployments

### Configure RBAC
Create a namespace and a service account for the Ingress controller:

        kubectl apply -f common/ns-and-sa.yaml

Create a cluster role and cluster role binding for the service account:
        kubectl apply -f rbac/rbac.yaml
    
(App Protect only) Create the App Protect role and role binding:
        kubectl apply -f rbac/ap-rbac.yaml
    
(App Protect Dos only) Create the App Protect Dos role and role binding:
        kubectl apply -f rbac/apdos-rbac.yaml

### Create Common Resources
Create a secret with a TLS certificate and a key for the default server in NGINX:

        kubectl apply -f common/default-server-secret.yaml

Note: The default server returns the Not Found page with the 404 status code for all requests for domains for which there are no Ingress rules defined. For testing purposes we include a self-signed certificate and key that we generated. However, we recommend that you use your own certificate and key.

Create a config map for customizing NGINX configuration:

        kubectl apply -f common/nginx-config.yaml

Create an IngressClass resource:

        kubectl apply -f common/ingress-class.yaml

If you would like to set the Ingress Controller as the default one, uncomment the annotation ingressclass.kubernetes.io/is-default-class. With this annotation set to true all the new Ingresses without an ingressClassName field specified will be assigned this IngressClass.

Note: The Ingress Controller will fail to start without an IngressClass resource.

Create custom resource definitions for VirtualServer and VirtualServerRoute, TransportServer and Policy resources

        kubectl apply -f common/crds/k8s.nginx.org_virtualservers.yaml
        kubectl apply -f common/crds/k8s.nginx.org_virtualserverroutes.yaml
        kubectl apply -f common/crds/k8s.nginx.org_transportservers.yaml
        kubectl apply -f common/crds/k8s.nginx.org_policies.yaml

### Deploy the Ingress Controller

        kubectl apply -f daemon-set/nginx-ingress.yaml
