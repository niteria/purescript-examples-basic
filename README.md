# Basic

**This is the basic example from https://github.com/purescript-halogen/purescript-halogen/tree/master/examples/basic as a separate repository** built with https://github.com/jeslie0/mkSpagoDerivation and https://github.com/thomashoneyman/purescript-overlay

This example demonstrates close to the smallest Halogen component you can build. It's unlikely you'd make components this small in a real world application, but this lets you see the essential parts of a component definition.

## Building

You can build this example with:

```sh
nix build
```

You can view the running application by opening `result/index.html`.


## Developing

```sh
nix develop
spago bundle --module Example.Basic.Main --outfile dist/example.js
```

This will bundle a runnable JS file, `example.js`, in the `dist` directory. You can view the running application by opening the corresponding `index.html` file.
