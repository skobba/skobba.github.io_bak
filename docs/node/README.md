# Node
Install with ```brew install node```

## Install nvm, node, npm, pnpm

```sh
#!/bin/sh

# Writes the current verions of nvm, node and npm

# NB: nvm needs to load the env vars with the dot "."

# Run from shell with dot:
# zsh> . ./toolverions.sh


filename=toolversions.txt

echo Tool versions: > $filename
echo " " >> $filename

echo "nvm:  $(nvm -v)" >> $filename
echo "node: $(node --version)" >> $filename
echo "npm:  $(npm --version)" >> $filename
echo "pnpm: $(pnpm --version)" >> $filename

cat toolversions.txt
echo 

cat <<EOF
Set correct versions of nvm, node, npm and pnpm.

# Install nvm
brew install nvm

# Node version
nvm use

# Activate corepack (node v16 or later)
corepack enable

# Set correct npm version
corepack prepare npm@10.2.3 --activate

# Set correct pnpm version
corepack prepare pnpm@8.11.0 --activate
EOF
```
