# GraphQL

source: `{{ page.path }}`
## Query
```
const USERS = gql`
  {
    users {
      name
      email
      user_id
    }
  }
`;

const { loading, error, data } = useQuery(USERS);
```

## Mutation
```
mutation CreateReviewForEpisode($name: String!, $email: String!, $password: String!) {
  createUser(name: $name, email: $email, password: $password)
}


{
  "name": "Gjermund Skobba",
  "email": "gjermund@skobba.net",
  "password": "dontShareThis1234!"
}
```
