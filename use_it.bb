(babashka.pods/load-pod ["./pod"])
(require '[pod.aaa.nim :as nim])
(println (nim/f 5))
