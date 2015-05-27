module Nn where

type InPut  = [Double]
type Weight = [Double]
type Theta =  Double
type Neuron = (InPut,Weight,Theta)
type OutPut = Double

mInPut :: [InPut]
mInPut = [[1,1,1,0,0],
          [1,1,1,1,1],
          [0,0,0,0,0],
          [0,1,1,1,1],
          [1,0,0,0,1]]

mTheta = repeat 0.5 -- hold
oTheta = [0.5]

imWhight = repeat (repeat 1.0) -- hold
moWhight = [1.0]

-- 伝達関数 G(x)

fStep :: (Num a,Ord a) => a -> a
fStep x
  | x > 0 = 1
  | x <=  0 = 0

fSign :: (Num a,Ord a) => a -> a
fSign x
  | x > 0 = 1
  | x <=  0 = (-1)

fSigmoid :: (Floating a) => a -> a
fSigmoid x = (1) / (1 + exp (-x))

-- #############################

verticalNeuron :: [InPut] -> [Weight] -> [Theta] -> [Neuron]
verticalNeuron [] _ _ = []
verticalNeuron _ [] _ = []
verticalNeuron _ _ [] = []
verticalNeuron (i:is) (w:ws) (t:ts) = (i,w,t):verticalNeuron is ws ts

headSum :: InPut -> Weight -> Double
headSum [] _ = 0
headSum _ [] = 0
headSum (i:is) (w:ws) = (i*w) + (headSum is ws)

outNeuron :: Neuron -> OutPut
outNeuron (i,w,t) = fSigmoid $ (headSum i w) - t


mlNeuron i = map outNeuron $ verticalNeuron i imWhight mTheta

olNeuron i w t = outNeuron (i,w,t)

--iAnd x y = outNeuron ([x,y],[1.0,1.0],1.5)
--iOr  x y = outNeuron ([x,y],[1.0,1.0],0.5)
--iNot x = outNeuron ([x],[(-1.0)],(-0.5))