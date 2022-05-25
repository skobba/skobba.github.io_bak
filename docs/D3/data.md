# Data

## Generate Normal distribution
```js
import * as d3 from 'd3';
// Ref.: https://github.com/d3/d3-random/blob/main/README.md#randomNormal

export const generateData = () => {
  var mean = 20;
  var stdDeviation = 5;
  var numberOfDataPoints = 1000;
  // Generate a 1000 data points using normal distribution with mean=20, deviation=5
  var normalDistributionFunction = d3.randomNormal(mean, stdDeviation);
  var actualData = d3.range(numberOfDataPoints).map(normalDistributionFunction);

  return actualData;
};
```

## Convert Hierarchy Data to Links and Nodes
```js
const root = d3.hierarchy(data);
const links = root.links();
const nodes = root.descendants();
```

Structure:
```js
const family = d3.hierarchy({
  name: "root",
  children: [
    { name: "child #1" },
    {
      name: "child #2",
      children: [
        { name: "grandchild #1" },
        { name: "grandchild #2" },
        { name: "grandchild #3" }
      ]
    }
  ]
});

console.log("family: ", family.descendants());
```
    
