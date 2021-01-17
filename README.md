This is merely an example and not a full interop library.

# Calling Nim from JVM Clojure

To build it (assuming you already have Nim and Clojure), you'll need `jnim`, which can be installed with `nimble install jnim`. Then do:

```sh
javac Wrapper.java
nim --app:lib -d:noSignalHandler c wrapper_jni.nim
```

A `.class` file and `.so` file will be generated.

To run it, do the following:

```sh
export CLASSPATH=.
export LD_LIBRARY_PATH=.
clojure use_it.clj
```

It should print `[0 0 1 0 1 2 0 1 2 3 0 1 2 3 4 0 1 2 3 4 5]`.

# Calling Nim from ClojureScript

Just like the JVM version requires `jnim`, this version requires `jffi`. Only tested with Lumo. Other ClojureScript environments should be possible as well, but it would require some additional work.

Build it like this:

```sh
nim js -d:nodejs --opt:size wrapper_node.nim
```

Then run it:

```
lumo use_it.cljs
```

It should print `[0 0 1 0 1 2 0 1 2 3 0 1 2 3 4 0 1 2 3 4 5]`.
