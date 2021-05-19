# ElasticSearch

## Red or Yellow Status
> https://aws.amazon.com/premiumsupport/knowledge-center/elasticsearch-red-yellow-status/

### List the unassigned shard
> curl -XGET 'ES_Endpoint/_cat/shards?h=index,shard,prirep,state,unassigned.reason' | grep UNASSIGNED

### Retrieve the details for why the shard is unassigned
> curl -XGET 'ES_Endpoint/_cluster/allocation/explain?pretty' -H 'Content-Type:application/json' -d'{"index": "<index name>", "shard": <shardId>, "primary":<true or false>}'

### For red cluster status, delete the indices of concern and identify and address the root cause
> curl -XDELETE 'ES_Endpoint/<index names>'

### Then, identify the available snapshots and restore your indices from a snapshot
> curl -XGET 'elasticsearch-domain-endpoint/_snapshot?pretty'
