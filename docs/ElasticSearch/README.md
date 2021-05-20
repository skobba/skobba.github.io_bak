# ElasticSearch
Elastic Stack: Indexes, Shards, and Replicas

Data in Elasticsearch is organized into indices. Each index is made up of one or more shards. Each shard is an instance of a Lucene index, which you can think of as a self-contained search engine that indexes and handles queries for a subset of the data in an Elasticsearch cluster.

## Ref
> https://www.datadoghq.com/blog/elasticsearch-unassigned-shards/

## Nodes
> curl http://loalhost:9200/_cat/nodes?v

## Health Check
> curl http://server/_cat/health
> curl http://server/_cat/indices?v

## Set replica set to 0
> curl -XPUT "elasticsearch:9200/_all/_settings?pretty" -H 'Content-Type: application/json' -d' { "number_of_replicas": 0 }'

## Red or Yellow Status
> https://aws.amazon.com/premiumsupport/knowledge-center/elasticsearch-red-yellow-status/

List the unassigned shard
```
curl -XGET 'ES_Endpoint/_cat/shards?h=index,shard,prirep,state,unassigned.reason' | grep UNASSIGNED
```

Retrieve the details for why the shard is unassigned
> curl -XGET 'ES_Endpoint/_cluster/allocation/explain?pretty' -H 'Content-Type:application/json' -d'{"index": "<index name>", "shard": <shardId>, "primary":<true or false>}'

For red cluster status, delete the indices of concern and identify and address the root cause
> curl -XDELETE 'ES_Endpoint/<index names>'

Then, identify the available snapshots and restore your indices from a snapshot
> curl -XGET 'elasticsearch-domain-endpoint/_snapshot?pretty'
