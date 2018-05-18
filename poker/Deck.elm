module Deck exposing (..)

import Card exposing ( Card, rankOf, highValueOfRank )

type alias Deck = List Card


sum : Deck -> Int
sum deck =
    let
        addCard : Card -> Int -> Int
        addCard card total =
            total + highValueOfRank (Card.rankOf card)
    in
        List.foldl addCard 0 deck