# Cognito

Cognito User Pools is a standards-based Identity Provider and supports identity and access management standards, such as OAuth 2.0, SAML 2.0, and OpenID Connect.

## 
Ref.:
* [user-pools-without-hosted-ui](https://lifesaver.codes/answer/identity-providers-authentication-against-user-pools-without-hosted-ui)
* [user-pool-hosted-ui-minimal-code-grant-sign-in-example-from-a-react-web-app](https://lifesaver.codes/answer/cognito-user-pool-hosted-ui-minimal-code-grant-sign-in-example-from-a-react-web-app-5284)

## Ref
* [Access control for Cognito users in AppSync](https://advancedweb.hu/how-to-use-cognito-with-appsync/)
* [Multi-tenant w/ AppSync](https://theburningmonk.com/2021/03/how-to-secure-multi-tenant-applications-with-appsync-and-cognito/)
* [https://creativedesignsguru.com/next-js-aws-amplify-cognito-oauth/](https://creativedesignsguru.com/next-js-aws-amplify-cognito-oauth/)
* [https://account.skobba.net/login?client_id=4ne5liigr6otv0btnqi9h95ckh&response_type=code&scope=email+openid+phone&redirect_uri=https%3A%2F%2Fblue.skobba.net](https://account.skobba.net/login?client_id=4ne5liigr6otv0btnqi9h95ckh&response_type=code&scope=email+openid+phone&redirect_uri=https%3A%2F%2Fblue.skobba.net)

## UserPool
* Cognito user pool sign-in options can't be changed after the user pool has been created (email or sms)
* Required attributes can't be changed once this user pool has been created (name, given_name)
* Your user pool name can't be changed once this user pool is created

## .well-known
```
https://cognito-idp.{region}.amazonaws.com/{userPoolId}/.well-known/jwks.json

Eg.:
https://cognito-idp.eu-north-1.amazonaws.com/eu-north-1_pIxfJNdPg/.well-known/jwks.json
```

## Authorization code grant with PKCE
Ref.: 
* https://docs.aws.amazon.com/cognito/latest/developerguide/authorization-endpoint.html#sample-authorization-code-grant-with-pkce
* https://lifesaver.codes/answer/cognito-user-pool-hosted-ui-minimal-code-grant-sign-in-example-from-a-react-web-app-5284

```
GET https://mydomain.auth.us-east-1.amazoncognito.com/oauth2/authorize?
                          response_type=code&
                          client_id=ad398u21ijw3s9w3939&
                          redirect_uri=https://YOUR_APP/redirect_uri&
                          state=STATE&
                          scope=aws.cognito.signin.user.admin&
                          code_challenge_method=S256&
                          code_challenge=CODE_CHALLENGE
```
