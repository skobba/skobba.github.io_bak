# React

## Component with Children
Ref.: [https://www.carlrippon.com/react-children-with-typescript/](https://www.carlrippon.com/react-children-with-typescript/)

```ts
type Props = {
  title: string;
  children: JSX.Element;
};

const Page = ({ title, children }: Props) => (
  <div>
    <h1>{title}</h1>
    {children}
  </div>
);
```
