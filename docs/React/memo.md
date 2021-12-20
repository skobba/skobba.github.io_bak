# memo
Used to reduce the render count and unnecessary executions of expensive functions. 
```
const memoizedValue = useMemo(() => computeExpensiveValue(a, b), [a, b]);
``` 

HOC
```js
export const memoizedValue = useMemo(MemoizedMovie(props));
```

Hook
```js
export const MemoizedMovie = React.memo(Movie(props));
```

If your component renders the same result given the same props, you can wrap it in a call to React.memo for a performance boost in some cases by memoizing the result. This means that React will skip rendering the component, and reuse the last rendered result.

<iframe src="https://codesandbox.io/embed/react-memo-demo-bv31j?fontsize=14&hidenavigation=1&theme=dark"
     style="width:100%; height:500px; border:0; border-radius: 4px; overflow:hidden;"
     title="react-memo-demo"
     allow="accelerometer; ambient-light-sensor; camera; encrypted-media; geolocation; gyroscope; hid; microphone; midi; payment; usb; vr; xr-spatial-tracking"
     sandbox="allow-forms allow-modals allow-popups allow-presentation allow-same-origin allow-scripts"
   ></iframe>
