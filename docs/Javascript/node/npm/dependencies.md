# Dependencies
Direct vs Transitive:
```
┌─────────────┐       ┌──────────┐      ┌────────────┐
│             │       │          │      │            │
│  MyPackage  ├───────►  Direct  ├──────► Transitiv  │
│             │       │          │      │            │
└─────────────┘       └──────────┘      └────────────┘
```
## dependencies
Direct dependencies.

## devDependencies
Dependencies needed for building.

## peerDependencies
Usually used for plugins like "react-redux" and "redux-thunk" to express the compatibility of your package with a host tool or library, like "react" and "redux".

In npm versions 3 through 6, peerDependencies were not automatically installed, and would raise a warning if an invalid version of the peer dependency was found in the tree. As of npm v7, peerDependencies are installed by default.

Trying to install another plugin with a conflicting requirement may cause an error if the tree cannot be resolved correctly. For this reason, make sure your plugin requirement is as broad as possible, and not to lock it down to specific patch versions.

Get info

    npm info "eslint-config-airbnb@latest" peerDependencies

Install peerDeps

    npx install-peerdeps --dev eslint-config-airbnb

## bundledDependencies
This defines an array of package names that will be bundled when publishing the package

    npm pack

## optionalDependencies
Dependencies that don’t necessarily need to be installed. If a dependency can be used, but you would like npm to proceed if it cannot be found or fails to install, then you may put it in the optionalDependencies object.

    npm install someDependency --save-optional

    npm ci --omit-optional

