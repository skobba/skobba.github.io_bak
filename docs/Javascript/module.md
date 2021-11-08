# Module

## ES5
```
// add.js
var add = function (a,b) {
  return a + b;
};
module.exports = add;
// output.js
var add = require(‘./add.js’);
console.log(add(2,2)); // 4;
```

References by name
```
// math.js
var add = function (a,b) {
  return a + b;
};
module.exports.add = add;
var multiply = function (a,b) {
  return a + b;
};
module.exports.multiply = multiply;
// output.js
var add = require(‘./math.js’).add;
var multiply = require(‘./math.js’).multiply;
```

## ES6
```
// math.js
const add = (a,b) => {
  return a + b;
};
export default add;

const addTwo = (a) => {
  return add(2, a);
};
export addTwo;

// output.js
import add, { addTwo } from ‘./math.js’;
console.log(add(2,2) === addTwo(2)); // true
```
