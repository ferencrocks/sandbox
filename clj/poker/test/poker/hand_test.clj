(ns poker.hand-test
  (:require [clojure.test :refer :all]
            [poker.hand :refer :all]))

(deftest poker-hands
  (testing "Identify pairs"
           (is (= (hand-pairs [[:Spades 2] [:Hearts 5] [:Clubs 2] [:Diamonds :K] [:Hearts :A]])
                  [[[:Spades 2] [:Clubs 2]]]))

           (is (= (hand-pairs [[:Clubs 7] [:Hearts 7] [:Clubs 6] [:Diamonds 7] [:Hearts 6]])
                  [[[:Clubs 6] [:Hearts 6]]]))
           )
  (testing "Identify three of a kinds"
           (is (= (hand-three-of-a-kinds [[:Clubs 7] [:Hearts 7] [:Clubs 6] [:Diamonds 7] [:Hearts 6]])
                  [[[:Clubs 7] [:Hearts 7] [:Diamonds 7]]]))))