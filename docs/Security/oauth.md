# Oauth 2.0

*Up until 2019, the OAuth 2.0 spec only recommended using the PKCE extension for mobile and JavaScript apps. The latest OAuth Security BCP now recommends using PKCE also for server-side apps, as it provides some additional benefits there as well. It is likely to take some time before common OAuth services adapt to this new recommendation, but if you’re building a server from scratch you should definitely support PKCE for all types of clients.*

## RFC
1. [The OAuth 2.0 Authorization Framework](https://datatracker.ietf.org/doc/html/rfc6749)
    * [Implicit Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.2)
    * [Authorization Code Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1)
2. [Proof Key for Code Exchange by OAuth Public Clients](https://datatracker.ietf.org/doc/html/rfc7636)

## Grant Types
OAuth 2.0 has different grant types for various scenarios. Here are a few of them.

* __Password__: for logging in with username and password
* __Client credentials__: for when a user is not present
* __Authorization Code__: for mobile and web apps, and now also server side apps
* __Implicit__: historically used for single-page JavaScript apps where secrets cannot be securely stored


## Authorization Code with PKCE in conjunction with Silent Refresh
*Use of the Implicit Flow in SPAs presents security challenges requiring explicit mitigation strategies. You can use the Authorization Code Flow with PKCE in conjunction with Silent Authentication to renew sessions in SPAs.*

* [https://auth0.com/docs/login/configure-silent-authentication](https://auth0.com/docs/login/configure-silent-authentication)

Auth Server (AS) and Client (SPA) flow:
1. SPA redirects user to log in with AS.
2. AS logs user in and redirects back to the SPA with an access token that can be used to access an API
3. SPA calls API until it gets 401. (or uses some other mechanism to figure out time to get new access token)
4. SPA does a silent GET to the AS authorize endpoint in attempt to get new access token.
5. I IF AND ONLY user still has a valid session with AS (some sort of auth cookie likely) then AS will respond with valid access token (if AS believes the request is valid).

## Implicit Flow for Existing Apps
Ref.: [https://developer.okta.com/blog/2019/05/01/is-the-oauth-implicit-flow-dead[(https://developer.okta.com/blog/2019/05/01/is-the-oauth-implicit-flow-dead)

*The important thing to remember here is that there was no new vulnerability found in the Implicit flow. If you have an existing app that uses the Implicit flow, it’s not that your app is suddenly now insecure after this new guidance has been published.*

*That said, it is – and always has been – extremely challenging to implement the Implicit flow securely. If you have gone to the trouble of thoroughly auditing your source code, knowing exactly which third-party libraries you’re using in your application, have a strong Content Security Policy, and are confident in your ability to build a secure JavaScript application, then your application is probably fine.*

*So should you immediately switch all your apps to using PKCE instead of the Implicit flow? Probably not, it depends on your risk tolerance. But at this point I would definitely not recommend creating new apps using the Implicit flow.*



