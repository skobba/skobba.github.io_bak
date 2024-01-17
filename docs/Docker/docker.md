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

## Keep running
```
FROM ubuntu:latest
ENTRYPOINT ["tail", "-f", "/dev/null"]
```

### pseudo-tty
You can use the -t (pseudo-tty) docker parameter to keep the container running.
```
docker run -d -t ubuntu
```

### Using the tail command
You can run the container directly by passing the tail command via CMD arguments as shown below.
```
docker run -d ubuntu tail -f /dev/null
```

### Using sleep infinity
Another method is to execute a Linux sleep command to infinity.
```
docker run -d ubuntu sleep infinity
```
