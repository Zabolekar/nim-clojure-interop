(def nim (js/require "./wrapper_node"))

(defn f [n]
  (vec (. nim f n)))

(println (f 5))
