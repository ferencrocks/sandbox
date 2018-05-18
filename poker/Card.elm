module Card exposing (..)

type Suit = Spades | Hearts | Diamonds | Clubs
type Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
type ChosenRank = Low | High

type alias Card = ( Suit, Rank )
type alias Deck = List Card

suitOf : Card -> Suit
suitOf card = Tuple.first card

rankOf : Card -> Rank
rankOf card = Tuple.second card

-- valueOf : Card -> Int
-- valueOf card = card |> rankOf |> valueOfRank

valueOfRank : ChosenRank -> Rank -> Int
valueOfRank chosenRank rank =
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
        Jack -> 10
        Queen -> 10
        King -> 10
        Ace -> 
            case chosenRank of
                Low -> 1
                High -> 11

lowValueOfRank : Rank -> Int
lowValueOfRank rank = valueOfRank Low rank

highValueOfRank : Rank -> Int
highValueOfRank rank = valueOfRank High rank