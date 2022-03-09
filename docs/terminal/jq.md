# jq

***Simple use***
```
echo '[{"username":"user1"},{"username":"user2"}]' | jq '. | length'

echo '[{"username":"user1"},{"username":"user2"}]' | jq '.[] | .username'
```

***Simple use***
```
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

***Merge objects and create array***
```
cat packages.json | jq '.dependencies * .devDependencies | to_entries[]'
```
