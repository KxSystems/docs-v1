For a long list containing few distinct values, an enumeration can reduce storage requirements. The ‘manual’ way to create an enum (for understanding, not recommended):
```q
q)y:`a`b`c`b`a`b`c`c`c`c`c`c`c
q)x:`a`b`c
q)show e:"i"$x?y;
0 1 2 1 0 1 2 2 2 2 2 2 2i  /these values are what we store instead of y.
q)x e                       /get back the symbols any time from x and e.
`a`b`c`b`a`b`c`c`c`c`c`c`c
q)`x!e / same result as `x$y 
`x$`a`b`c`b`a`b`c`c`c`c`c`c`c
```


## `$` – enum

Syntax: `x $ y`

Where `x` and `y` are lists, `x~distinct x`, and `distinct y` are all items of `x`, returns `y` as an enumeration of `x`.
Using built-in _enum_:
```q
q)show e:`x$y;
`x$`a`b`c`b`a`b`c`c`c`c`c`c`c
```
Values are stored as indexes and so need less space.
```q
q)"i"$e
0 1 2 1 0 1 2 2 2 2 2 2 2i
```
Changing one lookup value (in `x`) has the same effect as changing those values in the enumeration, while the indexes backing `e` are unchanged.
```q
q)x[0]:`o
q)e
x$`o`b`c`b`o`b`c`c`c`c`c`c`c
q)"i"$e
0 1 2 1 0 1 2 2 2 2 2 2 2i
```
To get `x` and `y` from `e`:
```q
q)(key;value)@\:e
`x
`o`b`c`b`o`b`c`c`c`c`c`c`c
```

!!! tip "Ensure all items of `y` are in `x`"
    When creating an enumeration using `$`, the domain of the enumeration must be in `x`, otherwise a cast error will be signalled.
    ```q
    q)y:`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x:`a`b
    q)`x$y
    'cast
    ```
    To expand the domain, use `?` (_enum-extend_) instead of `$`.

<i class="fa fa-hand-o-right"></i> [Q for Mortals: Enumerations](http://code.kx.com/wiki/JB:QforMortals/casting_and_enumerations)


## `?` – enum-extend

Syntax: `x ? y`

Where `y` is a list and `x` is 

- a symbol naming a variable, fills in any missing items in `x`, returns `y` as an enumeration of the variable named in `x` with filling in missing items in it. (Unlike _enum_.)
```q
q)foo:`a`b
q)`foo?`a`b`c`b`a`b`c`c`c`c`c`c`c
`foo$`a`b`c`b`a`b`c`c`c`c`c`c`c
q)foo
`a`b`c
```
Note that `?` retains the attr of the right-argument but `$` does not.
```q
q)`foo?`g#y
`g#`foo$`g#`a`b`c`b`a`b`c`c`c`c`c`c`c
q)`foo$`g#y
`foo$`a`b`c`b`a`b`c`c`c`c`c`c`c
```


- a filepath symbol and `y` is a list, fills in any missing items in file `x`, loads it into the session as a variable of the same name, and returns `y` as an enumeration of it.
```q
q)bar:`c`d  /about to be overwritten
q)`:bar?`a`b`c`b`a`b`c`c`c`c`c`c`c
`bar$`a`b`c`b`a`b`c`c`c`c`c`c`c
q)\ls -l bar
"-rw-r--r--  1 sjt  staff  16  3 Mar 12:53 bar"
q)bar
`a`b`c
```


## `!` – enumerate

Syntax:`` `x ! y``

Where `x` is a symbol atom naming a variable containing a symbol vector, and `y` is an int vector of indexes into `x`, returns an enumerated symbol list.
```q
q)x:`a`b`c`d
q)`x!1 2 3
`x$`b`c`d
```
