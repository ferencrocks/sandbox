module Card exposing (..)

type Suit = Spades | Hearts | Diamonds | Clubs
type Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

type alias Card = ( Suit, Rank )

suitOf : Card -> Suit
suitOf card = Tuple.first card

rankOf : Card -> Rank
rankOf card = Tuple.second card

-- valueOf : Card -> Int
-- valueOf card = card |> rankOf |> valueOfRank

valueOfRank : Rank -> Int
valueOfRank rank =
    case rank of
        Two -> 2
        Three -> 3
        Four -> 4
        Five -> 5
        Six -> 6
        Seven -> 7
        Eight -> 8
        Nine -> 9
        Ten -> 10
        Jack -> 11
        Queen -> 12
        King -> 13
        Ace -> 14

valueOfCard : Card -> Int
valueOfCard card =
    (rankOf card)
        |> valueOfRank