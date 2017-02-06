`all`
-----

Syntax: `all x` (unary, aggregate)

Returns a boolean atom `1b` if all values in its argument are non-zero, and otherwise `0b`. 

It applies to all data types except symbol, first converting the type to boolean if necessary.
```q
q)all 1 2 3=1 2 4
q)all 1 2 3=1 2 3
q)if[all x in y;....]   / use in control structure
```

!!! Note
    `all` is defined as `min` after converting to boolean, i.e. `all x` is equivalent to `min "b"$x`.


`and` `&`
---------

Syntax: `x and y` (binary, atomic)
Syntax: `x & y` (binary, atomic)

Returns the minima of the items in its arguments; applies to all data types except symbol.
```q
q)1100b and 1010b
1000b
q)1b & 10b
10b
q)1b and 0b
0b
```

!!! Note
    The name _and_ is used because it behaves as logical AND on boolean arguments, but is extended to _minimum_ on other data types:
    ```q
    q)-2 0 3 7 & 0 1 3 4
    -2 0 3 4
    ```


`any`
-----

Syntax: `any x` (unary, aggregate)

Returns a boolean atom `1b` if any value in `x` is non-zero, and otherwise `0b`; applies to all data types except symbol, first converting the type to boolean if necessary.
```q
q)any 1 2 3=10 20 4
0b
q)any 1 2 3=1 20 30
1b
q)if[any x in y;....]   / use in control structure
```

!!! note
    `any` is defined as `max` after converting to boolean, i.e. `any x` and `max "b"$x` are equivalent. 


`asc`
-----

Syntax: `asc x` (unary, uniform)

Returns `x` sorted:

-   on a simple list `asc` acts as expected, and sets the `` `s# `` attribute indicating that the list is sorted.
-   on a mixed list, it sorts within datatype.
-   on a dictionary, it sorts by the values and applies the `` `s# `` attribute.
-   on a table, it sorts by the first non-key column and applies the `` `s# `` attribute.

The sort is stable, i.e. it preserves order among equals.
```q
q)asc 2 1 3 4 2 1 2
`s#1 1 2 2 2 3 4
```
In a mixed list the boolean is returned first, then the sorted integers, the sorted characters, and then the date.
```q
q)asc (1;1b;"b";2009.01.01;"a";0)
1b
0
1
"a"
"b"
2009.01.01
```
Note how the type numbers are used in a mixed list.
```q
q)asc(2f;3j;4i;5h)
5h
4i
3
2f
q){(asc;x iasc abs t)fby t:type each x}(2f;3j;4i;5h)  / kind of what asc does
5h
4i
3
2f
```
Sorting a table:
```q
q)t:([]a:3 4 1;b:`a`d`s)
q)asc t
a b
---
1 s
3 a
4 d

q)a:0 1
q)b:a
q)asc b
`s#0 1
q)a
`s#0 1
```


`bin`
-----

Syntax: `x bin y` (binary, atomic)

Returns the index of the _last_ element in `x` which is `<=y`. The result is `-1` for `y` less than the first element of `x`.
`binr` _bin right_, introduced in V3.0 2012.07.26, gives the index of the _first_ element in `x` which is `>=y`.

It uses a binary-search algorithm, which is generally more efficient on large data than the linear-search algorithm used by `?`.

The items of `x` should be sorted ascending although `bin` does not verify that; if the items are not sorted ascending, the result is undefined. `y` can be either an atom or a simple list of the same type as the left argument.

The result `r` can be interpreted as follows: for an atom `y`, `r` is an integer atom whose value is either a valid index of `x` or `-1`. In general:

    r[i]=-1            iff y[i]<x[0]
    r[i]=i             iff x[i]<=y[i]<x[i+1]

and

    r[j]=x bin y[j]    for all j in index of y

Essentially `bin` gives a half-open interval on the left. `bin` is an atomic function of `y`, i.e. the result has the same shape as `y`.

`bin` also operates on tuples and table columns and is the operator used in the functions `aj` and `lj`.

`bin` and `?` on 3 columns find all equijoins on the first 2 cols and then do `bin` or `?` respectively on the 3rd column. `bin` assumes the 3rd column is sorted within the equivalence classes of the first two column pairs (but need not be sorted overall).
```q
q)0 2 4 6 8 10 bin 5
2
q)0 2 4 6 8 10 bin -10 0 4 5 6 20
-1 0 2 2 3 5
```
If the left argument is not unique the result is not the same as would be obtained with `?`:
```q
q)1 2 3 3 4 bin 2 3
1 3
q)1 2 3 3 4 ? 2 3
1 2
```


`count` `(#)`
-------------

Syntax: `count x` (unary, aggregate)  
Syntax: `(#)x` (unary, aggregate)

Returns the number of items in `x` (rows for a table and entries for dictionary). 
Use with `each` to count the number of elements at each level of a list or dictionary.
```q
q)count 42  / an atom has 1 item
1
q)count 1 2 3
3
q)RaggedArray:(1 2 3;4 5;6 7 8 9;0)
q)count RaggedArray
4
q)count each RaggedArray
3 2 4 1
q)RaggedDict:`a`b`c!(1 2;3 4 5;"hello")
q)count RaggedDict
3
q)count each RaggedDict
a| 2
b| 3
c| 5
q)\l sp.q
q)count sp
12
```


`cross`
-------

Syntax: `x cross y`

Returns the cross-product (i.e. all possible combinations) of `x` and `y`.
```q
q)1 2 3 cross 10 20
1 10
1 20
2 10
2 20
3 10
3 20
q)(cross/)(2 3;10;"abc")
2 10 "a"
2 10 "b"
2 10 "c"
3 10 "a"
3 10 "b"
3 10 "c"
```
`cross` can work on tables and dictionaries. 
```q
q)s:`IBM`MSFT`AAPL
q)v:1 2
q)([]s:s)cross([]v:v)
s    v
------
IBM  1
IBM  2
MSFT 1
MSFT 2
AAPL 1
AAPL 2
```


