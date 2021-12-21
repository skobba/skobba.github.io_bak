# Jekyll

## raw

Temporarily disables tag processing. This is useful for generating certain content that uses conflicting syntax, such as Mustache or Handlebars.

```
{% raw %}
In Handlebars, {{ this }} will be HTML-escaped, but {{{ that }}} will not.
{% endraw %}
```