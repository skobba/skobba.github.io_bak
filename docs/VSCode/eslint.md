# VS Code Setup ESLint

## VS Code Settings
Setup in ```.vscode/settings.json``` for project/repo or ```~/Library/Application Support/Code/User/settings.json``` for VS Code User Settings.

* Enable ESLint
* Disable Prettier

```json
{
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  ],
  "editor.formatOnSave": true,
  "eslint.format.enable": true,
  "prettier.requireConfig": true,
  "editor.defaultFormatter": "dbaeumer.vscode-eslint",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```
