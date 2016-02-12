module Test.Main where

import Prelude ((==), ($), (/=), bind, Unit)
import Data.Unique (newUnique, UNIQ)
import Test.Assert (assert, ASSERT)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)

main :: forall e. Eff (console :: CONSOLE , uniq :: UNIQ , assert :: ASSERT | e) Unit
main = do
  log "Test Data.Unique"
  a <- newUnique
  b <- newUnique
  assert $ a /= b
  assert $ a == a
