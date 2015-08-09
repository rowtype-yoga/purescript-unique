## Module Data.Unique

#### `Uniq`

``` purescript
data Uniq :: !
```

#### `Unique`

``` purescript
newtype Unique
```

##### Instances
``` purescript
instance showUnique :: Show Unique
instance eqUnique :: Eq Unique
instance ordUnique :: Ord Unique
```

#### `newUnique`

``` purescript
newUnique :: forall e. Eff (uniq :: Uniq | e) Unique
```


