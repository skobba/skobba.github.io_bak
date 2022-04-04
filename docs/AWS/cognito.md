# Cognito

Cognito User Pools is a standards-based Identity Provider and supports identity and access management standards, such as OAuth 2.0, SAML 2.0, and OpenID Connect.

## Ref
* [Access control for Cognito users in AppSync](https://advancedweb.hu/how-to-use-cognito-with-appsync/)
* [Multi-tenant w/ AppSync](https://theburningmonk.com/2021/03/how-to-secure-multi-tenant-applications-with-appsync-and-cognito/)
* [https://creativedesignsguru.com/next-js-aws-amplify-cognito-oauth/](https://creativedesignsguru.com/next-js-aws-amplify-cognito-oauth/)
* [https://account.skobba.net/login?client_id=4ne5liigr6otv0btnqi9h95ckh&response_type=code&scope=email+openid+phone&redirect_uri=https%3A%2F%2Fblue.skobba.net](https://account.skobba.net/login?client_id=4ne5liigr6otv0btnqi9h95ckh&response_type=code&scope=email+openid+phone&redirect_uri=https%3A%2F%2Fblue.skobba.net)

## UserPool
* Cognito user pool sign-in options can't be changed after the user pool has been created (email or sms)
* Required attributes can't be changed once this user pool has been created (name, given_name)
* Your user pool name can't be changed once this user pool is created

## Setup with Amplify
```
amplify init
amplify add auth
```

