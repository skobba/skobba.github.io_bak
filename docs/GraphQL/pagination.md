# Pagination
* [Pagination at slack](https://slack.engineering/evolving-api-pagination-at-slack/)
* [GraphQL Cursor Connections Specification](https://relay.dev/graphql/connections.htm)
* [Explaining GraphQL Connections](https://www.apollographql.com/blog/explaining-graphql-connections-c48b7c3d6976/)
## Offsets
Using offsets to paginate data is one of the most widely used techniques for pagination. Clients provide a parameter indicating the number of results they want per page, count, and a parameter indicating the page number they want to return results for, page. The server then uses these parameters to calculate the results for the specific page being requested.
## Cursors
Cursor-based pagination works by returning a pointer to a specific item in the dataset. On subsequent requests, the server returns results after the given pointer. This method addresses the drawbacks of using offset pagination, but does so by making certain trade offs:

* The cursor must be based on a unique, sequential column (or columns) in the source table.
* There is no concept of the total number of pages or results in the set.
* The client can’t jump to a specific page.

## Relay Cursor Connections
Relay is a framework for retrieving and caching data from a GraphQL server for a React application. It handles pagination in a really interesting way by allowing the client to paginate forward and backwards from any item returned in the collection.

# Demos
## SpaceX Pagination Sample
[Codesandbox](https://codesandbox.io/s/github-graphql-pagination-4dmew)

<iframe src="https://codesandbox.io/embed/spacex-pagination-demo-graphql-5v9gy?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="spacex-pagination-demo-graphql"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>

## Github Pagination Sample
[Codesandbox](https://codesandbox.io/s/spacex-pagination-demo-graphql-5v9gy)

<iframe src="https://codesandbox.io/embed/github-graphql-pagination-4dmew?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="github-graphql-pagination"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>


## Helper functions
From @apollo/client/utilities:
* concatPagination
* offsetLimitPagination
* relayStylePagination
