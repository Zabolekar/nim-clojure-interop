(import Wrapper)

(defn f [n]
  (vec (Wrapper/f n)))

(println (f 5))
