module Main where

import Prelude (Unit, (*), (+), (<<<))
import Control.Bind (join)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, print)
import Data.Function (on)
import Math (pi, sqrt)


main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = print (diagonal 3.0 4.0)

circleArea :: Number -> Number
circleArea = (pi * _) <<< square

diagonal :: Number -> Number -> Number
diagonal = sqrt <<^ (+) `on` square

square :: Number -> Number
square = join (*)

binaryCompose :: forall a b c d. (c -> d) -> (a -> b -> c) -> (a -> b -> d)
binaryCompose = (<<<) <<< (<<<)

infixl 8 binaryCompose as <<^
