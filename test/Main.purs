module Test.Main where

import Prelude ((==), ($), (/=), discard, bind, Unit)
import Data.Unique (newUnique)
import Test.Assert (assert)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "Test Data.Unique"
  a <- newUnique
  b <- newUnique
  assert $ a /= b
  assert $ a == a
