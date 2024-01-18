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
1. Install nvm: 
    brew install nvm
2. Set correct node version: 
    nvm use 20.10.0
3. Activate corepack (node v16 or later):
    corepack enable
4. Set correct npm version:
    corepack prepare npm@10.2.3
4. Set correct pnpm version:
    corepack prepare pnpm@8.11.0
EOF
```
