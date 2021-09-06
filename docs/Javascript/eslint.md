# ESLint

## Run one rule (no-unused-vars)
```bash
npx eslint . --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{no-unused-vars: error}"
```

## Nice Rules
### eslint-plugin-prefer-arrow
Ref.: [eslint-plugin-prefer-arrow](https://www.npmjs.com/package/eslint-plugin-prefer-arrow)


## Typescript
Access typescript rules:
```
{
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint"],
  "rules": {
    "@typescript-eslint/rule-name": "error"
  }
}
```



