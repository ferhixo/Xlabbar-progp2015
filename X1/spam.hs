module Main where

import Data.Char

-- Helper function to divide integers without Integral issues
(//) :: Int -> Int -> Double
(//) a b = fromIntegral (a) / fromIntegral (b)

main = do
    input <- getLine
    let space = length $ filter (== '_') input
    let lower = length $ filter (isLower) input
    let upper = length $ filter (isUpper) input
    let symbols = length input - (space + lower + upper)
    print $ space // length input
    print $ lower // length input
    print $ upper // length input
    print $ symbols // length input