# Azure CLI
## Login
Ways to login
```
az login

az login --use-device-code​

az login --allow-no-subscriptions
``` 

## Apps
* https://docs.microsoft.com/en-us/cli/azure/ad/app
* Issue with SPA: https://github.com/Azure/azure-cli/issues/14880

Ways to list apps
```
az ad app list
az ad app list | jq '.[].displayName'
az ad app list --query "[].{ displayName: displayName, appId:appId }" --output table --all | sort
az ad app list --query "[].{ displayName: displayName, appId:appId }" --output table --all | sort | grep myapp
```

Create app
```
az ad app create --display-name "myapp"
```

Delete app
```
az ad app delete --id xxxxxxxx-xxxxxxxxx-xxxxxxx-xxxxxxx
```

List app
```
az ad app show --id xxxxxxxx-xxxxxxxxx-xxxxxxx-xxxxxxx
```

Credentials shot and list
```
az ad app credential list --id xxxxxxxx-xxxxxxxxx-xxxxxxx-xxxxxxx
az ad app credential reset --id xxxxxxxx-xxxxxxxxx-xxxxxxx-xxxxxxx --credential-description "Secret1"
az ad app credential reset --id xxxxxxxx-xxxxxxxxx-xxxxxxx-xxxxxxx --credential-description "Secret2" --append
```

Add reply/redirect url
```
az ad app update --id xxxxxxxx-xxxxxxxxx-xxxxxxx-xxxxxxx --add replyUrls "http://localhost:3000/redirect"
```

All apps created by the currently logged in user:
```
az ad app list --show-mine --query "[].{id:appId, name:displayName, graphId:objectId}"
```

All service principals created by the currently logged in user:
```
az ad sp list --show-mine --query "[].{id:appId, name:displayName, tenant:appOwnerTenantId}"

```
