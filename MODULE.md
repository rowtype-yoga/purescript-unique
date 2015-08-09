# Module Documentation

## Module Data.Unique

#### `Uniq`

``` purescript
data Uniq :: !
```


#### `Unique`

``` purescript
newtype Unique
```


#### `newUnique`

``` purescript
newUnique :: forall e. Eff (uniq :: Uniq | e) Unique
```


#### `showUnique`

``` purescript
instance showUnique :: Show Unique
```


#### `eqUnique`

``` purescript
instance eqUnique :: Eq Unique
```


#### `ordUnique`

``` purescript
instance ordUnique :: Ord Unique
```




