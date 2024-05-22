# bash

Multi line variable
```
MYJSON=$(cat <<EOF
{
  "displayName": "Gjermund Skobba",
  "dob": null,
  "stuff": null
}
EOF
)
```

Multi-line into file:
```
cat >>~/somescript.sh<<EOF
#!/bin/bash
echo "some script"
EOF
```

Copy files and flattening folder structure
```
find ./src -iname '*.tgz' -exec cp \{\} ./dest/ \;
```

Remove double quotes
```
MYVAR='"Variable with double quotes"'

MYVAR=$(sed -e 's/^"//' -e 's/"$//' <<<"$MYVAR")
```

Result of last run command
```
$?
```

Standard output/error
* File descriptor 1 is the standard output (stdout)
* File descriptor 2 is the standard error (stderr)

```
g++ lots_of_errors 2>&1
```

For loop with curl
```sh
for i in {1..1000}; do
    curl --max-time 1 https://skobba.net
    sleep 1
done
```
