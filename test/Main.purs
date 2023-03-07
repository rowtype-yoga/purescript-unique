module Test.Main where

import Prelude
import Data.Unique (hashUnique, newUnique)
import Test.Assert (assert)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log "Test Data.Unique"
  a <- newUnique
  b <- newUnique
  assert $ a == a
  assert $ a < b
  assert $ hashUnique a == hashUnique a
  assert $ hashUnique a /= hashUnique b