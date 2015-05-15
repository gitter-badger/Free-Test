module Nn where

type Weight = Double
type Input  = Double
type Neuron = (Input,Weight)
type Theta =  Double

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

<<<<<<< HEAD
neuron :: Neuron -> Weight
neuron (1,w) = w
neuron _ = 0

ineuron :: [Neuron] -> Weight -> Int
ineuron xs sita =  fStep $ (sum $ map neuron $ xs ) - sita
=======
newron :: New -> Weight
newron (1,w) = w
newron _ = 0

iNewron :: [New] -> Weight -> Int
iNewron xs sita =  fStep $ (sum $ map newron $ xs ) - sita
>>>>>>> dc9286c2a89849e32a8aedd42b7aeeba5b589e99

iAnd x y = ineuron [(x,1.0),(y,1.0)] 1.5
iOr  x y = ineuron [(x,1.0),(y,1.0)] 0.5
iNot x = ineuron [(x,(-1.0))] (-0.5)
  
 -- -> [Int]
