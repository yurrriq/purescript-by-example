module Main where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, print)


main :: forall eff. Eff (console :: CONSOLE | eff) Unit
main = print "Hello, AddressBook!"
