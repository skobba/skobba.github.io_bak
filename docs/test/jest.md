# Jest
## Basic
List tests

    jest --listTests
    
Run single test

    jest ./path/to/some.test.js

Run single test (CRA):

    npm test -- -t 'test-name'

Run in Jenkins (ci)

    jest --ci --watchAll=false --reporters=default --reporters=jest-junit

## Mocking
* jest.mock("axios") would mock the entire module
* jest.mock("axios") could interfere with the jest.spyOn(axios, "get"); call.

### jest.mock
```
jest.mock('./api.js', () => ({
  ...jest.requireActual('./api.js'),
  fetchData: jest.fn(() => { status: 404}),
  getRandom: jest.fn(() => 10),
}));
```

### axios-retry
```js
const axios = require('axios');
const axiosRetry = require('axios-retry').default;

axiosRetry(axios, {
  retries: 3,
  retryDelay: (...arg) => axiosRetry.exponentialDelay(...arg, 1000),
  retryCondition(error) {
    switch (error.response.status) {
      //retry only if status is 500 or 501
      case 500:
      case 501:
        return true;
      default:
        return false;
    }
  },
  onRetry: (retryCount, error, requestConfig) => {
    console.log(`retry count: `, retryCount);
    if (retryCount == 2) {
      requestConfig.url = 'https://postman-echo.com/status/200';
    }
  },
});

(async () => {
  try {
    const res = await axios.get('https://postman-echo.com/status/500');
    console.log(`inside async:`, res.status);
  } catch (err) {
    console.error(`Error occurred: `, err.message);
  }
})();
```

