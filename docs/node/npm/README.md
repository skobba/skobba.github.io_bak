# npm
Compare and see trends: [https://www.npmtrends.com/classnames-vs-clsx-vs-styled-components](https://www.npmtrends.com/classnames-vs-clsx-vs-styled-components)

## Dependencies
Direct vs Transitive:
```
┌─────────────┐       ┌──────────┐      ┌────────────┐
│             │       │          │      │            │
│  MyPackage  ├───────►  Direct  ├──────► Transitiv  │
│             │       │          │      │            │
└─────────────┘       └──────────┘      └────────────┘
```
### dependencies
Direct dependencies.

### devDependencies
Dependencies needed for building.

### peerDependencies
Usually used for plugins like "react-redux" and "redux-thunk" to express the compatibility of your package with a host tool or library, like "react" and "redux".

In npm versions 3 through 6, peerDependencies were not automatically installed, and would raise a warning if an invalid version of the peer dependency was found in the tree. As of npm v7, peerDependencies are installed by default.

Trying to install another plugin with a conflicting requirement may cause an error if the tree cannot be resolved correctly. For this reason, make sure your plugin requirement is as broad as possible, and not to lock it down to specific patch versions.

Get info

    npm info "eslint-config-airbnb@latest" peerDependencies

Install peerDeps

    npx install-peerdeps --dev eslint-config-airbnb

### bundledDependencies
This defines an array of package names that will be bundled when publishing the package

    npm pack

### optionalDependencies
Dependencies that don’t necessarily need to be installed. If a dependency can be used, but you would like npm to proceed if it cannot be found or fails to install, then you may put it in the optionalDependencies object.

    npm install someDependency --save-optional

    npm ci --omit-optional


## Scope
A scope allows you to create a package with the same name as a package created by another user or organization without conflict.

When listed as a dependent in a package.json file, scoped packages are preceded by their scope name. The scope name is everything between the @ and the slash:

    @skobba/package-name

Visibillity:
* Unscoped packages are always public.
* Private packages are always scoped.
* Scoped packages are private by default; you must pass a command-line flag when publishing to make them public.

## Semantic version
Semver Calculator: [https://semver.npmjs.com](https://semver.npmjs.com)

Table w/ Backus-Naur form:

| Semver        | Versions      |
| ------------- |-------------|
| version      | Exact version |
|^version|"Approximately equivalent to version (minor)" ^1.2.3 := >=1.2.3 <2.0.0-0|
|~version|"Compatible with version (patch)" ~1.2.3 := >=1.2.3 <1.(2+1).0 := >=1.2.3 <1.3.0-0|

## List packages
    npm ls
    npx npm-leech

## Audit packages
npm audit
```
npm audit fix --force
```

## Update packages
Discover outdated packages w/ npm-check-updates (-u updates package.json)
```
npx npm-check-updates -u

or 

npx ncu -u
```

Discover outdated packages w/ npm
```
npm outdated
```

Update one package to latest w/ npm
```
npm update react --depth 6
```

Update one package to the latest w/ npm
```
npm install react@latest
```

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

