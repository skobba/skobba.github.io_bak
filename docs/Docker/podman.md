# podman
Manage containers, pods, and images with Podman. Seamlessly work with containers and Kubernetes from your local environment.

```
# MACHINE
podman machine init
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
```
