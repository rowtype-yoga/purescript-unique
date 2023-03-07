module Data.Unique (Unique, hashUnique, newUnique) where

import Prelude hiding (zero)

import Effect (Effect)
import Effect.Ref (Ref)
import Effect.Ref as Ref
import Effect.Unsafe (unsafePerformEffect)

-- | An abstract unique object.  Objects of type `Unique` may be compared for
-- | equality and ordering and hashed into `Int`.
foreign import data Unique :: Type

foreign import eqImpl :: Unique -> Unique -> Boolean

instance Eq Unique where
  eq = eqImpl

foreign import ordImpl :: Ordering -> Ordering -> Ordering -> Unique -> Unique -> Ordering

instance Ord Unique where
  compare = ordImpl LT EQ GT

foreign import addOne :: Unique -> Unique

foreign import zero :: Unique

-- | Hashes a `Unique` into an `Int`.  Two `Unique`s may hash to the same value,
-- | although in practice this is unlikely.  The `Int` returned makes a good hash
-- | key.
foreign import hashUnique :: Unique -> Int

uniqSource :: Ref Unique
uniqSource = unsafePerformEffect (Ref.new zero)

-- | Creates a new object of type `Unique`.  The value returned will not compare
-- | equal to any other value of type `Unique` returned by previous calls to
-- | `newUnique`. There is no limit on the number of times `newUnique` may be
-- | called.
newUnique :: Effect Unique
newUnique = Ref.modify addOne uniqSource