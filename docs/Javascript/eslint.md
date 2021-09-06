# ESLint

## Run one rule
### no-unused-vars
```bash
npx eslint . --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{no-unused-vars: error}"
```

### prefer-arrow-functions
```bash
npx eslint . --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --plugin "prefer-arrow" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{prefer-arrow/prefer-arrow-functions: error}"
```

### explicit-function-return-type
```bash
npx eslint ./src --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --plugin "@typescript-eslint" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{@typescript-eslint/explicit-function-return-type: error}"
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



