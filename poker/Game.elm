module Game exposing (..)

import Html

import Deck

import Card


myDeck =
  [ (Card.Spades, Card.Ten)
  , (Card.Spades, Card.Ace)
  ]

main = Deck.sum myDeck
  |> toString
  |> Html.text
