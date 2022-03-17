# ESLint
A good ESLint Config helps avoid mistakes that are hard to debug like cyclic imports and shadow variablers, it also prevent unnecessary code like unnecessary use of try/catch. And last but not least, it makes the code look nice with propper indends, correct quotes etc.

It still stands between: eslint-config-airbnb vs. eslint-config-google vs. standard

* [Comparing] (https://npmcompare.com/compare/eslint-config-airbnb,eslint-config-google,standard)

Eslint-Config-Airbnb has more daily downloads, more weekly downloads, more monthly downloads, more stars on Github, more followers on Github and more forks.

## Airbnb ESLint Config
```
npm i -D eslint-config-airbnb eslint-plugin-import
```

## Complete Typescript w/ React Config
npm install
```
npm i \
eslint \
eslint-config-prettier \
eslint-plugin-import \
eslint-plugin-jsx-a11y \
eslint-plugin-prefer-arrow \
eslint-plugin-prettier \
eslint-plugin-react \
eslint-plugin-react-hooks \
@typescript-eslint/eslint-plugin \
@typescript-eslint/parser
    
```

.eslintrc
```json
{
  "extends": [
    "prettier",
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended",
    "plugin:@typescript-eslint/eslint-recommended",
    "plugin:@typescript-eslint/recommended"
  ],
  "parser": "@typescript-eslint/parser",
  "plugins": ["jsx-a11y", "react", "react-hooks", "prettier", "prefer-arrow"],
  "settings": {
    "react": {
      "version": "17"
    }
  },
  "root": true,
  "env": {
    "browser": true,
    "es6": true
  },
  "rules": {
    "prettier/prettier": [
      "error",
      {
        "semi": true,
        "singleQuote": true,
        "printWidth": 120,
        "tabWidth": 2
      }
    ],
    "arrow-body-style": ["error", "as-needed"],
    "prefer-arrow/prefer-arrow-functions": [
      "warn",
      {
        "disallowPrototype": true,
        "singleReturnOnly": false,
        "classPropertiesAllowed": false
      }
    ],
    "comma-dangle": [0, "never"],
    "@typescript-eslint/no-var-requires": 0,
    "no-undef": 0,
    "no-unused-vars": "off",
    "@typescript-eslint/no-unused-vars": ["error"],
    "@typescript-eslint/explicit-module-boundary-types": "off",
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn",
    "react/prop-types": "off"
  }
}
```

## Run Rules
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

## Print Config
```
npx eslint --print-config ./src/components/Counter.tsx
```

## Get errors from eslint
```
npm run lint | sed -r 'S/^.error.\s(.*)$/\1/g' | sort | uniq
```
