# regex
[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Cheatsheet](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions/Cheatsheet)

```
let re = /ab+c/i; // literal notation
let re = new RegExp('ab+c', 'i') // constructor with string pattern as first argument
let re = new RegExp(/ab+c/, 'i') // constructor with regular expression literal as first argument (Starting with ECMAScript 6)
```

## Play with IP address
<p class="codepen" data-height="300" data-theme-id="dark" data-default-tab="js,result" data-slug-hash="mdqzmoO" data-user="skobba" style="height: 300px; box-sizing: border-box; display: flex; align-items: center; justify-content: center; border: 2px solid; margin: 1em 0; padding: 1em;">
  <span>See the Pen <a href="https://codepen.io/skobba/pen/mdqzmoO">
  pkce generator</a> by Gjermund Skobba (<a href="https://codepen.io/skobba">@skobba</a>)
  on <a href="https://codepen.io">CodePen</a>.</span>
</p>
<script async src="https://cpwebassets.codepen.io/assets/embed/ei.js"></script>

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
