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
Show Unique
Eq Unique
Ord Unique
```

#### `newUnique`

``` purescript
newUnique :: forall e. Eff (uniq :: Uniq | e) Unique
```


