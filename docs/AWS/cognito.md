# Cognito

Cognito User Pools is a standards-based Identity Provider and supports identity and access management standards, such as OAuth 2.0, SAML 2.0, and OpenID Connect.

## Ref
* [Access control for Cognito users in AppSync](https://advancedweb.hu/how-to-use-cognito-with-appsync/)
* [Multi-tenant w/ AppSync](https://theburningmonk.com/2021/03/how-to-secure-multi-tenant-applications-with-appsync-and-cognito/)

## UserPool
* Cognito user pool sign-in options can't be changed after the user pool has been created (email or sms)
* Required attributes can't be changed once this user pool has been created (name, given_name)

## Setup with Amplify
```
amplify init
amplify add auth
```

