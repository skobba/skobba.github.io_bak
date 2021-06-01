# IML
## Status
> curl elasticsearch:9200/_ilm/status

## View Policies
> curl http://elasticsearch:9200/_ilm/policy

## View Policy
> curl http://elasticsearch:9200/_ilm/policy/2days

## Create Policy w/ 7 Days Retention Time
```
curl -X PUT "http://elasticsearch:9200/_ilm/policy/7days" -H 'Content-Type: application/json' -d'
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
        }
      },
      "delete": {
        "min_age": "7d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
'
```

## View Templates
```
curl elasticsearch:9200/_template

Only top level keys:
curl elasticsearch:9200/_template | jq '. |= keys'
or:
curl http://elasticsearch:9200/_cat/templates?v

```

## Creating or Update an Index Template Using the 7days Policy
```
curl -X PUT "http://elasticsearch:9200/_template/my-index-template" -H 'Content-Type: application/json' -d'
{
  "index_patterns": [
    "my-index-*"
    ],
  "settings": {
    "index.lifecycle.name": "7days"
  }
}
'
```

## Delete Template
> curl -X DELETE elasticsearch:9200/_template/templatetodelete

> curl elasticsearch:9200/datafangst-logs-utv-*/_ilm/explain
