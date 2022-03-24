# Apache
## React hostetd from Apache using a path ("/myapp/")

httpd.conf:
```
DocumentRoot "/var/www/html"

<Directory "/var/www/html/myapp">
    RewriteEngine On
    RewriteBase "/myapp/"
    RewriteRule ^index\.html$ - [L]
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-l
    RewriteRule . /myapp/index.html [L]
</Directory>
```

## AllowEncodedSlashed
Determines whether encoded path separators (```/```) in URLs are allowed to be passed through
```
DocumentRoot "/var/www/html"
AllowEncodedSlashed

<Directory "/var/www/html/myapp">
...
```

