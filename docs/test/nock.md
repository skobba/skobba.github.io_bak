# nock
Using both Nock and Axios Mock Adapter together in the same project is typically not necessary and can lead to confusion and redundancy. Both tools are designed to intercept and mock HTTP requests, but they do so in slightly different ways and are often used in different contexts.

1. Nock: Nock is a powerful HTTP server mocking and expectations library for Node.js. It allows you to intercept HTTP requests and provide predefined responses. Nock is particularly useful for testing Node.js server applications or any JavaScript code running in a Node.js environment.
2. Axios Mock Adapter: This library is specifically designed to work with Axios, a popular promise-based HTTP client. Axios Mock Adapter allows you to intercept requests made by Axios and return mocked responses. It's typically used in the context of front-end development where Axios is used to make HTTP requests.

Reasons to choose one over the other:
* If you are using Axios for your HTTP requests and you're specifically looking to test those requests, Axios Mock Adapter might be the more straightforward choice.
* If you need to mock HTTP requests more generally and are not tied to Axios, or if you're working in a Node.js environment, Nock might be more appropriate.
Using them together: If you use both in the same project, you might end up with confusing and potentially conflicting configurations where both tools try to intercept the same HTTP requests. This can make your tests more complex and harder to maintain.

However, there might be rare cases where you want to use both, for example, if you have a large existing codebase where one part uses Axios (and thus Axios Mock Adapter) and another part makes HTTP requests differently (where Nock could be useful). In such cases, careful configuration and clear separation of their usage are crucial to avoid conflicts and ensure that mocks are predictable and understandable.
In most scenarios, it's best to choose the tool that aligns with your tech stack and testing needs and stick with it across your codebase to maintain consistency and clarity in your testing approach.

## Sample Jest Test
__NB: Use testEnvironment: 'node'__

_If you use testEnvironment: 'jsdom', you're specifying that your tests should run in a JSDOM environment. However, nock works by intercepting HTTP requests at the Node.js level. In the JSDOM environment, requests made by client-side JavaScript code are not intercepted by nock, because JSDOM simulates the browser environment where requests are handled by the browser, not by Node.js._

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
