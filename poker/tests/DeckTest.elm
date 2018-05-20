module DeckTest exposing (..)

import Test exposing (..)

import Expect exposing (Expectation)

import Deck exposing (..)

import Card exposing (..)


sortByRankTest : Test
sortByRankTest = 
    describe "sortByRank test"
        [   test "sorts the deck by rank"
                (\_ -> sortByRank [(Hearts, Ace), (Diamonds, Ten), (Clubs, Queen), (Clubs, Three)]
                    |> Expect.equal [(Clubs, Three), (Diamonds, Ten), (Clubs, Queen), (Hearts, Ace)])

        ,   test "handles empty deck"
                (\_ -> sortByRank []
                    |> Expect.equal [])
        ]


countMaxConsecutiveRanksTest : Test
countMaxConsecutiveRanksTest =
    describe "countMaxConsecutiveRanks test"
        [   test "counts max consecutive ranks in a seven card deck"
                (\_ -> countMaxConsecutiveRanks [(Spades, Three), (Hearts, Six), (Clubs, King), (Spades, Five), (Diamonds, Ten), (Clubs, Four), (Clubs, Ace)]
                    |> Expect.equal 4)

        ,   test "returns the greater consecutive count of ranks, if there are more than one consecutive series of ranks"
                (\_ -> countMaxConsecutiveRanks 
                    [   (Spades, Three), (Spades, Two), (Spades, Four), 
                        (Spades, Ten), (Spades, Jack), (Spades, Queen), (Spades, Ace), (Spades, King)
                    ] 
                    |> Expect.equal 5)

        ,   test "returns 0 if the deck is empty"
                (\_ -> countMaxConsecutiveRanks []
                    |> Expect.equal 0)
        ]