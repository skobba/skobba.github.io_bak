# npm link
> ls -la /usr/local/lib/node_modules

> sudo chown -R [owner]:[owner] /usr/local/lib/node_modules

1. Run "npm link" in lib-project
2. Run "npm link lib-project" in app-project

```
sudo chown -R gjermund.skobba: /usr/local/lib/node_modules
sudo chown -R $USER /usr/local/lib/node_modules
sudo chown -R gjermund.skobba /usr/local/lib/node_modules
```
