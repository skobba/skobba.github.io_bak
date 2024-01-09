# App Service

## Create WebApp
Create a web app with an image from a private Azure Container Registry
```
az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName -i myregistry.azurecr.io/docker-image:tag

az webapp create -g demo -p ASP-demo-83a0 -n gjermundsapp -i gsdemo.azurecr.io/kcskobba
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

## App Service Plan
Ref.: [https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans)


Isolate your app into a new App Service plan when:

1. The app is resource-intensive. The number may actually be lower depending on how resource intensive the hosted applications are, however as a general guidance, you may refer to the table below:

| App Service Plan SKU | Max Apps                          |
| -------------------- | --------------------------------- |
| B1, S1, P1v2, I1v1   | 8                                 |
| B2, S2, P2v2, I2v1   | 16                                |
| B3, S3, P3v2, I3v1   | 32                                |
| P0v3                 | 8                                 |
| P1v3, I1v2           | 16                                |
| P2v3, I2v2, P1mv3    | 32                                |
| P3v3, I3v2, P2mv3    | 64                                |
| I4v2, I5v2, I6v2     | Max density bounded by vCPU usage |
| P3mv3, P4mv3, P5mv3  | Max density bounded by vCPU usage |

2. You want to scale the app independently from the other apps in the existing plan.

3. The app needs resource in a different geographical region.
