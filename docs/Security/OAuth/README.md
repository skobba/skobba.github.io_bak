# Oauth 2.0

*Up until 2019, the OAuth 2.0 spec only recommended using the PKCE extension for mobile and JavaScript apps. The latest OAuth Security BCP now recommends using PKCE also for server-side apps, as it provides some additional benefits there as well. It is likely to take some time before common OAuth services adapt to this new recommendation, but if you’re building a server from scratch you should definitely support PKCE for all types of clients.*

## Cookie and token considerations
* Ref.: [Cookie vs Access Token](https://authguidance.com/2019/09/08/ui-token-management/)
* Ref.: [Secure SPA using BFF pattern](https://blog.nashtechglobal.com/secure-spa-using-bff-pattern-with-spring-cloud-gateway/)

### Cookies-based authentication
Created by a web server and placed on the user’s web browser. The browser will automatically send them for subsequence requests in the same domain. Authentication cookies are used by web servers to authenticate that a user is logged in.

___The advantages___

* Cookies are managed by the browser. It is automatic.
* You can prevent client JavaScript to read them by setting the HttpOnly flag to true. This will prevent cross-site scripting (XSS) attacks on your application to steal them or manipulate them.

___The downsides___

* It is vulnerable to cross-site request forgery attacks (XSRF or CSRF). Although there are workarounds to mitigate this threat, the risk still there. Recently the major browsers have introduced SameSite attribute that allow us to decide whether cookies should be sent to third-party websites using the Strict or Lax setting.
* Cookies is not friendly with REST APIs and do not scale well in an microservice landscape.
* Requires tokens to be stored in an database to scale in production.
* Requires the backend and frontend to be on the same domain.

### Token-based authentication
The web browser will receive a token from the web server after it has verified the user’s login detail. Then in subsequent requests, that token will be sent to server as an authentication header.

___The advantages___

* Unlike cookies, token is not automatically received or sent to server. It has to be done by JavaScript. Therefore, it is invulnerable to cross-site request forgery attacks (CSRF)
Token is friendly with REST APIs

___The downsides___

* Because the token must be read and sent by JavaScript so it is vulnerable to cross-site scripting (XSS)
* Granting, storing and renewing token is complicated. In 2012 when the OAuth2 RFC was released, the implicit flow is the recommended way for SPAs. However, it has many drawbacks, the main concern is that the access token is delivered to browser via a query string in the redirect URI, which is visible in the browser’s address bar, the browsers history. The access token can also be maliciously injected. The implicit flow is deprecated by code flow with PKCE. Regarding to any approaches, the token has to be stored in the browser, and this is a risk.
* Must keep token a secret in frontend.
* Requires refreshing the short lived access_token.

## 2021 Security Update
In 2021 it is instead recommended to use a Back End for Front End approach for SPA security. This requires more moving parts*

Ref.:
* [https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-browser-based-apps)
* [https://datatracker.ietf.org/doc/draft-bertocci-oauth2-tmi-bff/](https://datatracker.ietf.org/doc/draft-bertocci-oauth2-tmi-bff/)
* [https://authguidance.com/](https://authguidance.com/)
* [The OAuth 2.0 Authorization Framework](https://datatracker.ietf.org/doc/html/rfc6749)
** [Implicit Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.2)
** [Authorization Code Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1)
* [Proof Key for Code Exchange by OAuth Public Clients](https://datatracker.ietf.org/doc/html/rfc7636)

## Grant Types
OAuth 2.0 has different grant types for various scenarios. Here are a few of them.

* __Password__: for logging in with username and password
* __Client credentials__: for when a user is not present
* __Authorization Code__: for mobile and web apps, and now also server side apps
* __Implicit__: DEPRECATED by code flow with PKCE - historically used for single-page JavaScript apps where secrets cannot be securely stored.

## Authorization Code with PKCE in conjunction with Silent Refresh
* Use of the Implicit Flow in SPAs presents security challenges requiring explicit mitigation strategies. You can use the Authorization Code Flow with PKCE in conjunction with Silent Authentication to renew sessions in SPAs.*

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



