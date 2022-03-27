# Amplify

## Toolchain
Some AWS Amplify toolchain commands:

Install and configure:
```
npm install -g @aws-amplify/cli

amplify configure
```


```
User status:
amplify user status

Continue working on another machine:
amplify pull --appId <appid> --envName dev
```

![Amplify](amplify.png)

Warnings:
```
added 1714 packages, and audited 1740 packages in 52s

57 packages are looking for funding
  run `npm fund` for details

38 vulnerabilities (4 low, 1 moderate, 32 high, 1 critical)

To address issues that do not require attention, run:
  npm audit fix

To address all issues (including breaking changes), run:
  npm audit fix --force

Run `npm audit` for details
```

Warnings from CI build:
![amplify-warnings.jpg](amplify-warnings.jpg)


