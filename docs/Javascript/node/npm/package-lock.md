# package-lock.json
Specifics of npm's package.json handling: [https://docs.npmjs.com/cli/v8/configuring-npm/package-json](https://docs.npmjs.com/cli/v8/configuring-npm/package-json)

## Why
Why not have extact version in package.json?
* We want the newest version of every package to be updated if possible in every commit to get the latest security patches.
* package-lock.json is update with "npm install" if new packages exists, so good package management would be to run "npm install" at least once a week.
* Once a week is also a good interval to use tools like:
```
npx npm-check-updates -u
npx ncu -u
npm outdated
```

## History of package-lock.json
Kat Marchán
twitter
githubSep 3 '19
Hi! I wrote npm ci and I'm also the one who added package-lock.json to NPM back in the day.

The story about package.json vs package-lock.json is tricky: npm install does not ignore package.json versions, nor does it ignore the package-lock.json. What it does is verify that the package.json and package-lock.json correspond to each other. That is, if the semver versions described in package.json fit with the locked versions in package-lock.json, npm install will use the latter completely, just like npm ci would.

Now, ff you change package.json such that the versions in package-lock.json are no longer valid, your npm install will be treated as if you'd done npm install some-pkg@x.y.z, where x.y.z is the new version in the package.json for some-package.

This was done intentionally because, after early feedback in npm@5, we realized that one of the ways people edited their dependencies was by editing package.json directly, and it became a bit of a usability nightmare to treat package-lock.json as canonical in those cases. It was a trade-off between two competing worlds, and the current behavior won out.

This is why npm ci was born: because the behavior for npm install was actually what people wanted, in practice (when they actually ran into the behavior), and npm ci had a nice ring to it anyway (it was eventually backronymed to clean-install for this reason).

Hope this helps! Nice article! 👍🏼
