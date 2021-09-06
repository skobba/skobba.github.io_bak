# Typescript

## Generics
In .tsx files you cannot just write ```<T>```, you need to add an ```,```:
```typescript

const working = <T,>(x: T) => x;

const notWorking = <T>(x: T) => x;

```

## Interface vs Type
```typescript
interface Car {
  color: string;
  doors: number;
}

interface Motorbike {
  color: string;
  seats: number;
}

type Car = {
  color: string;
  doors: number;
}

type Motorbike = {
  color: string;
  seats: number;
}

type Bmw = Car | Motorbike;
type Bmw = Car & Motorbike;



```

