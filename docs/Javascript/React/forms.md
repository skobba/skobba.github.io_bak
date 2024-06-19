# React Forms
[React Forms vs Formik](https://dev.to/doaashafik/formik-vs-react-hook-form-aei)

## Controlled vs Uncontrolled
### Controlled Components
In most cases, we recommend using controlled components to implement forms. In a controlled component, form data is handled by a React component. The alternative is uncontrolled components, where form data is handled by the DOM itself.

2 points tell you that a component is controlled:
* The input has a value attribute bound to the state.
* An onChange event handler declared.

NB: We don’t need a form element on the page for the component to be a controlled component.

Working with controlled components can be hard. Large number of input elements requires setup with lots of value attributes and event handlers.

### Uncontrolled Components
Uncontrolled components act more like traditional HTML form elements. The data for each input element is stored in the DOM, not in the component. Instead of writing an event handler for all of your state updates, you use a ref to retrieve values from the DOM.
