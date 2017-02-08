<aside class="comment" markdown="1">
Lists **underlying functions** irrespective of whether denoted by a glyph, a reserved word, or both.

Divide this page into shorter pages such as _Sorting and searching_, _Selecting items_
</aside>


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


`iasc`
------

Syntax: `iasc x` (unary, uniform)

Returns the indices needed to sort list `x` in ascending order. (See [`asc`](#asc).)
```q
q)L:2 1 3 4 2 1 2
q)iasc L
1 5 0 4 6 2 3
q)L iasc L
1 1 2 2 2 3 4
q)(asc L)~L iasc L
1b
```


`idesc`
-------

Syntax: `idesc x`

Returns the indices needed to sort list `x` in descending order. (See [`desc`](#desc).)
```q
q)L:2 1 3 4 2 1 2
q)idesc L
3 2 0 4 6 1 5
q)L idesc L
4 3 2 2 2 1 1
q)(desc L)~L idesc L
1b
```


`in`
----

Syntax: `x in y` (binary)

Returns a boolean indicating: 

- where the first item of `y` is an atom, which items of `x` are also items of `y` (list, same count as `x`)
- otherwise, whether `x` is an item of `y` (atom) 

```q
q)1 3 7 6 4 in 5 4 1 6        / which of x are in y
10011b
q)1 2 in (9;(1 2;3 4))        / none of x are in y
00b
q)1 2 in (1 2;9)              / 1 2 is an item of y
1b
q)1 2 in ((1 2;3 4);9)        / 1 2 is not an item of y
0b
q)(1 2;3 4) in ((1 2;3 4);9)  / x is an item of y
1b
```

!!! tip "`in` is often used with `select`"
    ```q
    q)\l sp.q
    q)select from p where city in `paris`rome
    p | name  color weight city
    --| ------------------------
    p2| bolt  green 17     paris
    p3| screw blue  17     rome
    p5| cam   blue  12     paris
    ```



`inter`
-------

Syntax: `x inter y` (binary)

Returns all items of `x` found in `y`, using the result of `x in y` to select items from `x`.

```q
q)1 3 4 2 inter 2 3 5 7 11
3 2
```
Returns common values from dictionaries:
```q
q)show x:(`a`b)!(1 2 3;`x`y`z)
a| 1 2 3
b| x y z
q)show y:(`a`b`c)!(1 2 3;2 3 5;`x`y`z)
a| 1 2 3
b| 2 3 5
c| x y z
q)
q)x inter y
1 2 3
x y z
q)
```
Returns common rows from unkeyed tables.
```q
q)show x:([]a:`x`y`z`t;b:10 20 30 40)
a b
----
x 10
y 20
z 30
t 40
q)show y:([]a:`y`t`x;b:50 40 10)
a b
----
y 50
t 40
x 10
q)x inter y
a b
----
x 10
t 40
```


`last`
------

Syntax: `last x` (unary)

Returns the last item of `x`, or last value where `x` is a dictionary.
```q
q)last til 10
9
q)last `a`b`c!1 2 3
3
```


`next`
------

Syntax: `next x` (unary, uniform)

For each item in `x`, returns the next item. For the last item, it returns a null if the list is simple (a homogeneous list), and an empty list `()` otherwise.
```q
q)next 2 3 5 7 11
3 5 7 11 0N
q)next (1 2;"abc";`ibm)
"abc"
`ibm
`int$()
```
Duration of a quote:
```q
q)update (next time)-time by sym from quote
```


`prev`
------

Syntax: `prev x` (unary, uniform)

For each item in `x`, returns the previous item. For the first item, it returns a null if the list is simple (a homogeneous list), and an empty list `()` otherwise.
```q
q)prev 2 3 5 7 11
0N 2 3 5 7
q)prev (1 2;"abc";`ibm)
`int$()
1 2
"abc"
```
Shift the times in a table:
```q
q)update time:prev time by sym from t
```


`rank`
------

Syntax: `rank x` (unary, uniform)

For each item in `x` returns the index of where it would occur in the sorted list. 

This is the same as calling `iasc` twice on the list.
```q
q)rank 2 7 3 2 5
0 4 2 1 3
q)iasc 2 7 3 2 5
0 3 2 4 1
q)iasc iasc 2 7 3 2 5            / same as rank
0 4 2 1 3
q)asc[2 7 3 2 5] rank 2 7 3 2 5  / identity
2 7 3 2 5
q)iasc idesc 2 7 3 2 5           / descending rank
3 0 2 4 1
```


