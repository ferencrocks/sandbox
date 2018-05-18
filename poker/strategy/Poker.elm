module Poker exposing (..)

import Deck exposing ( Deck )

import Card exposing ( Card, suitOf )

type Hand = Pair
  | TwoPairs 
  | ThreeOfAKind
  | Straight
  | Flush
  | Fullhouse
  | FourOfAKind
  | StraightFlush
  | RoyalFlush

groupByRank : Deck -> Deck
groupByRank deck = 
  case List.head deck of
    [] -> []
     ->
      groupByRank 
    -- case deck of
    --   [] -> []
    --   _ -> List.partition (\card -> (suitOf card) == (suitOf List.head deck) )
