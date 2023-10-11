# Performance metrics

## Types of metrics
There are several other types of metrics that are relevant to how users perceive performance.

* __Perceived load speed:__ how quickly a page can load and render all of its visual elements to the screen.
* __Load responsiveness:__ how quickly a page can load and execute any required JavaScript code in order for components to respond quickly to user interaction
* __Runtime responsiveness:__ after page load, how quickly can the page respond to user interaction.
* __Visual stability:__ do elements on the page shift in ways that users don't expect and potentially interfere with their interactions?
* __Smoothness:__ do transitions and animations render at a consistent frame rate and flow fluidly from one state to the next?

Ref.: [https://developer.chrome.com/docs/lighthouse/performance/first-meaningful-paint](https://developer.chrome.com/docs/lighthouse/performance/first-meaningful-paint)

## Important metrics
Ref.: [https://web.dev/articles/user-centric-performance-metrics](https://web.dev/articles/user-centric-performance-metrics)

*   **[First Contentful Paint (FCP)](https://web.dev/articles/fcp):** measures the time from when the page starts loading to when any part of the page's content is rendered on the screen. _(lab,field)_
*   **[Largest Contentful Paint (LCP)](https://web.dev/articles/lcp):** measures the time from when the page starts loading to when the largest text block or image element is rendered on the screen. _(lab,field)_
*   **[First Input Delay (FID)](https://web.dev/articles/fid):** measures the time from when a user first interacts with your site (when they click a link, tap a button, or use a custom, JavaScript-powered control) to the time when the browser is actually able to respond to that interaction. _(field)_
*   **[Interaction to Next Paint (INP)](https://web.dev/articles/inp)**: measures the latency of every tap, click, or keyboard interaction made with the page, and—based on the number of interactions—selects the worst interaction latency of the page (or close to the highest) as a single, representative value to describe a page's overall responsiveness. _(lab,field)_
*   **[Time to Interactive (TTI)](https://web.dev/articles/tti):** measures the time from when the page starts loading to when it's visually rendered, its initial scripts (if any) have loaded, and it's capable of reliably responding to user input quickly._(lab)_
*   **[Total Blocking Time (TBT)](https://web.dev/articles/tbt):** measures the total amount of time between FCP and TTI where the main thread was blocked for long enough to prevent input responsiveness. _(lab)_
*   **[Cumulative Layout Shift (CLS)](https://web.dev/articles/cls):** measures the cumulative score of all unexpected layout shifts that occur between when the page starts loading and when its [lifecycle state](https://developer.chrome.com/blog/page-lifecycle-api/) changes to hidden. _(lab,field)_
*   **[Time to First Byte (TTFB)](https://web.dev/articles/ttfb)**: measures the time it takes for the network to respond to a user request with the first byte of a resource. _(lab,field)_
