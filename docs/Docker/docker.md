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
``
docker images prune -a
```

All:
```
docker rmi $(docker images -a -q)
```
