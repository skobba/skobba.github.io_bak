# Immutable

In object-oriented and functional programming, an immutable object (unchangeable object) is an object whose state cannot be modified after it is created.

In JavaScript, all primitive types (***Undefined, Null, Boolean, Number, BigInt, String, Symbol***) are immutable, but custom objects are generally mutable.

```js
function doSomething(x) { /* does changing x here change the original? */ };
var str = 'a string';
var obj = { an: 'object' };
doSomething(str);         // strings, numbers and bool types are immutable, function gets a copy
doSomething(obj);         // objects are passed in by reference and are mutable inside function
doAnotherThing(str, obj); // `str` has not changed, but `obj` may have.
```
To simulate immutability in an object, one may define properties as read-only (writable: false).

```js
var obj = {};
Object.defineProperty(obj, 'foo', { value: 'bar', writable: false });
obj.foo = 'bar2'; // silently ignored
```

However, the approach above still lets new properties be added. Alternatively, one may use Object.freeze to make existing objects immutable.

```js
var obj = { foo: 'bar' };
Object.freeze(obj);
obj.foo = 'bars'; // cannot edit property, silently ignored
obj.foo2 = 'bar2'; // cannot add property, silently ignored
```

With the implementation of ECMA262, JavaScript has the ability to create immutable references that cannot be reassigned. However, using a const declaration doesn't mean that value of the read-only reference is immutable, just that the name cannot be assigned to a new value.
