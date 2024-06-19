# Force Graph
* [force-directed-graphs-with-react-and-d3](https://reactfordataviz.com/articles/force-directed-graphs-with-react-and-d3v7/)
* [Force parameters](https://observablehq.com/@maliky/testing-the-d3-forces-parameters)
* [testing-the-d3-forces-parameters](https://observablehq.com/@maliky/testing-the-d3-forces-parameters)

## Iterations and Alpha
The force simulations as the name implies is a simulation on particles interacting with each other. Alpha is used to help converge the system by decaying at each iteration. The forces are multiplied by alpha, so at each iteration the forces become weaker until alpha reaches a very low value when the simulation stops.

## Nodes
```
index - the node’s zero-based index into nodes
x - the node’s current x-position
y - the node’s current y-position
vx - the node’s current x-velocity
vy - the node’s current y-velocity

fx - the node’s fixed x-position
fy - the node’s fixed y-position
```

## d3-react-force-graph-les-miserables
<iframe src="https://codesandbox.io/embed/d3-react-force-graph-les-miserables-32p592?fontsize=14&hidenavigation=1&theme=dark&view=preview"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-react-force-graph-les-miserables"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>

## d3-sticky-force-layout
<iframe src="https://stackblitz.com/edit/react-canfnz?embed=1&file=src/Graph.js&view=preview"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"></iframe>

## d3-force-graph
<iframe src="https://codesandbox.io/embed/d3-force-graph-dhtwe4?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-force-graph"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>
   
## d3-force-graph-v2
<iframe src="https://codesandbox.io/embed/d3-force-graph-v2-c3wtni?fontsize=14&hidenavigation=1&module=%2Fsrc%2FForceGraph.js&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-force-graph (v2)"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>
   
