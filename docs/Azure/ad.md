# AD

## Securing Web APIs
* [Microsoft identity platform access tokens](https://docs.microsoft.com/en-us/azure/active-directory/develop/access-tokens#validating-tokens)
* [Microsoft identity platform code samples](https://docs.microsoft.com/en-us/azure/active-directory/develop/sample-v2-code)
* [Securing a Node.js REST API With Azure AD JWT Bearer Tokens](https://stevelathrop.net/securing-a-node-js-rest-api-with-azure-ad-jwt-bearer-tokens/)
* [How to secure a Web API built with ASP.NET Core using the Azure AD B2C](https://docs.microsoft.com/en-us/samples/azure-samples/active-directory-aspnetcore-webapp-openidconnect-v2/how-to-secure-a-web-api-built-with-aspnet-core-using-the-azure-ad-b2c/)
* [Azure AD SPA Code Sample](https://authguidance.com/2017/12/01/azure-ad-spa-code-sample/)

## Tokens
Access tokens enable clients to securely call protected web APIs, and are used by web APIs to perform authentication and authorization. Per the OAuth specification, access tokens are opaque strings without a set format - some identity providers (IDPs) use GUIDs, others use encrypted blobs. The Microsoft identity platform uses a variety of access token formats depending on the configuration of the API that accepts the token. Custom APIs registered by developers on the Microsoft identity platform can choose from two different formats of JSON Web Tokens (JWTs), called "v1" and "v2", and Microsoft-developed APIs like Microsoft Graph or APIs in Azure have additional proprietary token formats. These proprietary formats might be encrypted tokens, JWTs, or special JWT-like tokens that will not validate.
