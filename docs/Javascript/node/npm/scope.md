# Scope
A scope allows you to create a package with the same name as a package created by another user or organization without conflict.

When listed as a dependent in a package.json file, scoped packages are preceded by their scope name. The scope name is everything between the @ and the slash:

    @skobba/package-name

Visibillity:
* Unscoped packages are always public.
* Private packages are always scoped.
* Scoped packages are private by default; you must pass a command-line flag when publishing to make them public.
