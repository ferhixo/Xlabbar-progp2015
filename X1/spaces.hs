module Main where
import Data.List

main = do
    -- Read two lines
    b <- getLine
    p <- getLine
    -- Read boundary int and partition ints
    let size = head $ map (read :: String->Int) $ words b
    let parts = 0 : (map (read :: String->Int) $ words p) ++ [size]

    -- Map all possible distances
    let dist = tail $ sort $ nub $ concat $ map (\x -> map (\y -> abs(x - y)) parts) parts
    putStrLn $ concat . intersperse " " $ map show dist