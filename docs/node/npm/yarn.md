# Yarn
Yarn does not have a function like “npm audit --fix”.

Automates the process under.
```
npm i --package-lock-only
```

This creates a temp package-lock.json you can perform fix operation on.
```
rm yarn.lock
yarn import
rm package-lock.json
```

