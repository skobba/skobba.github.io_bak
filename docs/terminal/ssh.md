# ssh

## Run script w/ args remotly
Script:
```bash
cat <<EOF >> ./arg1.sh
#!/bin/bash

echo "Hostname $(hostname)"
echo "Argument 1: $1"
echo "Arguments:"
printf ' Argument is __%s__\n' "$@"
EOF
```

Command
```
ssh root@10.10.2.100 'cat | bash /dev/stdin arg1' < printArg1.sh
```
