# Amplify
Framework that creates and manages a bunch of services in AWS, see also the alternative, [Serverless](https://www.serverless.com/).

By choosing Amplify as infrastructure and CI there are certain choises that are made and desisoins that are taken for you.

Notes:
* Some adjustments to make nextjs fit to Amplify
  * "next build && next export" identifies that it´s a SSG (static site generation) app.
  * Amplify needs a trailing slash at the end of signin URI
* User yarn and not npm
* Need to use the "amplify" command from adding/removing components from your app and for CI commands.
* Mono/multi-repo - Choose the best match for local dev and CI env.
* Folder structure - Find a structure for best matching local dev and CI env

What took time:
* Trying to remove phantom Amplify app
* Change repo and path for multi-repo
* Force push on master made it break

Errors:
* There was an issue connecting to your repo provider, click "Reconnect repository" in General Settings, and then try your build again.
* Module not found: Error: Can't resolve './aws-exports' in '/codebuild/output/src049202397/src/demo-amplify-blue/src'

Warnings:
* [https://docs.amplify.aws/guides/hosting/nextjs/q/platform/js/#prerequisites](https://docs.amplify.aws/guides/hosting/nextjs/q/platform/js/#prerequisites)
* Lots of deprecated and security warnings from build and setup

## Build Settings
If you change from mono- to multi-repo, or react to nextjs, you might need to change ```baseDirectory``` and ```appRoot``` in the Build Settings to reflect the change.

AWS Amplify -> App Settings -> Build settings
```yaml
version: 1
applications:
  - frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
    appRoot: 
```

## Toolchain
Some AWS Amplify toolchain commands:

### amplify
Used to configure AWS resources.

Install and configure for use:
```
npm install -g @aws-amplify/cli

amplify configure
```

```
Status:
amplify status

User status:
amplify user status

Add Authentication:
amplify add auth

Add API:
amplify add api

Continue working on another machine:
amplify pull --appId <appid> --envName dev
```
## amplifyPush.sh
* [https://github.com/aws-amplify/amplify-hosting/tree/main/scripts](https://github.com/aws-amplify/amplify-hosting/tree/main/scripts)

## Amplify UI
* [https://ui.docs.amplify.aws/components/authenticator](https://ui.docs.amplify.aws/components/authenticator)

## Services
![Amplify](amplify.png)

