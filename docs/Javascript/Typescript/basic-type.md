# Basic Type

## Useful table for Types vs Interfaces

It's a nuanced topic, don't get too hung up on it. Here's a handy table:

| Aspect                                          | Type | Interface |
| ----------------------------------------------- | :--: | :-------: |
| Can describe functions                          |  ✅  |    ✅     |
| Can describe constructors                       |  ✅  |    ✅     |
| Can describe tuples                             |  ✅  |    ✅     |
| Interfaces can extend it                        |  ⚠️  |    ✅     |
| Classes can extend it                           |  🚫  |    ✅     |
| Classes can implement it (`implements`)         |  ⚠️  |    ✅     |
| Can intersect another one of its kind           |  ✅  |    ⚠️     |
| Can create a union with another one of its kind |  ✅  |    🚫     |
| Can be used to create mapped types              |  ✅  |    🚫     |
| Can be mapped over with mapped types            |  ✅  |    ✅     |
| Expands in error messages and logs              |  ✅  |    🚫     |
| Can be augmented                                |  🚫  |    ✅     |
| Can be recursive                                |  ⚠️  |    ✅     |

⚠️ In some cases

(source: [Karol Majewski](https://twitter.com/karoljmajewski/status/1082413696075382785))


## Interface vs Type Example
```ts
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


## Function Type
```ts
const func: (num: number) => string = (num: number) => String(num);

```
The function type:
```ts
(num: number) => string
```

```ts
const valueFactory = (x: number) => x; // definition
const myValue = valueFactory(123); // use
```