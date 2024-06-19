# pnpm

_Since v16.13, Node.js is shipping Corepack for managing package managers._

## Install using corepack
If you installed Node.js using Homebrew:
```
brew install corepack
```

If you have installed Node.js with pnpm env Corepack won't be installed on your system, you will need to install it separately.
```
corepack enable
```

Specific version:
```
corepack prepare pnpm@<version> --activate
corepack prepare pnpm@latest --activate
```

### Install using npm
```
npm install -g pnpm@8.14.1
```
