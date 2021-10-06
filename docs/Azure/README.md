# Azure

## AD
[Authentication flows and application scenarios](https://docs.microsoft.com/en-gb/azure/active-directory/develop/authentication-flows-app-scenarios)

### Login
Ways to login
```
az login

az login --use-device-code​

az login --allow-no-subscriptions
``` 

### Apps
https://docs.microsoft.com/en-us/cli/azure/ad/app

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
