# fetch-mock
Mocks HTTP requests made by client-side JavaScript code in a JSDOM environment.

```js
const fetchMock = require('fetch-mock');

describe('YourTestSuite', () => {
  beforeAll(() => {
    fetchMock.mock('http://example.com/data', { some: 'data' });
  });

  afterAll(() => {
    fetchMock.restore();
  });

  it('should test something', async () => {
    // Your test code that makes a fetch request to http://example.com/data
    const response = await fetch('http://example.com/data');
    const data = await response.json();
    
    expect(data).toEqual({ some: 'data' });
  });
});
```
