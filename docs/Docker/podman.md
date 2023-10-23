# podman
Manage containers, pods, and images with Podman. Seamlessly work with containers and Kubernetes from your local environment.

```
# MACHINE
podman machine init
podman machine init --cpus 4 --memory 4096 --disk-size 20
podman machine start

# IMAGES
podman image list 
podman image rm <ID>
podman build -t skobba/frontend:latest .

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
