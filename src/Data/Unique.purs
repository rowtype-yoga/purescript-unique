module Data.Unique
  ( newUnique
  , Unique()
  , UNIQ()
  ) where

import Control.Monad.Eff (Eff, kind Effect)
import Prelude (class Ord, class Eq, class Show, compare, (==))

foreign import data UNIQ :: Effect

newtype Unique = Unique String

foreign import newUnique :: forall e. Eff (uniq :: UNIQ | e) Unique

instance showUnique :: Show Unique where
  show (Unique a) = a

instance eqUnique :: Eq Unique where
  eq (Unique a) (Unique b) = a == b

instance ordUnique :: Ord Unique where
  compare (Unique a) (Unique b) = compare a b
