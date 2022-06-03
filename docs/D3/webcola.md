# Webcola

## Hierarchical representation of the data
D3 provides out of the box hierarchical layout to compute positions of nodes in hierarchical way. However, hierarchical layout works on the data which is in a tree-like format (implicit parent-child structure), with a constraint that one node must not have more than one parent. Therefore, we cannot use d3-hierarchy to create tree-like layouts to denote hierarchical information when the data structure looks like graph.

We can solve this problem by leveraging the D3 force directed layout in order to achieve the non-overlapping nodes and putting additional constraints on geometric node positions to achieve hierarchical layout. It can be achieved purely in D3, however, it is a bit tedious to write constraints in plain JavaScript.

There is an easier way - WebCola.

## start()
```
.start(10,15,20);

The start() method now includes up to three integer arguments. In the example above, start will initially apply 10 iterations of layout with no constraints, 15 iterations with only structural (user-specified) constraints and 20 iterations of layout with all constraints including anti-overlap constraints. Specifying such a schedule is useful to allow the graph to untangle before making it relatively "rigid" with constraints.
```

Ref.: [https://observablehq.com/@mbostock/hello-cola](https://observablehq.com/@mbostock/hello-cola)

<iframe src="https://codesandbox.io/embed/d3-react-force-graph-webcola-2owbg3?fontsize=14&hidenavigation=1&module=%2Fsrc%2FForceGraph.js&theme=dark&view=preview"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-react-force-graph-webcola"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>
