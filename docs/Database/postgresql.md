# postgresql
# Brew
```
brew install postgresql
```

Start
```
brew services start postgresql
```

If failed to start via brew
```
rm /usr/local/var/postgresql@12/postmaster.pid
```
## Login
```
psql postgres
```
## Databases
List all databases with sizes 
```
\l+
```

Connect to DB
```
\c dbname
```

Create database
```
CREATE DATABASE mydb;

# Command line samples
createdb -U postgres mydb 
podman exec Bemanning createdb -U postgres Bemanning
```

Delete database
```
drop database mydb;

or from terminal:

dropdb -U db_owner_username -i [-h host] mysitedb
```

## Users
List users
```
\du+
```

List users with sql
```
SELECT usename AS role_name,
 CASE
  WHEN usesuper AND usecreatedb THEN
    CAST('superuser, create database' AS pg_catalog.text)
  WHEN usesuper THEN
    CAST('superuser' AS pg_catalog.text)
  WHEN usecreatedb THEN
    CAST('create database' AS pg_catalog.text)
  ELSE
    CAST('' AS pg_catalog.text)
 END role_attributes
FROM pg_catalog.pg_user
ORDER BY role_name desc;
```

Create User
```
CREATE USER postgres WITH PASSWORD 'supersecret';
```

Create SUPERUSER:
```
CREATE USER root;
ALTER USER root WITH SUPERUSER;
```

Set detailed permissions
```
ALTER USER myrole WITH OPTION1 OPTION2 OPTION3;
These options range from CREATEDB, CREATEROLE, CREATEUSER

ALTER USER librarian WITH NOSUPERUSER;
```

## Tables
Create table
```
CREATE TABLE films (
    code        char(5) CONSTRAINT firstkey PRIMARY KEY,
    title       varchar(40) NOT NULL,
    did         integer NOT NULL,
    date_prod   date,
    kind        varchar(10),
    len         interval hour to minute
);
```

List all Tables
```
\dt
```

Describe a Table
```
\d tablename
```
## Get config_file path
```
show config_file ;
```

## Backup and Restore
Dump/Backup
```
pg_dump -U dbuser dbname > dumpfile

```

Restore Backup
```
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d dbname ./dumpfile
```

## SSL
Ref.: [https://jdbc.postgresql.org/documentation/ssl/](https://jdbc.postgresql.org/documentation/ssl/)

NB:  Before trying to access your SSL enabled server from Java, make sure you can get to it via psql!

```
psql -h localhost -U postgres
psql (14.5)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=#
```

### SSL Mode
Possible values include disable , allow , prefer , require , verify-ca and verify-full. require , allow and prefer all default to a non-validating SSL factory and do not check the validity of the certificate or the host name. verify-ca validates the certificate, but does not verify the hostname. verify-full will validate that the certificate is correct and verify the host connected to has the same hostname as the certificate. Default is prefer.

![postgres-ssl.png](postgres-ssl.png)
