# fetch
Basic
```
fetch('http://localhost:3000/secure')
  .then(function() {
    console.log('ok');
  }).catch(function() {
    console.log('error');
  });
```

Check status code
```
fetch('http://localhost:3000/secure', { 
  method: 'get', 
  headers: new Headers({
    'Content-Type': 'application/x-www-form-urlencoded'
  })
}).then((response) => {
  console.log(response);
  if (response.status === 401) throw new Error('Got an unauthenticated 401');
  
  let resJSON = response.json();
  if (!response.ok) {
    throw Error(resJSON.message);
  }

  console.log(response.json());
})
```
