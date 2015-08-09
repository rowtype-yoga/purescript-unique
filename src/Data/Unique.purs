module Data.Unique
  ( newUnique
  , Unique()
  , Uniq()
  ) where

import Control.Monad.Eff

foreign import data Uniq :: !

newtype Unique = Unique String

foreign import newUnique """
  var newUnique = (function() {
    var MAX_SAFE_INTEGER = 9007199254740991;
    var uniqueSource = [];
    function iter(i) {
      if(uniqueSource.length === i) {
        for(var j = 0; j < i; ++j) uniqueSource[j] = 0;
        uniqueSource[i] = 1;
      } else {
        if(uniqueSource[i] === MAX_SAFE_INTEGER) {
          uniqueSource[i] = 0;
          iter(i + 1);
        } else {
          uniqueSource[i]++;
        }
      }
    };
    return function() {
      iter(0);
      return uniqueSource.length === 1 ? (uniqueSource[0] + "") : uniqueSource.join(',');
    };
  })();""" :: forall e. Eff (uniq :: Uniq | e) Unique

instance showUnique :: Show Unique where
  show (Unique a) = a

instance eqUnique :: Eq Unique where
  (==) (Unique a) (Unique b) = a == b
  (/=) (Unique a) (Unique b) = a /= b

instance ordUnique :: Ord Unique where
  compare (Unique a) (Unique b) = compare a b
