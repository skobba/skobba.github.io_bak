# App Service
## List webapps
```
az webapp list --query "[].{hostName: defaultHostName, state: state}" -otable
```

## Create WebApp
Create a web app with an image from a private Azure Container Registry
```
az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName -i myregistry.azurecr.io/docker-image:tag

# With startup command
az webapp create -g demo -p ASP-demo-83a0 -n gskeycloak --deployment-container-image-name gsdemo.azurecr.io/keycloak:1 --startup-file start-dev
```

Add vnet to a webapp
```
az webapp vnet-integration add -g MyResourceGroup -n MyWebapp --vnet MyVnetName --subnet MySubnetName -s [slot]

az webapp vnet-integration add -g demo -n gjermundsapp --vnet vnet-acquapgb --subnet subnet-obkpbupj
```

## Start/Stop
```
az webapp start --name kcskobba --resource-group demo
az webapp stop --name kcskobba --resource-group demo
```

## Set env vars
```
az webapp config appsettings set --resource-group <resource-group-name> --name <app-name> --settings PGADMIN_DEFAULT_EMAIL="user@domain.com" PGADMIN_DEFAULT_PASSWORD="SuperSecret"

az webapp config appsettings set --resource-group demo --name gspgadmin4 --settings PGADMIN_DEFAULT_EMAIL="demo@demo.com" PGADMIN_DEFAULT_PASSWORD="demo1234" PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION="False" PGADMIN_CONFIG_CONSOLE_LOG_LEVEL="10"
```

Set docker cred
```
az webapp config appsettings set --resource-group demo --name kcskobba --settings DOCKER_REGISTRY_SERVER_URL="https://gsdemo.azurecr.io" DOCKER_REGISTRY_SERVER_USERNAME="gsdemo" DOCKER_REGISTRY_SERVER_PASSWORD="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

Set Keycloak env
```
az webapp config appsettings set --resource-group demo --name kcskobba --settings KC_DB="postgres" KC_DB_URL="jdbc:postgresql://gspostgres.postgres.database.azure.com:5432/keycloak" KC_DB_USERNAME="keycloak" KC_DB_PASSWORD="keycloak" KEYCLOAK_ADMIN="admin" KEYCLOAK_ADMIN_PASSWORD="admin1234"
```

## Customer Containers
Ref.: 
* [https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container?tabs=azure-cli&pivots=container-linux](https://learn.microsoft.com/en-us/azure/app-service/tutorial-custom-container?tabs=azure-cli&pivots=container-linux)
* [https://learn.microsoft.com/en-us/azure/app-service/configure-custom-container?tabs=debian&pivots=container-linux](https://learn.microsoft.com/en-us/azure/app-service/configure-custom-container?tabs=debian&pivots=container-linux)

### Continuous deployment with custom containers
When you enable this option, App Service adds a webhook to your repository in Azure Container Registry or Docker Hub. Your repository posts to this webhook whenever your selected image is updated with docker push. The webhook causes your App Service app to restart and run docker pull to get the updated image.

WebApp -> Deployment Center -> Settings

### Ports
_App Service assumes your custom container is listening on port 80. If your container listens to a different port, set the WEBSITES_PORT app setting in your App Service app._

__WEBSITES_PORT__

For a custom container, the custom port number on the container for App Service to route requests to. By default, App Service attempts automatic port detection of ports 80 and 8080. This setting isn't injected into the container as an environment variable.¨

### Environment variables
You can check your vars here:
```
https://<app-name>.scm.azurewebsites.net/Env.
```

### Enable SSH to Linix Web App

_This configuration doesn't allow external connections to the container. SSH is available only through the Kudu/SCM Site. The Kudu/SCM site is authenticated with your Azure account. root:Docker! should not be altered SSH. SCM/KUDU will use your Azure Portal credentials. Changing this value will result in an error when using SSH_

__Enabling ssh via port 2222 in Azure portal on Debian GNU/Linux 10 (buster)__

sshd_config
```
Port 			2222
ListenAddress 		0.0.0.0
LoginGraceTime 		180
X11Forwarding 		yes
Ciphers aes128-cbc,3des-cbc,aes256-cbc,aes128-ctr,aes192-ctr,aes256-ctr
MACs                    hmac-sha1,hmac-sha1-96
StrictModes 		yes
SyslogFacility 		DAEMON
PasswordAuthentication 	yes
PermitEmptyPasswords 	no
PermitRootLogin 	yes
```

init.sh
```
#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

python /code/manage.py runserver 0.0.0.0:8000
```
Dockerfile
```
FROM tiangolo/uwsgi-nginx-flask:python3.6

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt --no-cache-dir
ADD . /code/

# ssh
ENV SSH_PASSWD "root:Docker!"
RUN apt-get update \
        && apt-get install -y --no-install-recommends dialog \
        && apt-get update \
 && apt-get install -y --no-install-recommends openssh-server \
 && echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 8000 2222

#CMD ["python", "/code/manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT ["init.sh"]
```
