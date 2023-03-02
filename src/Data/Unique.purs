module Data.Unique
  ( newUnique
  , Unique
  ) where

import Effect (Effect)
import Prelude (class Ord, class Eq, class Show, compare, (==))

newtype Unique = Unique String

foreign import newUnique :: Effect Unique

instance showUnique :: Show Unique where
  show (Unique a) = a

instance eqUnique :: Eq Unique where
  eq (Unique a) (Unique b) = a == b

instance ordUnique :: Ord Unique where
  compare (Unique a) (Unique b) = compare a b
