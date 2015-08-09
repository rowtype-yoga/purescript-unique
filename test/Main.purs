module Test.Main where

import Prelude
import Data.Unique (newUnique)
import Test.Assert (assert)
import Control.Monad.Eff.Console (log)

main = do
  log "Test Data.Unique"
  a <- newUnique
  b <- newUnique
  assert $ a /= b
