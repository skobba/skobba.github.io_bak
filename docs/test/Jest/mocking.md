# Mocking
Ref.: [https://vhudyma-blog.eu/3-ways-to-mock-axios-in-jest/](https://vhudyma-blog.eu/3-ways-to-mock-axios-in-jest/)

## jest.mock
```
jest.mock('./api.js', () => ({
  ...jest.requireActual('./api.js'),
  fetchData: jest.fn(() => { status: 404}),
  getRandom: jest.fn(() => 10),
}));
```
## axios-mock-adapter
axios.create() doesn't work with axios-mock-adapter directly because axios-mock-adapter requires an instance of Axios to be passed to it in order to intercept requests.

When you use axios.create(), you're creating a new instance of Axios, separate from the global Axios instance. This means that when you pass the Axios instance created with axios.create() to axios-mock-adapter, it's intercepting requests made with that particular instance.

## axios-retry
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

