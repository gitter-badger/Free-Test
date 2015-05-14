module Main where

try n = [(a,b,c) | c <- [1..n], a <- [1..c] , b <- [1..a], (a^2) + (b^2) == (c^2)]

main = print $ try 100