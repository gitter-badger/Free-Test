module Main where

import System.Environment(getArgs)
import Numeric (showHex)
import qualified Data.ByteString.Lazy as Bl

hexPrint :: (Show a, Integral a) => [a] -> IO ()
hexPrint xs = putStrLn $ foldr (\x -> (\y -> x ++ " " ++ y)) "" $ binArray xs

binArray :: (Show a, Integral a) => [a] -> [String]
binArray xs = map hexLen $ map (\x -> showHex x "") xs

hexLen :: String -> String
hexLen xs
  | length xs /= 2 = '0':xs
  | otherwise = xs

bFileRead :: FilePath -> IO Bl.ByteString
bFileRead filepath = Bl.readFile filepath

mainLoop = do
  a <- getArgs
  b <- bFileRead (head a)
  hexPrint $ Bl.unpack b
  --print $ binArray (Bl.unpack b)

main = do
  mainLoop

