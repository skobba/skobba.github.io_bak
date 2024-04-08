# curl

## Access deployment
Inserts the address into curl's DNS cache, so it effectively makes curl believe that is the address it got when it resolved the name.
```sh
curl --resolve demo.localdev.me:8080:127.0.0.1 http://demo.localdev.me:8080
```

## Download File
```
curl -O https://registry.npmjs.org/immutable/-/immutable-1.2.0.tgz
```
