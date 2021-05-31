# IML
## Status
> curl elasticsearch:9200/_ilm/status

## View Policies
> curl http://elasticsearch:9200/_ilm/policy

## View Policy
> curl http://elasticsearch:9200/_ilm/policy/2days

## Create Policy
```
curl -X PUT "http://elasticsearch:9200/_ilm/policy/2days" -H 'Content-Type: application/json' -d'
{
  "policy": {
    "phases": {
      "hot": {
        "min_age": "0ms",
        "actions": {
          "rollover": {
            "max_size": "50gb",
            "max_age": "2d"
          }
        }
      },
      "delete": {
        "min_age": "2d",
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
> curl elasticsearch:9200/_template

Only top level keys
> curl elasticsearch:9200/_template | jq '. |= keys'

## Creating or Applying a policy to an index template
```
curl -X PUT "elasticsearch:9200/_template/2days?pretty" -H 'Content-Type: application/json' -d'
{
  "index_patterns": ["someindex-*"], 
  "settings": {
    "index.lifecycle.name": "2days"
  }
}
'
```

## Delete Template
> curl -X DELETE elasticsearch:9200/_template/templatetodelete
