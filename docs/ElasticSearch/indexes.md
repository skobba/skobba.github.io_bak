# Indexes

## Search
> curl http://elasticsearch:9200/_cat/indices/index-*?pretty

> curl http://elasticsearch:9200/_cat/indices/*2020*?s=index

## View ILM Status for indexes
```
curl elasticsearch:9200/log-*/_ilm/explain | jq
```

## Aliases
> curl elasticsearch:9200/_cat/aliases?v
