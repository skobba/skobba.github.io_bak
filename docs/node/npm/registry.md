# Registry

## Verdaccio
Ref.: [https://verdaccio.org](https://verdaccio.org)

Install:

    npm install -g verdaccio

Run:

      verdaccio

Set registry:

      npm set registry http://localhost:4873/

Set registry in your .npmrc:

      registry=http://localhost:4873

Config file on Mac:

      /Users/username/.config/verdaccio/config.yaml:

npm proxy settings in config:
```
# a list of other known repositories we can talk to
uplinks:
  npmjs:
    url: https://registry.npmjs.org/
```

