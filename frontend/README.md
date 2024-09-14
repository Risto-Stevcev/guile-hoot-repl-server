# guile-hoot-repl-server

## Usage

Compile the example:

```
$ make
```

Then start the nREPL relay server:

```
$ node repl_server.js
```

Serve the index.html:

```
$ http-server .
```

And go to the page to connect to the WebSocket.

Then start geiser:

```
M-x geiser-connect
```

Choose `chibi` (not `guile`). The `guile hoot` geiser code would likely initially be based off of
chibi since it's similarly lightweight, and then just take whatever it can use from guile's geiser
library. Connect to `localhost` and `1337`. And then you should be able to evaluate expressions
using `C-x C-e`.

Right now you need to import whatever modules you need to use into the `geiser` module, with the
example importing `my-library`, so that you can test evaluating `(foo)`.
