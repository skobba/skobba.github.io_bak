# Helm

## Install helm on Debian
```
wget https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz
tar -zxvf helm-v3.7.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin
```

## Install Jenkins Chart
```
helm repo add jenkins https://charts.jenkins.io

helm search repo jenkins
```
