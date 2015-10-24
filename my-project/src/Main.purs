module Main where

import Prelude
import Control.Monad.Eff.Console
import Math (sqrt)


main = log "Hello, World!"

diagonal :: Number -> Number -> Number
diagonal w h = sqrt (w * w + h * h)
