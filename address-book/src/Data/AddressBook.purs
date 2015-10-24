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

-- | Given a first name, last name and 'AddressBook', if a matching 'Entry' is
-- present in the given address book, return just that entry, otherwise nothing.
findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = head <<< filter isMatch
  where
    isMatch :: Entry -> Boolean
    isMatch entry = (entry.firstName == firstName &&
                     entry.lastName  == lastName)

-- | Given an 'Entry' and an 'AddressBook', return an 'AddressBook' like the
-- given one, with the given entry added to it.
insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

-- | Given an 'Address' and an 'AddressBook', if an 'Entry' with a matching
-- 'Address' is present in the given 'AddressBook', return 'Just' that 'Entry',
-- otherwise 'Nothing'.
lookupAddress :: Address -> AddressBook -> Maybe Entry
lookupAddress addr = head <<< filter isMatch
  where
    isMatch :: Entry -> Boolean
    isMatch entry = (addr'.street == addr.street &&
                     addr'.city   == addr.city   &&
                     addr'.state  == addr.state)
      where addr' = entry.address

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
