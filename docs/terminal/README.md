# Terminal
## Open Finder from terminal
```open .```

## cp
- Copy with permissions ```cp -au ./data ./data.bk```

## rsync
- ```rsync -a theuser@host:/home/theuser/thefile.txt ./```

## scp
- ```scp theuser@host:/home/theuser/thefile.txt ./```

## watch
```
watch kubectl get pods -n kube-system
```

## jq
```
echo '[{"username":"user1"},{"username":"user2"}]' | jq '. | length'

echo '[{"username":"user1"},{"username":"user2"}]' | jq '.[] | .username'


myjson='[
  {
    "name": "apple",
    "color": "green",
    "price": 1.2
  },
  {
    "name": "banana",
    "color": "yellow",
    "price": 0.5
  },
  {
    "name": "kiwi",
    "color": "green",
    "price": 1.25
  }
]'

echo $myjson | jq '.[] | .name'
```

## regex
Extract the text in group (1)

    echo "kmaster180"|sed -r 's/([a-z]*)([0-9]*)/\1/g'

Extract the number group (2)
    
    echo "kmaster180"|sed -r 's/([a-z]*)([0-9]*)/\2/g'