`raze`
------

Syntax: `raze x` (unary)

Returns the items of `x` joined, collapsing one level of nesting. 

To collapse all levels, use [converge](higher-order-functions#converge) i.e. `raze/[x]`.
```q
q)raze (1 2;3 4 5)
1 2 3 4 5
q)b:(1 2;(3 4;5 6);7;8)
q)raze b                 / flatten one level
1
2
3 4
5 6
7
8
q)raze/[b]               / flatten all levels
1 2 3 4 5 6 7 8
q)raze 42                / atom returned as a list
,42
```
Returns the flattened values from a dictionary.
```q
q)d:`q`w`e!(1 2;3 4;5 6)
q)value d
1 2
3 4
5 6
q)raze d
1 2 3 4 5 6
```

!!! warning "Use only on items that can be joined"
    `raze` is defined in k as `,/` and requires items that can be joined together. 
    ```q
    q)d:`a`b!(1 2;3 5)
    q)10,d          / cannot join integer and dictionary
    'type
    q)raze (10;d)   / raze will not work
    'type
    ```


`reverse` (|)
-------------

Syntax: `reverse x` (unary, uniform)

Returns the items of `x` in reverse order.
```q
q)reverse 1 2 3 4
4 3 2 1
q)(|)1 2 3 4
4 3 2 1
```
On atoms, returns the atom; on dictionaries, reverses the keys; and on tables, reverses the columns:
```q
q)d:`a`b!(1 2 3;"xyz")
q)reverse d
b| x y z
a| 1 2 3
q)reverse each d
a| 3 2 1
b| z y x
q)reverse flip d
a b
---
3 z
2 y
1 x
```


`rotate`
--------

Syntax: `x rotate y` (binary, uniform)

Returns list or table `y` rotated by `x` items: to the ‘left’ for positive `x`, to the ‘right’ for negative `x`.
```q
q)2 rotate 2 3 5 7 11    / rotate a list
5 7 11 2 3
q)-2 rotate 2 3 5 7 11
7 11 2 3 5
q)t:([]a:1 2 3;b:"xyz")
q)1 rotate t             / rotate a table
a b
---
2 y
3 z
1 x
```


`sublist`
---------

Syntax: `x sublist y` (binary)

Returns a sublist of `y`. The result contains only as many items as are available in `y`.

Where 

- `x` is an integer atom, it returns `x` items from the beginning of `y` if positive, or from the end if negative.
```q
q)p:2 3 5 7 11
q)3 sublist p                           / 3 from the front
2 3 5
q)10 sublist p                          / only available values
2 3 5 7 11
q)2 sublist `a`b`c!(1 2 3;"xyz";2 3 5)  / 2 keys from a dictionary
a| 1 2 3
b| x y z
q)-3 sublist sp                         / last 3 rows of a table
s p qty
-------
3 1 200
3 3 300
0 4 400
```
- `x` is an integer pair, it returns `x[1]` items from `y`, starting at item `x[0]`.
```q
q)1 2 sublist p  / 2 items starting from position 1
3 5
```


`sv`
----

Syntax: `x sv y` (binary)

Scalar from vector: returns an atom. Where:

- (**join strings**) `y` is a list of strings, and `x` is a character or string, returns the strings in `y`, separated by `x`. Where `x` is the back tick `` ` ``, the strings are separated by the host line separator  – `\n` on Unix, `\r\n` on Windows.
```q
q)"," sv ("one";"two";"three")    / comma separated
"one,two,three"
q)"\t" sv ("one";"two";"three")   / tab separated
"one\ttwo\tthree"
q)", " sv ("one";"two";"three")   / x may be a string
"one, two, three"
q)"." sv string 192 168 1 23      / form IP address
"192.168.1.23"
q)` sv ("one";"two";"three")      / use host line separator
"one\ntwo\nthree\n"
```

- (**join path components**) `y` is a symbol list of which the first item is a file handle, it returns a file handle where the items of the list are joined, separated by slashes. This is useful when building file paths.
```q
q)` sv `:/home/kdb/q`data`2010.03.22`trade
`:/home/kdb/q/data/2010.03.22/trade
```
If the first element is not a file handle, returns a symbol where the elements are joined, separated by `.` (dot). This is useful for building filenames with a given extension:
```q
q)` sv `mywork`dat
`mywork.dat
```

