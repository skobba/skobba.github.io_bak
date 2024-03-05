# Basic
List tests

    jest --listTests
    
Run single test

    jest ./path/to/some.test.js

Run single test (CRA):

    npm test -- -t 'test-name'

Run in Jenkins (ci)

    jest --ci --watchAll=false --reporters=default --reporters=jest-junit