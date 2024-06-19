# NextJS
* [Amplify support for Next.js SSR](https://docs.aws.amazon.com/amplify/latest/userguide/server-side-rendering-amplify.html#ssr-Amplify-support)
* [Youtube tut 6h](https://www.youtube.com/watch?v=cLKLqpxPSws&t=7072s&ab_channel=JarrodWatts)

## SSR

Ref.: [https://docs.aws.amazon.com/amplify/latest/userguide/server-side-rendering-amplify.html](https://docs.aws.amazon.com/amplify/latest/userguide/server-side-rendering-amplify.html)

When deploying your Next.js SSR app, Amplify creates additional backend resources in your AWS account, including:

1) An Amazon Simple Storage Service (Amazon S3) bucket that stores the resources for your app's static assets. For information about Amazon S3 charges.

2) An Amazon CloudFront distribution to serve the app. For information about CloudFront charges, see Amazon CloudFront Pricing.

3) Four Lambda@Edge functions to customize the content that CloudFront delivers.

## Caveats
### <p> wrapped <div>
Ref.: https://stackoverflow.com/questions/71706064/react-18-hydration-failed-because-the-initial-ui-does-not-match-what-was-render

```
import Image from 'next/image'
/**
 * This might give that error
 */
export const IncorrectComponent = ()=>{
  return(
    <p>
      <div>This is not correct and should never be done because the p tag has been abused</div>
      <Image src='/vercel.svg' alt='' width='30' height='30'/>
    </p>
  )
}

/**
 * This will work
 */
export const CorrectComponent = ()=>{
  return(
    <div>
      <div>This is correct and should work because a div is really good for this task.</div>
      <Image src='/vercel.svg' alt='' width='30' height='30'/>
    </div>
  )
}
```
