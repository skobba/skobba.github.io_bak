# podman
Manage containers, pods, and images with Podman. Seamlessly work with containers and Kubernetes from your local environment.

```
# MACHINE
podman machine init
podman machine init --cpus 4 --memory 8192 --disk-size 20
podman machine start

# IMAGES
podman image list 
podman image rm <ID>
podman build -t skobba/frontend:latest .
time podman build -t skobba/reactapp:latest . --log-level=debug

# CONTAINERS
podman container ps -a
podman container rm <ID>

# Start Postgres
podman run --name skobba_postgres -e POSTGRES_PASSWORD='qwe123' -d -p 5432:5432 postgres:13.8

# Copy file
podman cp db_dump.sql skobba_postgres:/db_dump.sql

# Container shell
podman exec -it skobba_postgres bash
podman exec skobba_postgres pg_restore -U postgres -d skobba /database_dump
```

## Pods
```
podman pod create --label myFirstPod
podman pod create --label mySecondPod
podman pod ps

podman play kube some-mariadb.yaml
```

## Create unix sockets (podman-mac-helper)
1. Install helper
```
sudo podman-mac-helper install
```

2. Restart podman machine
outputs:
```
Starting machine "skobbis"
Waiting for VM ...
Mounting volume... /Users:/Users
Mounting volume... /private:/private
Mounting volume... /var/folders:/var/folders
API forwarding listening on: /var/run/docker.sock
Docker API clients default to this address. You do not need to set DOCKER_HOST.
Machine "skobbis" started successfully
```

3. Verify that socket file was created
```
ls -la /var/run/docker.sock
```

## Connection list
```
podman system connection list
```

## Build context
If a build context is not specified, and at least one Containerfile is a local file, the directory in which it resides is used as the build context.

## Slow build time
Install fuse-overlayfs

```
brew install fuse-overlayfs
podman system reset
podman info
```
## Switch from docker
```
echo alias docker=podman >> ~/.zshrc
sudo rm -rf  /usr/local/bin/docker
sudo ln -s /usr/local/bin/podman /usr/local/bin/docker || true
```

## Azure Container Registry Login
Get credentials:

Azure -> Container registries -> Your Registry -> Access keys

```
docker login yourcontainerregistry.azurecr.io
```

Pull test:
```
docker pull yourcontainerregistry.azurecr.io/cicdtestimage:xx
```
