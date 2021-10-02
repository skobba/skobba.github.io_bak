# Terminal
## cp
- Copy with permissions ```cp -a ./data ./data.bk```

## rsync
- ```rsync -a theuser@host:/home/theuser/thefile.txt ./```

## scp
- ```scp theuser@host:/home/theuser/thefile.txt ./```

# jq
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
