module Main where

import Prelude
import Control.Monad.Eff.Console
import Math (pi, sqrt)


main = print (diagonal 3.0 4.0)

circleArea :: Number -> Number
circleArea r = pi * r * r

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)
