# Health Check
Ref.: [https://learn.microsoft.com/en-us/azure/container-apps/health-probes?tabs=yaml](https://learn.microsoft.com/en-us/azure/container-apps/health-probes?tabs=yaml)

## Probes
* Startup: __Checks if your application has successfully started. This check is separate from the liveness probe and executes during the initial startup phase of your application.__
* Liveness: __Checks if your application is still running and responsive.__
* Readiness: __Checks to see if a replica is ready to handle incoming requests.__

## Example Liveness Endpoint
```js
const express = require('express');
const app = express();

app.get('/liveness', (req, res) => {
  let isSystemStable = false;
  
  // check for database availability
  // check filesystem structure
  //  etc.

  // set isSystemStable to true if all checks pass

  if (isSystemStable) {
    res.status(200); // Success
  } else {
    res.status(503); // Service unavailable
  }
})
```
