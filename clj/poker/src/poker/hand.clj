(ns poker.hand
  (:require [poker.card :refer :all]))

;;; Grouping by...
(defn- group-by-ranks
  [hand]
  (group-by card-rank hand))

(defn- group-by-suits
  [hand]
  (group-by card-suit hand))


;;; Group helpers
(defn- cards-of-group [[_ cards]] cards)

(defn- has-n-cards
  [n group]
  (= n (count (cards-of-group group))))

(defn- has-two-cards [group] (has-n-cards 2 group))
(defn- has-three-cards [group] (has-n-cards 3 group))
(defn- has-four-cards [group] (has-n-cards 4 group))
(defn- has-five-cards [group] (has-n-cards 5 group))


;;; Sorting cards by rank
(defn- sort-by-rank
  [hand]
  (sort card-rank-lt? hand))

(defn group-by-sorted-ranks
  [hand]
  (into (sorted-map)
        (group-by card-rank-value hand)))

(defn partition-by-consecutive
  [groups]
  (loop []
    ()))

;;; Hand checks
(defn hand-pairs
  "Returns all the hand pairs"
  [hand]
  (->> (group-by-ranks hand)
       (filter has-two-cards)
       (map cards-of-group)))

(defn hand-two-pairs
  "Returns two pairs of a hand"
  [hand]
  ())

(defn hand-three-of-a-kinds
  "Returns all the three of a kinds"
  [hand]
  (->> (group-by-ranks hand)
       (filter has-three-cards)
       (map cards-of-group)))

