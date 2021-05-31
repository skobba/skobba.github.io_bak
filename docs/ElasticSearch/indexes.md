# Indexes

## Search
> curl http://elasticsearch:9200/_cat/indices/my*?pretty

> curl http://elasticsearch:9200/_cat/indices/*2020*?s=index

## View ILM Status for indexes
```
curl elasticsearch:9200/my*/_ilm/explain | jq
```

## Aliases
### View
> curl elasticsearch:9200/_cat/aliases?v

## Update Alias
> curl -XPUT http://elasticsearch:9200/myindex/_alias/myalias

## Delete
> curl -XDELETE http://elasticsearch:9200/myindex/_alias/myalias
