These functions return integer results from integer arguments. 
(Many will also accept non-integer arguments.) 


`abs`
-----

Syntax: `abs x` (unary, atomic)

Returns the absolute value of `x`. Null is returned if `x` is null.
```q
q)abs -1.0
1f
q)abs 10 -43 0N
10 43 0N
```


`and` `&`
---------

Syntax: `x and y` (binary, atomic)  
Syntax: `x & y` (binary, atomic)

Returns the minimum of `x` and `y`. See [Logic/`and`](logicfunctions/#and)


`ceiling`
---------

Syntax: `ceiling x` (unary, atomic)

Returns the least integer greater than or equal to `x`. 
```q
q)ceiling -2.1 0 2.1
-2 0 3
```

!!! note "Comparison tolerance; datetime"
    Prior to V3.0, `ceiling` used [comparison tolerance](Cookbook/ComparisonTolerance "wikilink").
    ```q
    q)ceiling 2 + 10 xexp -12 -13
    3 2
    ```
    Prior to V3.0, `ceiling` accepted datetime. Since V3.0, use `"d"$23:59:59.999+` instead.
    ```q
    q)ceiling 2010.05.13T12:30:59.999
    2010.05.14
    q)"d"$23:59:59.999+ 2010.05.13T12:30:59.999
    2010.05.14
    ```

See also: [`floor`](#floor)


`deltas`
--------

Syntax: `deltas y` (unary, uniform)  
Syntax: `deltas[x;y]` (binary, uniform)

Returns differences between consecutive pairs of items of `y`. It applies to all numeric and date types.

Where applied as 

- a binary function, the result is
```
(-[y 0;x];-[y 1;y 0];-[y 2;y 1];…;-[y n-1;y n-2])
```
```q
q)deltas[0N;1 4 9 16]
0N 3 5 7
```

- a unary function, 0 replaces the `x` in the binary application. 
```q
q)deltas 1 4 9 16
1 3 5 7
```

!!! tip "Examples"
    In a query to get price movements:
    ```q
    q)update diff:deltas price by sym from trade
    ```
    With `signum` to count the number of up/down/same ticks:
    ```q
    q)select count i by signum deltas price from trade
    price| x
    -----| ----
    -1   | 247
    0    | 3
    1    | 252
    ```

See also: [each-prior](higher-order-functions/#each-prior), [differ](searchfunctions/#differ), [ratios](arithmetic-real/#ratios)


`div`
-----

Integer division: returns `floor x%y`.
```q
q)7 div 3
2
```
Preserves (except for char, byte and short) the type of the first argument.
```q
q)7f div 2
3f
q)6i div 4
1i
q)2014.10.13 div 365
2000.01.15
```
The exceptions are as usual char/byte/short which get converted to ints.
```q
q)7h div 3
2i
q)0x80 div 16
8i
q)"\023" div 8
2i
```


`floor`
-------

Syntax: `floor x` (unary, atomic)

Returns the greatest integer less than or equal to `x`. 
```q
q)floor -2.1 0 2.1
-3 0 2
```

!!! note "Comparison tolerance; datetime"
    Prior to V3.0, `floor` used [comparison tolerance](Cookbook/ComparisonTolerance "wikilink").
    ```q
    q)floor 2 - 10 xexp -12 -13
    1 2
    ```
    Prior to V3.0, `floor` accepted datetime. Since V3.0, use `"d"$` instead.
    ```q
    q)floor 2009.10.03T13:08:00.222
    2009.10.03
    q)"d"$2009.10.03T13:08:00.222
    2009.10.03
    ```

See also: [`ceiling`](#ceiling)


`mod`
----

Syntax: `x mod y` (binary, atomic) 

Where `x` and `y` are numeric types, returns the remainder of `x%y`.
```q
q)-3 -2 -1 0 1 2 3 4 mod 3
0 1 2 0 1 2 0 1
```


`neg`
-----

Syntax: `neg x` (unary, atomic)

Returns the negation of `x`. Applies to all data types except sym and char. Applies item-wise to lists, dict values and table columns.
```q
q)neg -1 0 1 2
1 0 -1 -2
```

!!! note "Why not `-`?"
    This is needed because q has no ambivalence, and `-` is already in use as an operator, i.e. in infix form. 


`or` `|`
--------

Syntax: `x or y` (binary, atomic)  
Syntax: `x | y` (binary, atomic)

Returns the minimum of `x` and `y`. See [Logic/`or`](logicfunctions/#or)


`signum`
--------

Syntax: `signum x` (unary, atomic)

Returns -1, 0 or 1 where `x` is negative, zero or positive respectively. Applies item-wise to lists, dictionaries and tables, and to all data types except symbol. Returns -1 for nulls. 
```q
q)signum -2 0 1 3
-1 0 1 1
q)signum (0n;0N;0Nt;0Nd;0Nz;0Nu;0Nv;0Nm;0Nh;0Nj;0Ne)
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
```

!!! tip
    Find counts of price movements by direction:
    ```q
    q)select count i by signum deltas price from trade
    ```


`sum`
-----

Syntax: `sum x` (unary, aggregate)

Where `x` is

- a simple numeric list, returns the sums of its items
- an atom, returns `x`
- a list of numeric lists, returns their sums

Nulls are treated as zeros.
```q
q)sum 7                         / sum atom (returned unchanged)
7
q)sum 2 3 5 7                   / sum list
17
q)sum 2 3 0N 7                  / 0N is treated as 0
12
q)sum (1 2 3 4;2 3 5 7)         / sum list of lists
3 5 8 11                        / same as 1 2 3 4 + 2 3 5 7
q)\l sp.q
q)select sum qty by s from sp   / use in select statement
s | qty
--| ----
s1| 1600
s2| 700
s3| 200
s4| 600
q)sum "abc"                     / type error if list is not numeric
'type
q)sum (0n 8;8 0n) / n.b. sum list of vectors does not ignore nulls
0n 0n
q)sum 0n 8 / the vector case was modified to match sql92 (ignore nulls)
8f
q)sum each flip(0n 8;8 0n) /do this to fall back to vector case
8 8f
```

See also: [prd](arithmetic-real/#prd), [prds](arithmetic-real/#prds), [`sums`](#sums)


`sums`
------

Syntax: `sums x` (unary, uniform)

Returns the cumulative sums of the items of `x`. The sum of an atom is itself. Nulls are treated as zeros.
```q
q)sums 7                        / cumulative sum atom (returned unchanged)
7
q)sums 2 3 5 7                  / cumulative sum list
2 5 10 17
q)sums 2 3 0N 7                 / 0N is treated as 0
2 5 5 12
q)sums (1 2 3;2 3 5)            / cumulative sum list of lists
1 2 3                           / same as (1 2 3;1 2 3 + 2 3 5)
3 5 8
q)\l sp.q
q)select sums qty by s from sp  / use in select statement
s | qty
--| --------------------------
s1| 300 500 900 1100 1200 1600
s2| 300 700
s3| ,200
s4| 100 300 600
q)sums "abc"                    / type error if list is not numeric
'type
```

See also: [prd](arithmetic-real/#prd), [prds](arithmetic-real/#prds), [`sum`](#sum)