`cut`
-----

Syntax: `x cut y`

Returns `y` split according to `x`:

-  if `x` is a single integer, `cut` splits `y` into a list of items, each of count `x`, for example:
```q
q)4 cut til 10
0 1 2 3
4 5 6 7
8 9
```
-  if `x` is a non-decreasing list of integers, it cuts `y` at the indices given in `x`. The result is a list with the same count as `x`.
```q
q)2 4 9 cut til 10           / the first result item starts at index 2
2 3
4 5 6 7 8
,9
q)
q)2 4 4 9 cut til 10         / cuts are empty for duplicate indices
2 3
`int$()
4 5 6 7 8
,9
```

!!! note
    `cut` is a simple derivative of the primitive `_` (drop/cut). Where `x` is an atom, it cuts `y` into equal-sized parts; otherwise it behaves like `_`.
    ```q
    q)"abcde" _ 3                / drop element with index 3
    "abce"
    q)"abcde" cut 3              / cut works the same
    "abce"
    ```


`desc`
------

Syntax: `desc x` (unary, uniform)

Returns `x` sorted into descending order. The sort is stable: it preserves order among equals. Where `x` is

-   a simple list the result is sorted, and the `` `s# `` attribute is set.
```q
q)desc 2 1 3 4 2 1 2
4 3 2 2 2 1 1
```
-   a mixed list, the result is sorted within datatype.
```q
q)desc (1;1b;"b";2009.01.01;"a";0)
2009.01.01
"b"
"a"
1
0
1b
```
-   a dictionary or table, the result has the `` `s# `` attribute set on the first key value or column respectively (if possible), and is sorted by that key or column.
```q
q)t:([]a:3 4 1;b:`a`d`s)
q)desc t
a b
---
4 d
3 a
1 s
```


`differ`
--------

Syntax: `differ x` (unary, uniform)

Returns a boolean list indicating where consecutive pairs of items in `x` differ. 
It applies to all data types.
The first item of the result is always `1b`:

    r[i]=1b                 for i=0
    r[i]=not A[i]~A[i-1]    otherwise

```
q)differ`IBM`IBM`MSFT`CSCO`CSCO
10110b
q)differ 1 3 3 4 5 6 6
1101110b
```
Split a table with multiple dates into a list of tables with distinct dates.
```q
q)d:2009.10.01+asc 100?30
q)s:100?`IBM`MSFT`CSCO
q)t:([]date:d;sym:s;price:100?100f;size:100?1000)
q)i:where differ t[`date]    / indices where dates differ
q)tlist:i _ t                / list of tables with one date per table
q)tlist 0
date       sym  price    size
-----------------------------
2009.10.01 IBM  37.95179 710
2009.10.01 CSCO 52.908   594
2009.10.01 MSFT 32.87258 250
2009.10.01 CSCO 75.15704 592
q)tlist 1
date       sym  price   size
----------------------------
2009.10.02 MSFT 18.9035 26
2009.10.02 CSCO 12.7531 760
```


`distinct`
----------

Syntax: `distinct x` (unary)

Returns the distinct (unique) elements of `x`.
```q
q)distinct 2 3 7 3 5 3
2 3 7 5
```
Returns the distinct rows of a table.
```q
q)distinct flip `a`b`c!(1 2 1;2 3 2;"aba")
a b c
-----
1 2 a
2 3 b
```
It does not use comparison tolerance:
```q
q)\P 14
q)distinct 2 + 0f,10 xexp -13
2 2.0000000000001
```


