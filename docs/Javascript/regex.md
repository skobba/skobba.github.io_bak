# regex
[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Cheatsheet](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Cheatsheet)

```
let re = /ab+c/i; // literal notation
let re = new RegExp('ab+c', 'i') // constructor with string pattern as first argument
let re = new RegExp(/ab+c/, 'i') // constructor with regular expression literal as first argument (Starting with ECMAScript 6)
```

## Groups
String.match() won't return groups if the ```/.../g``` flag is set.

Get all matches:

    const results = String.matchAll()

NB: results - is not an array, but an iterable object ```[object RegExp String Iterator]```

```js
let results = '<h1> <h2>'.matchAll(/<(.*?)>/gi);

// results - is not an array, but an iterable object
console.log(results); // [object RegExp String Iterator]
console.log(results[0]); // undefined (*)

results = Array.from(results); // let's turn it into array

console.log(results[0]); // <h1>,h1 (1st tag)
console.log(results[1]); // <h2>,h2 (2nd tag)
```


[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll)

## Greedy
Non greedy operator ```*?```
