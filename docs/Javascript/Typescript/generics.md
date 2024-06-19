# Generics
In .tsx files you cannot just write ```<T>```, you need to add an ```,```:
```typescript

const working = <T,>(x: T) => x;

const notWorking = <T>(x: T) => x;

```