`enlist`
--------

Syntax: `enlist x` 

Returns its argument/s in a list. Where `x` is a dictionary, the result is the corresponding table.

An atom is not a one-item list. `enlist` and `first` will convert between the two.
```q
q)a:10
q)b:enlist a
q)c:enlist b
q)type each (a;b;c)
-6 6 0h
q)a~b
0b
q)a~first b
1b
q)b~c
0b
q)b~first c
1b
```
With multiple arguments returns a single list.
```q
q)show a:enlist[til 5;`ibm`goog;"hello"]
0 1 2 3 4
`ibm`goog
"hello"
q)count a
3
```
Returns a table from a dictionary.
```q
q)enlist `a`b`c!1 3 4
a b c
-----
1 3 4
```


`except`
--------

Syntax: `x except y` (binary)

Returns all items of list `x` that are not (items of) list or atom `y`.
```q
q)1 2 3 except 2
1 3
q)1 2 3 4 1 3 except 2 3
1 4 1
```


fill `^`
--------

Syntax: `x^y` (binary, atomic) 

Returns `y` with any nulls replaced by the corresponding item of `x`.
```q
q)0^1 2 3 0N
1 2 3 0
q)100^1 2 -5 0N 10 0N
1 2 -5 100 10 100
q)1.0^1.2 -4.5 0n 0n 15
1.2 -4.5 1 1 15
q)`nobody^`tom`dick``harry
`tom`dick`nobody`harry
q)1 2 3 4 5^6 0N 8 9 0N
6 2 8 9 5
```
Integer `x` items are promoted when `y` is float or real.
```q
q)a:11.0 2.1 3.1 0n 4.5 0n
q)type a
9h
q)10^a
11 2.1 3.1 10 4.5 10
q)type 10^a
9h
```
When `x` and `y` are dictionaries, both null and missing values in `y` are filled with those from `x`.
```q
q)(`a`b`c!1 2 3)^`b`c!0N 30
a| 1
b| 2
c| 30
```


`fills`
-------

Syntax: `fills x` (uniform)

Returns `x` with any nulls replaced by their preceding non-null values, if any.
```q
q)fills 0N 2 3 0N 0N 7 0N
0N 2 3 3 3 7 7
```

!!! Tips
    To back-fill, reverse the list and the result:
    ```q
    q)reverse fills reverse 0N 2 3 0N 0N 7 0N
    2 2 3 7 7 7 0N
    ```
    For a similar function on infinities, first replace them with nulls:
    ```q
    q)fills {(x where x=0W):0N;x} 0N 2 3 0W 0N 7 0W
    0N 2 3 3 3 7 7
    ```


`first`
-------

Syntax: `first x` (unary, aggregate)

Returns the first item of `x`.

Returns an atom from a simple list, and otherwise reduces the level of nesting of a list. Often used with `each` to get the first item of each item of a list, or of each key in a dictionary.
```q
q)first 1 2 3 4 5
1
q)first 42
42
q)RaggedArray:(1 2 3;4 5;6 7 8 9;0)
q)first each RaggedArray
1 4 6 0
q)RaggedDict:`a`b`c!(1 2;3 4 5;"hello")
q)first RaggedDict  / value of first key
1 2
q)first each RaggedDict
a| 1
b| 3
c| "h"
```
Returns the first row of a table.
```q
q)\l sp.q
q)first sp
s  | `s$`s1
p  | `p$`p1
qty| 300
```
`first` is the dual to `enlist`.
```q
q)a:10
q)a~first enlist 10
1b
q)a~first first enlist enlist 10
1b
```



`flip`
------

Syntax: `flip x`

Returns `x` transposed, where `x` may be a list of lists, a dictionary or a table. 

In a list of lists, each list must be the same length.
```q
q)flip (1 2 3;4 5 6)
1 4
2 5
3 6
```
The flip of a dictionary is a table, and vice versa. If `x` is a dictionary where the keys are a list of symbols, and the values are lists of the same count (or atoms), then `flip x` will return a table. The flip of a table is a dictionary.
```q
q)D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100)
q)flip D
sym  price size
---------------
IBM  10.2  100
MSFT 23.45 100
q)D~flip flip D
1b
```


