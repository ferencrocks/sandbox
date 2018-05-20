module Poker exposing ( Hand, hasConsecutiveRanks, isRoyalFlush, isStraightFlush )

import Deck exposing (..)

import Card exposing (..)

type Hand = Pair
  | TwoPairs 
  | ThreeOfAKind
  | Straight
  | Flush
  | FullHouse
  | FourOfAKind
  | StraightFlush
  | RoyalFlush


--------------------- Public helpers: -----------------------------------------------

hasConsecutiveRanks : Deck -> Bool
hasConsecutiveRanks deck =
  let
      sortedDeck = sortByRank deck
  in
    case sortedDeck of
      [] -> False
      firstCard :: restOfCards ->
        -- comparing the sorted deck with a range list
        List.range (valueOfCard firstCard) ((valueOfCard firstCard) + (List.length deck) - 1)
          |> (==) (List.map valueOfCard sortedDeck)


--------------------- Hand conditions: ------------------------------------------------

isRoyalFlush : Deck -> Bool
isRoyalFlush deck =
  let
      hasRoyalFlushRanks : Deck -> Bool
      hasRoyalFlushRanks deck = hasCardWithRank Ten deck
        && hasCardWithRank Jack deck
        && hasCardWithRank Queen deck
        && hasCardWithRank King deck
        && hasCardWithRank Ace deck
  in
    -- there is at least one sub-deck having the same suit, and the ranks of royal flush
    groupBySuit deck
      |> List.foldl (\subDeck acc -> acc || hasRoyalFlushRanks subDeck) False 


isStraightFlush : Deck -> Bool
isStraightFlush deck =
  groupBySuit deck
    -- there are at least five consecutive ranks of the same suit
    |> List.map (\deck -> countMaxConsecutiveRanks deck >= 5)
    |> List.any (\res -> res == True)