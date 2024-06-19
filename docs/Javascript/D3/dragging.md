# Dragging

D3 has two built in function for behaviours:
* Drag — tracks mouse or multitouch movement(s) relative to an origin
* Zoom — emits zoom and pan events in response to common input idioms

## Drag Events
When a drag event listener is invoked, it receives the current drag event as its first argument. The event object exposes several fields:

* target - the associated drag behavior.
* type - the string “start”, “drag” or “end”; see drag.on.
* subject - the drag subject, defined by drag.subject.
* x - the new x-coordinate of the subject; see drag.container.
* y - the new y-coordinate of the subject; see drag.container.
* dx - the change in x-coordinate since the previous drag event.
* dy - the change in y-coordinate since the previous drag event.
* identifier - the string “mouse”, or a numeric touch identifier.
* active - the number of currently active drag gestures (on start and end, not including this one).
* sourceEvent - the underlying input event, such as mousemove or touchmove.


<iframe src="https://codesandbox.io/embed/d3-react-dragging-ddmklm?fontsize=14&hidenavigation=1&module=%2Fsrc%2FCircles.js&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="d3-react-dragging"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>
   