- (**base conversion**) `x` and `y` are numeric, `y` is evaluated to base `x`, which may be a list.
```q
q)10 sv 2 3 5 7
2357
q)100 sv 2010 3 17
20100317
```q)0 24 60 60 sv 2 3 5 7   / 2 days, 3 hours, 5 minutes, 7 seconds
183907
```

!!! note 
    when `X` is a list, the first number is not used. The calculation is done as:
    ```q
    q)baseval:{y wsum reverse prds 1,reverse 1_x}
    q)baseval[0 24 60 60;2 3 5 7]
    183907f
    ```

- (**bytes to integer**) `x` is `0x0` and `y` is a list of bytes of length 2, 4 or 8, the result is `y` converted to the corresponding integer.
```q
q)0x0 sv "x" $0 255           / short
255h
q)0x0 sv "x" $128 255
-32513h
q)0x0 sv "x" $0 64 128 255    / int
4227327
q)0x0 sv "x" $til 8           / long
283686952306183j
q)256j sv til 8               / same calculation
283686952306183j
```

!!! tip "Converting non integers" 
    Use [`1:`](Reference/OneColon "wikilink") – eg:
    ```q
    q)show a:0x0 vs 3.1415
    0x400921cac083126f
    q)(enlist 8;enlist "f")1: a   /float
    3.1415
    ```

- (**bits to integer**) `x` is `0b` and `y` is a list of booleans of length 8, 16, 32, or 64 the result is `y` converted to the corresponding integer or — in the case of 8 bits — a byte value
```q
q)0b sv 64#1b
-1
q)0b sv 32#1b
-1i
q)0b sv 16#1b
-1h
q)0b sv 8#1b
0xff
```


`vs`
----

Syntax: `x vs y` (binary)

Vector from scalar: returns a list (vector) from each atom (scalar) in its argument, or may return a list of lists from a list.

Where: 

- (**partitioned string**) `y` is a string, and `x` is a character or string, the result is a list of strings: `y` cut using `X` as the delimiter.
```q
q)"," vs "one,two,three"
"one"
"two"
"three"
q)", " vs "spring, summer, autumn, winter"
"spring"
"summer"
"autumn"
"winter"
q)"|" vs "red|green||blue"
"red"
"green"
""
"blue"
```
If `x` is the back tick `` ` ``, then the result (a) splits symbols on `` `.` ``, (b) breaks file handles into directory and file parts, and (c) breaks a string with embedded line terminators into lines (both Unix `\n` and Windows `\r\n` terminators).
```q
q)` vs `mywork.dat                   / symbol y
`mywork`dat
q)` vs `:/home/kdb/data/mywork.dat   / file handle y
`:/home/kdb/data`mywork.dat
q)` vs "abc\ndef\nghi"               / filestring y
"abc"
"def"
"ghi"
q)` vs "abc\r\ndef\r\nghi"           / filestring y
"abc"
"def"
"ghi"
```

- (**bit representation**) `x` is `0b` and `y` is an integer, the result is the bit representation of `y`.
```q
q)0b vs 23173h
0101101010000101b
q)0b vs 23173
00000000000000000101101010000101b
```

- (**hex representation**) `x` is `0x0` and `y` is a number, the result is the internal representation of `y`, with each byte in hex.
```q
q)0x0 vs 2413h
0x096d
q)0x0 vs 2413
0x0000096d
q)0x0 vs 2413e
0x4516d000
q)0x0 vs 2413f
0x40a2da0000000000
q)"."sv string"h"$0x0 vs .z.a / ip address string from .z.a
"192.168.1.213"
```

- (**base representation**) `x` and `y` are integer, the result is the representation of `y` in base `x`. (Since V3.4t 2015.12.13.)
```q
q)10 vs 1995
1 9 9 5
q)2 vs 9
1 0 0 1
q)24 60 60 vs 3805
1 3 25
q)"." sv string 256 vs .z.a / ip address string from .z.a
"192.168.1.213"
```
If the right argument is an integer list then the result is a matrix with `count[x]` items whose ith column `(x vs y)[;i]` is identical to `x vs y[i]`. More generally, `y` can be any list of integers, and each item of the result is identical to `y` in structure.
```q
q)a:10 vs 1995 1996 1997
q)a
1 1 1
9 9 9
9 9 9
5 6 7
q)a[;0]
1 9 9 5
q)10 vs(1995;1996 1997)
1 1 1
9 9 9
9 9 9
5 6 7
```



