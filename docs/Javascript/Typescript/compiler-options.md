# Compiler Options

Recomends to use TypeScript with the most comprehensive setting, ```"strict": true```. Without it, programs are slightly easier to write, but we also lose many benefits of static type checking. Currently, this setting switches on the following sub-settings:

* --noImplicitAny: If TypeScript can’t infer a type, we must specify it. This mainly applies to parameters of functions and methods: With this settings, we must annotate them.
* --noImplicitThis: Complain if the type of this isn’t clear.
* --alwaysStrict: Use JavaScript’s strict mode whenever possible.
* --strictNullChecks: null is not part of any type (other than its own type, null) and must be explicitly mentioned if it is a acceptable value.
* --strictFunctionTypes: stronger checks for function types.
* --strictPropertyInitialization: If a property can’t have the value undefined, then it must be initialized in the constructor.
