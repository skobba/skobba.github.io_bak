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

Remove double quotes
```
MYVAR='"Variable with double quotes"'

MYVAR=$(sed -e 's/^"//' -e 's/"$//' <<<"$MYVAR")
```
