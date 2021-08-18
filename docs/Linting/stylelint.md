# stylelint
Lint your css.

> https://stylelint.io/user-guide/get-started/


> npm install --save-dev stylelint stylelint-config-standard

Create a .stylelintrc.json configuration file in the root of your project:
```
{
  "extends": "stylelint-config-standard"
}
```

Run stylelint on, for example, all the CSS files in your project:
> npx stylelint "**/*.css"
