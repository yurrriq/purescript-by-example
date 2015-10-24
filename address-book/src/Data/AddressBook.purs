module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List
import Data.Maybe


type AddressBook = List Entry

type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }

type Address =
  { street :: String
  , city   :: String
  , state  :: String
  }


-- | The empty 'AddressBook'.
emptyBook :: AddressBook
emptyBook = empty

-- | Given an 'Entry' and an 'AddressBook', return an 'AddressBook' like the
-- given one, with the given entry added to it.
insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry entry book = Cons entry book

-- | Given an 'Address', return a string representation.
showAddress :: Address -> String
showAddress addr = addr.street ++ ", " ++
                   addr.city   ++ ", " ++
                   addr.state

-- | Given an 'Entry', return a string representation.
showEntry :: Entry -> String
showEntry entry = entry.lastName  ++ ", " ++
                  entry.firstName ++ ": " ++
                  showAddress entry.address
