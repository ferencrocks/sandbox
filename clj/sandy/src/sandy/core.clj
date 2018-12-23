(ns sandy.core
  (:gen-class))

(defn -main []
  (println "Hello, World!"))

(defn part-by-consecutive
  [xs]
  (reduce
    (fn 
      [[p ps] x]
      (if 
        (= (dec x) (first p))
        [(conj p x) ps]
        [(list x) (conj ps p)]))
    [(list (first xs)) []]
    (rest xs)))
      
(defn part-by-consecutive
  [[x & xs]]
  (loop [part (list x)
         parts []
         x (first xs)
         xs (next xs)]
    (if (nil? x)
      (conj parts part)
      (let [consecutive? (= (dec x) (first part))]
        (recur
          (if consecutive? (conj part x) (list x))
          (if consecutive? parts (conj parts part))
          (first xs)
          (next xs))))))      

(defn part-by-consecutive
  [[x & xs]]
  (loop [part (list #{x})
         parts []
         x (first xs)
         xs (next xs)]
    (if (nil? x)
      (conj parts part)
      (let [last-part (ffirst part)
            cons? (= (dec x) last-part)
            eq? (= x last-part)]
        (recur
          (cond
            eq? (conj (next part) (conj (first part) x))
            cons? (conj part #{x})
            :else (list #{x}))
          (if (or cons? eq?) parts (conj parts part))
          (first xs)
          (next xs))))))

(part-by-consecutive [1 2 3 5 6 6 6 7])

; [[1 2 3] [5 6 7]]
