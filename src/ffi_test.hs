{-# LANGUAGE ForeignFunctionInterface #-}
module FFITest where

foreign import ccall "math.h sin" c_sin :: Double -> Double