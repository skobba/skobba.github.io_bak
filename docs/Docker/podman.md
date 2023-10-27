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


## Build context
If a build context is not specified, and at least one Containerfile is a local file, the directory in which it resides is used as the build context.

## Slow build time
Install fuse-overlayfs

```
brew install fuse-overlayfs
podman system reset
podman info
```


