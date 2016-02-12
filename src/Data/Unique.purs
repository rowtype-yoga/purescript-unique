module Data.Unique
  ( newUnique
  , Unique()
  , UNIQ()
  ) where

import Control.Monad.Eff
import Prelude

foreign import data UNIQ :: !

newtype Unique = Unique String

foreign import newUnique :: forall e. Eff (uniq :: UNIQ | e) Unique

instance showUnique :: Show Unique where
  show (Unique a) = a

instance eqUnique :: Eq Unique where
  eq (Unique a) (Unique b) = a == b

instance ordUnique :: Ord Unique where
  compare (Unique a) (Unique b) = compare a b
