# SharedArrayBuffer

## Chrome message
Scheduler's use of SharedArrayBuffer will require cross-origin isolation.

```
scheduler.development.js:298 
[Deprecation] SharedArrayBuffer will require cross-origin isolation as of M92, around July 2021.
See https://developer.chrome.com/blog/enabling-shared-array-buffer/ for more details.
```

## History
SharedArrayBuffer arrived in Chrome 60 (that's July 2017, for those of you who think of time in dates rather than Chrome versions), and everything was great. For 6 months.

In January 2018 a vulnerability was revealed in some popular CPUs. See the announcement for full details, but it essentially meant that code could use high-resolution timers to read memory that it shouldn't have access to.

This was a problem for us browser vendors, as we want to allow sites to execute code in the form of JavaScript and WASM, but strictly control the memory this code can access. If you arrive on my website, I shouldn't be able to read anything from the internet banking site you also have open. In fact, I shouldn't even know you have your internet banking site open. These are fundamentals of web security.

To mitigate this, we reduced the resolution of our high-resolution timers such as performance.now(). However, you can create a high-resolution timer using SharedArrayBuffer by modifying memory in a tight loop in a worker, and reading it back in another thread. This couldn't be effectively mitigated without heavily impacting well-intentioned code, so SharedArrayBuffer was disabled altogether.

