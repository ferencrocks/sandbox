(ns poker.card)

(def suits
  #{:Hearts :Spades :Clubs :Diamonds})

(def ranks
  { 2 2
    3 3
    4 4
    5 5
    6 6
    7 7
    8 8
    9 9
    10 10
    :J 11
    :Q 12
    :K 13
    :A 14 })

(defn suit?
  "Is a valid suit?"
  [s]
  (contains? suits s))

(defn rank?
  "Is a valid rank?"
  [r]
  (contains? ranks r))

(defn card-suit
  "Returns the suit of a card"
  [[s _]] s)

(defn card-rank
  "Returns the rank of a card"
  [[_ r]] r)

(defn card?
  "Is a valid card?"
 [c]
  (and
   (suit? (card-suit c))
   (rank? (card-rank c))))

(defn rank-value
  "Returns a numeric value for a given rank"
  [r]
  (get ranks r))

(defn card-rank-value
  "Returns the rank value of a card's rank"
  [c]
  (rank-value (card-rank c)))


(defn- cmp-cards-by-pred
  "Compare two ranks by a predicate"
  [pred r1 r2]
  (pred (card-rank-value r1) (card-rank-value r2)))

(defn card-rank-lt?
  "Is the first rank less than the second"
  [r1 r2]
  (cmp-cards-by-pred < r1 r2))

(defn card-rank-gt?
  "Is the first rank greater than the second"
  [r1 r2]
  (cmp-cards-by-pred > r1 r2))

(defn card-rank-eq?
  "Is the first rank equal to the second"
  [r1 r2]
  (cmp-cards-by-pred = r1 r2))