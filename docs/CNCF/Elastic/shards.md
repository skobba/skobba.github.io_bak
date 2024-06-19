# Shards
## List Unassigned
```
curl -XGET http://elasticsearch:9200/_cat/shards?h=index,shard,prirep,state,unassigned.reason > shards.list ; cat shards.list | grep UNASSIGNED
```
## Count
```
curl -XGET http://elasticsearch:9200/_cat/shards | grep UNASSIGNED | wc -l
```

## Delete Unassigned
```
curl -XGET http://elasticsearch:9200/_cat/shards | grep UNASSIGNED | awk {'print $1'} | xargs -i curl -XDELETE "http://elasticsearch:9200/{}"
```

