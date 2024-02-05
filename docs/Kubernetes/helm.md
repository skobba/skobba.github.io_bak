# Helm
A chart can be either an 'application' or a 'library' chart.

__Application__ charts are a collection of templates that can be packaged into versioned archives to be deployed.

__Library__ charts provide useful utilities or functions for the chart developer. They're included as a dependency of application charts to inject those utilities and functions into the rendering pipeline. Library charts do not define any templates and therefore cannot be deployed.

## Install
osx:
```
brew install helm
```

Debian:
```
wget https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz
tar -zxvf helm-v3.7.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin
```

Jenkins Chart:
```
helm repo add jenkins https://charts.jenkins.io

helm search repo jenkins
```

## Use
```
helm list --all-namespaces
```

## Upgrade
```
helm upgrade dashboard kubernetes-dashboard/kubernetes-dashboard --set="service.externalPort=8080,resources.limits.cpu=200m,metricsScraper.enabled=true"
```
