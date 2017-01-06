## Module Data.Unique

#### `UNIQ`

``` purescript
data UNIQ :: Prim.Effect
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
newUnique :: forall e. Eff (uniq :: UNIQ | e) Unique
```


