## Query
```
import { useQuery, gql } from '@apollo/client';

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

