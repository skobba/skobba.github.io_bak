# Indexes

## Search
> curl http://elasticsearch:9200/_cat/indices/index-*?pretty

## View ILM Status for indexes
```
curl elasticsearch:9200/log-*/_ilm/explain | jq
```

