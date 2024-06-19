## Mutation
```
mutation CreateReviewForEpisode($name: String!, $email: String!, $password: String!) {
  createUser(name: $name, email: $email, password: $password)
}


{
  "name": "Gjermund Skobba",
  "email": "gjermund@skobba.net",
  "password": "supersecret"
}
```
