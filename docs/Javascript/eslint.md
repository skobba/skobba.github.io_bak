# ESLint
## Airbnb ESLint Config
```
npm i -D eslint-config-airbnb eslint-plugin-import
```

##  Rules
Run no-unused-vars
```bash
npx eslint ./src --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{no-unused-vars: error}"
```

Run prefer-arrow-functions
```bash
npx eslint ./src --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --plugin "prefer-arrow" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{prefer-arrow/prefer-arrow-functions: error}"
```

Run explicit-function-return-type
```bash
npx eslint ./src --ext .ts,.tsx,.js,.jsx --no-eslintrc --parser "@typescript-eslint/parser" --plugin "@typescript-eslint" --env "es6" --env "node" --parser-options "{ecmaVersion: 2018}" --rule "{@typescript-eslint/explicit-function-return-type: error}"
```

## Typescript Rules
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



