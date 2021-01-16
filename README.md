# Calling Nim from JVM Clojure

This is merely an example and not a full interop library.

To build it (assuming you already have Nim and Clojure), you'll need `jnim`, which can be installed with `nimble install jnim`. Then do:

```sh
javac -h . Wrapper.java
nim --app:lib -d:noSignalHandler c wrapper_jni.nim
```

A `.h` file, a `.class` file and `.so` file will be generated.

To run it, do the following:

```sh
export CLASSPATH=.
export LD_LIBRARY_PATH=.
clojure use_it.clj
```
