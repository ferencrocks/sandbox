(ns poker.card-test
  (:require [clojure.test :refer :all]
            [poker.card :refer :all]))

(def test-ranks [2 3 4 5 6 7 8 9 10 :J :Q :K :A])

(deftest card-suit-validity-test
  (testing "suit? returns true if a suit is valid"
           (is (true? (suit? :Hearts)))
           (is (true? (suit? :Spades)))
           (is (true? (suit? :Clubs)))
           (is (true? (suit? :Diamonds))))
  (testing "suit? returns false if a suit is invalid"
           (is (false? (suit? :Foo)))))

(deftest card-rank-validity-test
  (testing "suit? returns true if a rank is valid"
           (is (every? true? (map rank? test-ranks))))
  (testing "suit? returns false if a suit is invalid"
           (is (false? (suit? :Foo)))))

(deftest card-validity-test
  (testing "card? returns true if a card is valid"
           (is (true? (card? [:Spades 10])))
           (is (true? (card? [:Hearts :K]))))
  (testing "card? returns false if a card is invalid"
           (is (false? (card? [:Foo 10])))
           (is (false? (card? [:Clubs :Bar])))))

(deftest card-helpers-test
  (testing "card-suit"
           (is (= :Spades (card-suit [:Spades 8]))))
  (testing "card-rank"
           (is (= :A (card-rank [:Diamonds :A]))))
  (testing "card-rank-value"
           (is (= 10 (card-rank-value [:Clubs 10])))
           (is (= 12 (card-rank-value [:Hearts :Q])))))

(deftest card-rank-comparisions
  (testing "Rank less than"
           (is (true? (card-rank-lt? [:Spades 10] [:Spades :J])))
           (is (false? (card-rank-lt? [:Clubs :A] [:Hearts :Q]))))
  (testing "Rank greater than"
           (is (true? (card-rank-gt? [:Hearts :Q] [:Diamonds 2])))
           (is (false? (card-rank-gt? [:Clubs 4] [:Spades 10]))))
  (testing "Rank equality"
           (is (true? (card-rank-eq? [:Diamonds 7] [:Clubs 7])))
           (is (false? (card-rank-eq? [:Hearts :Q] [:Hearts :K])))))