module Nn where

type nn = Int nn

fStep :: (Num a,Ord a) => a -> Int
fStep x
  | x >= 0 = 1
  | x <  0 = 0

fSign :: (Num a,Ord a) => a -> Int
fSign x
  | x >= 0 = 1
  | x <  0 = (-1)

fSigmoid :: (Floating a) => a -> a
fSigmoid x = (1) / (1 + exp (-x))


--(入力（0 or 1）,重み(任意の実数)) * 後で実装 *
--zip [0,1,1,1] [1.0,0.5,0.4,0.8]

newron :: (Floating a) => (Int,a) -> a
newron (1,w) = w
newron _ = 0

iNewron :: (Floating a,Ord a) => [(Int,a)] -> a -> Int
iNewron xs sita =  fStep $ (sum $ map newron $ xs ) - sita

iAnd x y = iNewron [(x,1.0),(y,1.0)] 1.5
iOr  x y = iNewron [(x,1.0),(y,1.0)] 0.5
iNot x = iNewron [(x,(-1.0))] (-0.5)
  
 -- -> [Int]
