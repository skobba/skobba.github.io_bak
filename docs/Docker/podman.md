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
```
