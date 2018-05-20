module Game exposing (..)

import Html

import Deck

import Card

import Poker


myDeck =
  [ (Card.Spades, Card.Ten)
  , (Card.Spades, Card.Ace)
  , (Card.Hearts, Card.Five)
  ]

main = Poker.groupByRank myDeck
  |> toString
  |> Html.text
