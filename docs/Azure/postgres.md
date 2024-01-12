# Postgres

## Create database
Let this be a reminder of how slow Azure is to delete a resource. This is a problem when you want to delete and restore an Postgres db and have to wait for things to finish like:
* Specified server name is already used.
* Message: Operations on a server group in dropping state are not allowed.

![delete-postgres-azure.png](delete-postgres-azure.png)

### Create (single server - DEPRECATED 2025!)
```
az postgres server create --name $server --resource-group $resourceGroup --location "$location" --admin-user $login --admin-password $password --sku-name $sku

az postgres server create -n gspgdb -g demo --location "northeurope" --admin-user dbuser --admin-password p4ssword
```

### Create with "az postgres up" (single server - DEPRECATED 2025!) - configures firewall with local ip
```
az postgres up -g MyResourceGroup -s MyServer -d MyDatabase -u MyUsername -p MyPassword

NB: USERNAME BECOMES gjermund@gspgdb:
az postgres up -g demo -s gspgdb -d mydb -u gjermund -p p4ssword
```

### Create (flexible server)
```
az postgres flexible-server create -n gspgdb -g demo --location "northeurope" --admin-user dbadmin --admin-password p4ssword
```

### Create (flexible server) with vnet
```
az postgres flexible-server create -n gspgdb --subnet /subscriptions/{SubID}/resourceGroups/{ResourceGroup}/providers/Microsoft.Network/virtualNetworks/{VNetName}/subnets/{SubnetName}

az postgres flexible-server create -n gspgdb -g demo --location "northeurope" --admin-user dbadmin --admin-password p4ssword --vnet vnet-acquapgb --address-prefixes 10.0.0.0/24 --subnet subnet-obkpbupj --subnet-prefixes 10.0.0.0/24

NB: Check that the subnet is correct in the vnet!
az postgres flexible-server create -n gspgdb -g demo --location "northeurope" --admin-user keycloak --admin-password keycloak --vnet vnet-acquapgb --subnet subnet-nqnlui6nuir6e
```

## Connect with psql
```
psql -h gspgdb.postgres.database.azure.com -p 5432 -U keycloak postgres
```

## Create firewall rule
```
az postgres server firewall-rule create -g demo -s dbservername -n {rule_name} --start-ip-address {ip_address} --end-ip-address {ip_address}
```

## Difference between postgres databases
"Azure Database for PostgreSQL flexible server" uses another SSL alg then "Azure Database for PostgreSQL single server"

## Encryption
SSL/TLS Ref.: [https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-networking-ssl-tls](https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/concepts-networking-ssl-tls)

___Data encryption can only be configured during creation of a new server, not as an update to the existing Flexible Server. You may also wish to restore existing PITR backup to a new server and enable data encryption with Customer Managed Keys.___

Disable ssl with:
```
--ssl-enforcement Disabled
```

Check databases for ssl:
```
SELECT datname as "Database name", usename as "User name", ssl, client_addr, application_name, backend_type
   FROM pg_stat_ssl
   JOIN pg_stat_activity
   ON pg_stat_ssl.pid = pg_stat_activity.pid
   ORDER BY ssl;
```

### SSL for Postgres in Production
Ref.: 
* https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-connect-tls-ssl
* https://learn.microsoft.com/en-gb/azure/postgresql/single-server/concepts-certificate-rotation?WT.mc_id=Portal-SqlAzureExtension#what-do-i-need-to-do-to-maintain-connectivity

### Connect with psql and ssl
Download [DigiCert Global Root CA](https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem) for Azure Postgres flexible server.

```
psql "sslmode=verify-full sslrootcert=DigiCertGlobalRootCA.crt.pem host=gspgdb.postgres.database.azure.com dbname=postgres user=keycloak"
```

### Connect with psql
```
psql --host=<server_name>.postgres.database.azure.com --port=5432 --username=<admin_user>@<server_name> --dbname=postgres

psql postgresql://<admin_user>%40<server_name>@<server_name>.postgres.database.azure.com:5432/postgres
```

### AZURE_POSTGRESQL_CONNECTIONSTRING
```
Database=keycloak;Server=gspostgres.postgres.database.azure.com;UserId=keycloak;Password=keycloak

postgres://dbuser%40gspgdb:p4ssword@gspgdb.postgres.database.azure.com/postgres?sslmode=require

postgresql://dbadmin:p4ssword@gspgdb.postgres.database.azure.com/flexibleserverdb?sslmode=require
```

