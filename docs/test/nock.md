# nock
__NB: Use testEnvironment: 'jsdom'__

_When you use testEnvironment: 'jsdom', you're specifying that your tests should run in a JSDOM environment. However, nock works by intercepting HTTP requests at the Node.js level. In the JSDOM environment, requests made by client-side JavaScript code are not intercepted by nock, because JSDOM simulates the browser environment where requests are handled by the browser, not by Node.js._

Testing of axios-retry with nock:
```js
import { fetchBlueData } from '../bff/api/blue';
import nock from 'nock';


describe('blue', () => {
  nock('http://localhost:8001').get('/message').reply(200, { message: 'Message from blue mock' })

  it('should fetch data successfully on first attempt', async () => {
    const res = await fetchBlueData();
    expect(res.status).toBe(200);
  });
});

describe('blue-retry', () => {
  nock('http://localhost:8001').get('/message').replyWithError('500');
  nock('http://localhost:8001').get('/message').replyWithError('500');
  nock('http://localhost:8001').get('/message').reply(200, { message: 'Message from blue mock' })

  it('should retry three times', async () => {

    const res = await fetchBlueData(); // 200

    expect(res.status).toBe(200);
    expect(res.config['axios-retry'].retryCount).toBe(2);
  });
});
```
