# Oauth 2.0

*Up until 2019, the OAuth 2.0 spec only recommended using the PKCE extension for mobile and JavaScript apps. The latest OAuth Security BCP now recommends using PKCE also for server-side apps, as it provides some additional benefits there as well. It is likely to take some time before common OAuth services adapt to this new recommendation, but if you’re building a server from scratch you should definitely support PKCE for all types of clients.*

## RFC
1. [The OAuth 2.0 Authorization Framework](https://datatracker.ietf.org/doc/html/rfc6749)
    * [Implicit Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.2)
    * [Authorization Code Grant](https://datatracker.ietf.org/doc/html/rfc6749#section-4.1)
2. [Proof Key for Code Exchange by OAuth Public Clients](https://datatracker.ietf.org/doc/html/rfc7636)

