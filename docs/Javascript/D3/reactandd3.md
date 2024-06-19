# React and D3
Ref.: [http://slides.com/shirleywu/deck](http://slides.com/shirleywu/deck)

## Approach #1
Use case: Small dataset and simple visualisation

* React for structure
* D3 for data calculation
* React for rendering

Pro:
* Clean, easy to reason about

Con:
* lifecycle for every tick -> unperformant
* Cannot use D3 functions that need access to DOM

## Approach #2
Use case: Small dataset and highly interactive visualisation

* React for structure
* D3 for data calculation
* D3 AND React for rendering
* React for elements
* D3 for attributes

Pro:
* Takes advantage of respective strengths

Con: 
* React component around all the nodes ->  unperformant
* Makes people uncomfortable


## Approach #3
Use case: Large dataset and frequently updating visualization

* React for structure
* D3 for data calculation
* D3 for rendering

Pro:
* The viz scales!
* Use all the d3 functions!

Con: 
* Not using react?


## Drag Example
* [https://wattenberger.com/blog/react-and-d3](https://wattenberger.com/blog/react-and-d3)

<iframe src="https://codesandbox.io/embed/d3-vs-react-bs7q02?fontsize=14&hidenavigation=1&theme=dark&view=preview"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-vs-react"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>
