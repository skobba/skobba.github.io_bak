# CORS
Cross-Origin Resource Sharing

## Plain requests
```
fetch('http://localhost:4000/json')
  .then(response => response.json())
  .then(data => console.log(data))
```

## Preflight request
```
fetch("http://localhost:4000", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en,nb;q=0.9,no;q=0.8,nn;q=0.7,en-US;q=0.6",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "cross-site"
  },
  "referrerPolicy": "same-origin",
  "body": null,
  "method": "OPTIONS",
  "mode": "cors",
  "credentials": "omit"
});
``` 
