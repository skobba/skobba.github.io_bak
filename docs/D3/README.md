# D3
* [d3indepth.com](https://www.d3indepth.com/introduction/)
* [React and D3 together](https://www.youtube.com/watch?v=zXBdNDnqV2Q)
* [https://github.com/d3/d3/wiki/Gallery](https://github.com/d3/d3/wiki/Gallery)

## Enter, Update and Exit
Ref.: [https://www.d3indepth.com/enterexit](https://www.d3indepth.com/enterexit)
```
.join(
  function(enter) {
    ...
  },
  function(update) {
    ...
  },
  function(exit) {
    ...
  }
)
```

```js
.join(
  function(enter) {
    return enter.append('circle');
  }
)
```

This is equivalent to:
```js
.join('circle')
```
