# IML

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
