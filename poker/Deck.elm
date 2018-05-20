module Deck exposing ( Deck, hasCard, hasCardWithRank, sortByRank, groupByRank, groupBySuit, hasTheSameRank, hasTheSameSuit, countMaxConsecutiveRanks )

import Card exposing (..)

type alias Deck = List Card


groupBy : (Card -> Card -> Bool) -> Deck -> List Deck
groupBy predicate deck = 
  case deck of
    [] -> []
    firstCard :: _ ->
      let 
        (sameRanks, rest) = List.partition (\card -> predicate card firstCard) deck
      in
        [sameRanks] ++ groupBy predicate rest


hasTheSameThing : (Deck -> List Deck) -> Deck -> Bool
hasTheSameThing groupByFn deck =
  case groupByFn deck of
    [onlyDeck] -> List.length onlyDeck > 0
    _ -> False


groupByRank : Deck -> List Deck
groupByRank deck =
  groupBy (\card1 card2 -> rankOf card1 == rankOf card2) deck


groupBySuit : Deck -> List Deck
groupBySuit deck =
  groupBy (\card1 card2 -> suitOf card1 == suitOf card2) deck


hasTheSameRank : Deck -> Bool
hasTheSameRank deck =
  hasTheSameThing groupByRank deck

hasTheSameSuit : Deck -> Bool
hasTheSameSuit deck =
  hasTheSameThing groupBySuit deck


hasCard : Card -> Deck -> Bool
hasCard card deck =
    List.foldl (\c acc -> acc || c == card) False deck


hasCardWithRank : Rank -> Deck -> Bool
hasCardWithRank rank deck =
    List.foldl (\card acc -> acc || rank == rankOf card) False deck


sortByRank : Deck -> Deck
sortByRank deck =
    List.sortWith (\c1 c2 -> compare (valueOfCard c1) (valueOfCard c2)) deck


sum : Deck -> Int
sum deck =
    let
        addCard : Card -> Int -> Int
        addCard card total =
            total + valueOfRank (Card.rankOf card)
    in
        List.foldl addCard 0 deck


countMaxConsecutiveRanks : Deck -> Int
countMaxConsecutiveRanks deck =
    let 
        sortedDeck = sortByRank deck

        maxRank : Deck -> Card -> (Int, Int) -> Int
        maxRank deck previous (cnt, maxCnt)  =
            case deck of
                [] 
                    -> max cnt maxCnt
                current :: rest 
                    -> if (valueOfCard current == (valueOfCard previous) + 1) 
                        then maxRank rest current (cnt + 1, maxCnt)
                        else maxRank rest current (1, max cnt maxCnt)
                
    in
        case sortedDeck of
            [] 
                -> 0
            first :: rest
                -> maxRank rest first (1, 0)