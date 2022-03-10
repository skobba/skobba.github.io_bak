# CDN and HTML
```html
<!doctype html>
<html>
<head>
    <title>D3 Setup</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/6.2.0/d3.min.js" charset="utf-8"></script>
</head> 
<body>
    <div class="main"/>
    <script>
        var canvas = d3.select(".main")
                        .append("svg")
                        .attr("width", 500)
                        .attr("height", 500);
        var circle = canvas.append("circle")
                        .attr("cx",250)
                        .attr("cy", 250)
                        .attr("r", 50)
                        .attr("fill", "red");
    </script>
</body> 
</html>
```
