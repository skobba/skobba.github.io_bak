# Refs
Refs provide a way to access DOM nodes or React elements created in the render method.

## Render Count
```js
import { useRef } from "react";


export const Counter = props => {
    const renderCounter  = useRef(0);
    renderCounter.current = renderCounter.current + 1;
    return <pre>Renders: {renderCounter.current}</pre>;
};
```
