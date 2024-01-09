# Postgres
Disable ssl:
```
az postgres server  update --resource-group myresourcegroup --name mydemoserver --ssl-enforcement Disabled
```

## Create database
### Create (single server)
```
az postgres server create --name $server --resource-group $resourceGroup --location "$location" --admin-user $login --admin-password $password --sku-name $sku

az postgres server create -n gspgdb -g demo --location "northeurope" --admin-user dbuser --admin-password p4ssword
```

### Create with "az postgres up" (single server) - configures firewall with local ip
```
az postgres up -g MyResourceGroup -s MyServer -d MyDatabase -u MyUsername -p MyPassword

NB: USERNAME BECOMES gjermund@gspgdb:
az postgres up -g demo -s gspgdb -d mydb -u gjermund -p p4ssword
```

### Create (flexible server)
```
az postgres flexible-server create -n gspgdb -g demo --location "northeurope" --admin-user dbadmin --admin-password p4ssword
```

### Create firewall rule
```
az postgres server firewall-rule create -g demo -s dbservername -n {rule_name} --start-ip-address {ip_address} --end-ip-address {ip_address}
```

## Difference between postgres databases
"Azure Database for PostgreSQL flexible server" uses another SSL alg then "Azure Database for PostgreSQL single server"

## SSL for Postgres in Production
Ref.: 
* https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-connect-tls-ssl
* https://learn.microsoft.com/en-gb/azure/postgresql/single-server/concepts-certificate-rotation?WT.mc_id=Portal-SqlAzureExtension#what-do-i-need-to-do-to-maintain-connectivity


## AZURE_POSTGRESQL_CONNECTIONSTRING
```
Database=keycloak;Server=gspostgres.postgres.database.azure.com;UserId=keycloak;Password=keycloak

postgres://dbuser%40gspgdb:p4ssword@gspgdb.postgres.database.azure.com/postgres?sslmode=require

```

