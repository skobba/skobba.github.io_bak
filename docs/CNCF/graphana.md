# Graphana
"Grafana is the open source analytics & monitoring solution for every database." A visual representation of data for analysis and monitoring.

## Prometheus
*Prometheus is an open-source systems monitoring and alerting toolkit originally built at SoundCloud.*

[https://prometheus.io/](https://prometheus.io/)

## Export to png
Dashboard url: http://10.10.9.163:3000/d-solo/sW2JgnRgk/temp

Format:
```
curl 'DASHBOARD_URL?orgId=1&from=1514764800000&to=1546300800000&panelId=4&width=1000&height=500&tz=Europe%2FZurich' -o 4.png
```

Example:
```
curl 'http://admin:admin@10.10.9.163:3000/d-solo/sW2JgnRgk/temp?orgId=1&from=1666502407844&to=1666524007844&panelId=2' -o 5.png

http://10.10.9.163:3000/d-solo/sW2JgnRgk/temp?orgId=1&from=1666502407844&to=1666524007844&panelId=2


curl 'http://admin:admin@10.10.9.163:3000/d-solo/sW2JgnRgk/temp?orgId=1&from=1514764800000&to=1546300800000&panelId=4&width=1000&height=500&tz=Europe%2FZurich' -o 4.png
```


