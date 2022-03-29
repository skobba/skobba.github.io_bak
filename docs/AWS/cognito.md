# Cognito

Cognito User Pools is a standards-based Identity Provider and supports identity and access management standards, such as OAuth 2.0, SAML 2.0, and OpenID Connect.

## Ref
* [Access control for Cognito users in AppSync](https://advancedweb.hu/how-to-use-cognito-with-appsync/)
* [Multi-tenant w/ AppSync](https://theburningmonk.com/2021/03/how-to-secure-multi-tenant-applications-with-appsync-and-cognito/)

## Setup with Amplify
```
amplify init
amplify add auth
```

## Findings
* Stores access tokens in localstorage.
* [https://stackoverflow.com/questions/65280171/aws-cognito-identity-service-provider-appears-to-store-access-token-in-local-sto](https://stackoverflow.com/questions/65280171/aws-cognito-identity-service-provider-appears-to-store-access-token-in-local-sto)

## Access Token
Options:
* localstorage (default)
* cookie
* variable

