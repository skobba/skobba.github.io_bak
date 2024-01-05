# docker-compose
Brew
```
brew install docker-compose
```

Manuall install
```
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version
```

Enter shell
```
docker-compose exec server bash
```

Copy file from container
```
docker-compose cp postgres:/root/keycloakdb ./keycloakdb
```