`where`
-------

Syntax: `where x` (unary)

Where `x` is: 

- a list of non-zero integers, the result is a simple list containing, for each item of `x`, that number of copies of its index. 
```q
q)where 2 3 0 1
0 0 1 1 1 3
q)raze x #' til count x:2 3 0 1
0 0 1 1 1 3
```

!!! tip 
    Where `x` is a boolean list, the result is the indices of the 1s. Thus `where` is often used after a logical test:
    ```q
    q)where 0 1 1 0 1
    1 2 4
    q)x:1 5 6 8 11 17 20 21
    q)where 0 = x mod 2        / indices of even numbers
    2 3 6
    q)x where 0 = x mod 2      / select even numbers from list
    6 8 20
    ```

- a dictionary whose values are non-negative integers, the result is a list of keys repeated as many times as the corresponding value. (If a list is viewed as a mapping from indices to entries, than the definition for the integer list above is a special case.)
    ```q
    q)d:`amr`ibm`msft!2 3 1
    q)where d
    `amr`amr`ibm`ibm`ibm`msft
    q)where 2 3 0 1               / usual operation on integer list
    0 0 1 1 1 3
    q)where 0 1 2 3 ! 2 3 0 1     / same on dictionary with indices as keys
    0 0 1 1 1 3
    ```

See also [where in q-SQL](FIXME)


`within`
--------

Syntax: `x within y` (binary, uniform)

Where `x` is an atom or list of sortable type/s and

- `y` is an ordered pair (i.e. `(</)y` is true) of the same type, the result is a boolean for each item of `x` indicating whether it is within the inclusive bounds given by `y`.
```q
q)1 3 10 6 4 within 2 6
01011b
q)"acyxmpu" within "br"  / chars are ordered
0100110b
q)select sym from ([]sym:`dd`ccc`ccc) where sym within `c`d
sym
---
ccc
ccc
```

- `y` is a pair of lists of length _n_, and `x` a list of length _n_ or an atom, the result is a boolean list of length _n_. 
```q
q)5 within (1 2 6;3 5 7)
010b
q)2 5 6 within (1 2 6;3 5 7)
111b
q)(1 3 10 6 4;"acyxmpu") within ((2;"b");(6;"r"))
01011b
0100110b
```


`xprev`
------

Syntax: `x xprev y` (binary, uniform)

Where `x` is an integer atom and `y` is a list, returns for each item of `y` the item `x` indices before it. The first `x` elements of the result are null, empty or blank as appropriate.

!!! Tip 
    There is no `xnext` function. Fortunately `xprev` with a negative number on the left can achieve this.

```q
q)2 xprev 2 7 5 3 11
0N 0N 2 7 5
q)-2 xprev 2 7 5 3 11
5 3 11 0N 0N
q)1 xprev "abcde"
" abcd"
```


`xrank`
-------

Syntax: `x xrank y` (binary)

Where `x` is an integer, and `y` is of sortable type, the result is a list of length `x` containing the items of `y` grouped by value. If the total number of items is evenly divisible by `x`, then each item of the result will have the same length; otherwise the first items are longer.

```q
q)4 xrank til 8          / equal size buckets
0 0 1 1 2 2 3 3
q)4 xrank til 9          / first bucket has extra
0 0 0 1 1 2 2 3 3
q)
q)3 xrank 1 37 5 4 0 3   / outlier 37 does not get its own bucket
0 2 2 1 0 1
q)3 xrank 1 7 5 4 0 3    / same as above
0 2 2 1 0 1
```
Example using stock data:
```q
q)show t:flip `val`name!((20?20);(20?(`MSFT`ORCL`CSCO)))
val name
--------
17  MSFT
1   CSCO
14  CSCO
13  ORCL
13  ORCL
9   ORCL
...

q)select Min:min val,Max:max val,Count:count i by bucket:4 xrank val from t
bucket| Min Max Count
------| -------------
0     | 0   7   5
1     | 9   12  5
2     | 13  15  5
3     | 15  17  5
```


