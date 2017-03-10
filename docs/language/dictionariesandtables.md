## `!` dict

Syntax: `x ! y`

Where `x` and `y` are two lists of the same length, returns a dictionary
```q
q)`a`b`c!1 2 3
a| 1
b| 2
c| 3
```
Because tables are collections of like dictionaries, `!` applied to each member of a list will return a table of that list. For example:
```
q)(`a`b`c!)each(0 0 0;1 2 3;2 4 6)
a b c
-----
0 0 0
1 2 3
2 4 6
```

!!! tip "Flip me"
    The same result may be achieved with `flip`:
    ```q
    q)flip`a`b`c!flip(0 0 0;1 2 3;2 4 6)
    a b c
    -----
    0 0 0
    1 2 3
    2 4 6
    ```


## `!` key

Syntax: `x ! y`

Where `x` is a non-negative integer atom and `y` is a table, returns a table:

- if `x` is positive and `y` is unkeyed, returns `y` with `x` key columns.
```q
q)t:([]a:1 2 3;b:10 20 30;c:`x`y`z)
q)2!t
a b | c
----| -
1 10| x
2 20| y
3 30| z
```
- if `x` is 0, returns an unkeyed table.
```q
q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
q)0!t
a b  c
------
1 10 x
2 20 y
3 30 z
```

!!! tip "amending in place"
    If `y` is a table name, instead of returning a table `!` amends `y`
    ```q
    q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
    q)0!`t
    `t
    q)t
    a b  c
    ------
    1 10 x
    2 20 y
    3 30 z
    ```


