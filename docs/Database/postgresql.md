# postgresql
## Install w/ brew
```
brew install postgresql
```
## Start
```
brew services start postgresql
```
## Login
```
psql postgres
```

# Databases
List all databes with sizes 
```
\l+
```

## List Users
```
\du+
```

With sql:
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

## Create User
```
CREATE USER postgres WITH PASSWORD 'supersecret';
```

## Connect to DB
```
\c dbname
```

## List all Tables
```
\dt
```

## Describe a Table
```
\d tablename
```

## Restore Backup
```
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d dbname ./dumpfile
```
