# Azure

## AD
* [Authentication flows and application scenarios](https://docs.microsoft.com/en-gb/azure/active-directory/develop/authentication-flows-app-scenarios)
* [App registration](https://docs.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-app-registration)

## Using Microsoft Graph REST
Get the appId and the corresponding objectId for the app
```
az ad app list --query "[].{ displayName: displayName, appId:appId, objectId:objectId }" --output table --all | sort
```

Use the objectId in a GET query
```
az rest --method GET --uri "https://graph.microsoft.com/v1.0/applications/<objectId>" --headers 'Content-Type=application/json' 
``` 

Use the objectId in a PATCH query (add redirect url to spa applicaiton)
```
UIREPLYURLS=`echo "["\"http://localhost:4000/redirect"\"]" | sed 's/;/\",\"/g'`
SPA_PATCH=$(printf '%s\n' "$UIREPLYURLS" | jq -c '{"spa":{"redirectUris":.}}')
az rest --method PATCH --uri "https://graph.microsoft.com/v1.0/applications/<objectId>" --headers 'Content-Type=application/json' --body="$SPA_PATCH"
```
