# Settings

Setting can be placed in ```~/Library/Application Support/Code/User/settings.json``` for VS Code User Settings or ```vscode/settings.json``` in repo for project/repo.

```
{
    "git.allowForcePush": true,
    "git.confirmForcePush": false,
    "git.enableSmartCommit": true,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "eslint.validate": [
        {
            "language": "html",
            "autoFix": true
        },
        {
            "language": "vue",
            "autoFix": true
        },
        {
            "language": "javascript",
            "autoFix": true
        },
        {
            "language": "typescript",
            "autoFix": true
        },
        {
            "language": "javascriptreact",
            "autoFix": true
        },
        {
            "language": "typescriptreact",
            "autoFix": true
        }
    ],
    "editor.formatOnSave": false,
    "editor.codeActionsOnSave": {
        "source.fixAll.eslint": true
    },
    "explorer.confirmDelete": false,
    "liveshare.authenticationProvider": "GitHub",
    "redhat.telemetry.enabled": false,
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "security.workspace.trust.untrustedFiles": "newWindow",
    "explorer.confirmDragAndDrop": false,
}
```
