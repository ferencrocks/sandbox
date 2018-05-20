module PokerTest exposing (..)

import Test exposing (..)

import Expect exposing (Expectation)

import Card exposing (..)

import Deck exposing (..)

import Poker exposing (..)


hasConsecutiveRanksTest : Test
hasConsecutiveRanksTest = 
    describe "hasConsecutiveRanks tests"
        [   test "returns True if the ranks are consecutive" 
                (\_ -> hasConsecutiveRanks [(Spades, Two), (Hearts, Three), (Diamonds, Four), (Clubs, Five)]
                    |> Expect.equal True)

        ,   test "returns False if the ranks are not consecutive"
                (\_ -> hasConsecutiveRanks [(Spades, Two), (Hearts, Three), (Diamonds, Seven), (Clubs, Eight)]
                    |> Expect.equal False)

        ,   test "returns True if the order is random" 
                (\_ -> hasConsecutiveRanks [(Spades, Four), (Hearts, Three), (Diamonds, Two), (Clubs, Five)]
                    |> Expect.equal True)

        ,   test "returns False if the deck is empty"
                (\_ -> hasConsecutiveRanks []
                    |> Expect.equal False)
        ]


hasTheSameRankTest : Test
hasTheSameRankTest =
    describe "hasTheSameRank test"
        [   test "returns True if the ranks are the same"
                (\_ -> hasTheSameRank [(Spades, Seven), (Clubs, Seven), (Diamonds, Seven), (Hearts, Seven)]
                    |> Expect.equal True)

        ,   test "returns False if the ranks are not the same"
                (\_ -> hasTheSameRank [(Spades, Ten), (Clubs, Two), (Diamonds, King), (Hearts, Seven)]
                    |> Expect.equal False)

        ,   test "returns False if the deck is empty"
                (\_ -> hasTheSameRank []
                    |> Expect.equal False)
        ]


hasTheSameSuitTest : Test
hasTheSameSuitTest =
    describe "hasTheSameSuit test"
        [   test "returns True if the suits are the same"
                (\_ -> hasTheSameSuit [(Spades, Seven), (Spades, King), (Spades, Three), (Spades, Ace)]
                    |> Expect.equal True)

        ,   test "returns False if the suits are not the same"
                (\_ -> hasTheSameSuit [(Spades, Ten), (Clubs, Two), (Diamonds, King), (Hearts, Seven)]
                    |> Expect.equal False)

        ,   test "returns False if the deck is empty"
                (\_ -> hasTheSameSuit []
                    |> Expect.equal False)
        ]


isRoyalFlushTest : Test
isRoyalFlushTest = 
    describe "isRoyalFlush tests"
        [
            test "returns True if the deck contains a royal flush"
                (\_ -> isRoyalFlush [(Hearts, Ace), (Hearts, Jack), (Hearts, Queen), (Hearts, King), (Hearts, Ten)]
                    |> Expect.equal True)

        ,   test "returns True if the deck contains a royal flush and additional cards"
                (\_ -> isRoyalFlush [(Hearts, Ace), (Hearts, Jack), (Hearts, Six), (Hearts, Queen), (Hearts, King), (Hearts, Ten), (Spades, Two)]
                    |> Expect.equal True)

        ,   test "returns False in case of an incomplete royal flush"
                (\_ -> isRoyalFlush [(Hearts, Jack), (Hearts, Queen), (Hearts, King), (Hearts, Ace)]
                    |> Expect.equal False)
        ]


isStraightFlushTest : Test
isStraightFlushTest =
    describe "isStraightFlush tests"
        [
            test "returns True if the deck has a straight flush"
                (\_ -> isStraightFlush [(Hearts, Nine), (Hearts, Five), (Hearts, Eight), (Hearts, Seven), (Hearts, Six), (Hearts, Ten)]
                    |> Expect.equal True)

        ,   test "returns False if the deck has no straight flush"
                (\_ -> isStraightFlush [(Hearts, Two), (Hearts, Five), (Hearts, Eight), (Hearts, Seven), (Hearts, Six), (Hearts, Ten)]
                    |> Expect.equal False)
        ]