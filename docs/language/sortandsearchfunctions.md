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


find `?`
--------

Syntax: `x?y` (binary)

Where: 

- `x` is a list
- `y` is any data object

returns the lowest index for which `y` matches an item of `x` – the ‘first occurrence’. If there is no match the result is the count of `x`. Comparisons are exact, and are not subject to comparison tolerance.
```q
q)w:10 -8 3 5 -1 2 3
q)w?-8
1
q)w[1]
-8
q)w?3 / the first occurrence of 3
2
q)w?17 / not found
7
q)w[7]
0N
q)"abcde"?"d"
3
```
_Find_ is type-specific relative to `x`. Where:

- `x` is a simple list and `y` a list whose atoms are all the same type as `x`, the result corresponds to `x` item-by-item.
```q
q)rt:(10 5 -1;-8;3 17)
q)i:w?rt
q)i
(0 3 4;1;2 7)
q)w[i]
(10 5 -1;-8;3 0N)
```

- `x` is a list of lists and `y` is a simple list, items of `x` are matched with the whole of `y`.
```q
q)u:("abcde";10 2 -6;(2 3;`ab))
q)u?10 2 -6
1
q)u?"abcde"
0
```

- where `x` is a mixed list then items of `x` are matched with items of `y`.
```q
q)u?(2 3;`ab)
3 3
```
In this case _find_ matches items of `x` with `2` `3` and `` `ab `` , not `(2 3;`ab) ``.

<aside class="comment" markdown="1">
Where is _rank_ defined?
</aside>

!!! Note "_Find_ is rank-sensitive"
    `x?y` can’t deal with mixed-rank `x`. If rank `x` is _n_ then `x?y` looks for objects of rank _n_-1.
    ```q
    2 3?2 3#til 6  / looks for rank 0 objects
    (0 1 2;4 5)?2 3#til 6 / looks for rank 1 objects
    ```
    A solution to find ``(2 3;`ab)`` is
    ```q
    q)f:{where x~\:y}
    q)f[u;(2 3;`ab)]
    ,2
    ```

!!! note "Searching tables"
    Where `x` is a table then `y` must be a compatible record (dictionary or list) or table. That is, each column of `x`, paired with the corresponding item of `y`, must be valid arguments of _find_.
    ```q
    q)\l sp.q
    q)sp?(`s1;`p4;200)
    3
    q)sp?`s`p`qty!(`s2;`p5;450)
    12
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


