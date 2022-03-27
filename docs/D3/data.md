# Data
Normal distribution:
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