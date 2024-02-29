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
