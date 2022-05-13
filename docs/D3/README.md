# D3
* [d3indepth.com](https://www.d3indepth.com/introduction/)
* [React and D3 together](https://www.youtube.com/watch?v=zXBdNDnqV2Q)
* [https://github.com/d3/d3/wiki/Gallery](https://github.com/d3/d3/wiki/Gallery)

<iframe src="https://codesandbox.io/embed/d3-sticky-force-layout-b98l86?fontsize=14&hidenavigation=1&theme=light&view=preview"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-sticky-force-layout"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>

## Enter, Update and Exit
Ref.: [https://www.d3indepth.com/enterexit](https://www.d3indepth.com/enterexit)
```
.join(
  function(enter) {
    ...
  },
  function(update) {
    ...
  },
  function(exit) {
    ...
  }
)
```

```js
.join(
  function(enter) {
    return enter.append('circle');
  }
)
```

This is equivalent to:
```js
.join('circle')
```
