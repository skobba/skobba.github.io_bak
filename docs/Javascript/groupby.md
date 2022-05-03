# groupBy
```js

var groupBy = function(xs, key) {
  return xs.reduce(function(rv, x) {
    (rv[x[key]] = rv[x[key]] || []).push(x);
    return rv;
  }, {});
};


const nodes = [
  { id: 1, level: 1, r: 8 },
  { id: 2, level: 2, r: 8 },
  { id: 3, level: 2, r: 8 },
  { id: 4, level: 2, r: 8 },
  { id: 5, level: 3, r: 8 },
  { id: 6, level: 3, r: 8 },
  { id: 7, level: 3, r: 8 },
  { id: 8, level: 3, r: 8 },
  { id: 9, level: 3, r: 8 },
  { id: 10, level: 3, r: 8 },
  { id: 11, level: 4, r: 8 },
  { id: 12, level: 4, r: 8 },
  { id: 13, level: 4, r: 8 },
  { id: 14, level: 4, r: 8 },
  { id: 15, level: 4, r: 8 },
  { id: 16, level: 4, r: 8 },
];

console.log(groupBy(nodes, 'level'));
```
