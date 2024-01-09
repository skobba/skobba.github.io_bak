# Docker

## Tag
```
docker tag localhost/kcskobba gsdemo.azurecr.io/kcskobba
```

## Login
```
docker login gsdemo.azurecr.io
```

## Push
```
docker push gsdemo.azurecr.io/kcskobba
```

## Delete images
Unused:
```
docker images prune -a
```

All:
```
docker rmi $(docker images -a -q)
```

## Find os release
```
docker run -it tomcat:9-alpine cat /etc/os-release
docker run -it tomcat:9-alpine cat /etc/release
```
