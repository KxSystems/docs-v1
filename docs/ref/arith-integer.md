These functions return integer results from integer arguments. 
(Many will also accept non-integer arguments.) 


## `abs`

Syntax: `abs x` (atomic)

Returns the absolute value of `x`. Null is returned if `x` is null.

```q
q)abs -1.0
1f
q)abs 10 -43 0N
10 43 0N
```


## `+` (add)

Syntax: `x + y` (atomic) 

Where `x` and `y` are numerics, returns their sum.

```q
q)2+3 4 5
5 6 7
q)2000.11.22 + 03:44:55.666
2000.11.22T03:44:55.666
```

`+` is faster than `-`.

<i class="fa fa-hand-o-right"></i> [`.Q.addmonths`](dotq/#qaddmonths)


## `ceiling`

Syntax: `ceiling x` (atomic)

Returns the least integer greater than or equal to `x`. 

```q
q)ceiling -2.1 0 2.1
-2 0 3
```

!!! note "Comparison tolerance; datetime"

    Prior to V3.0, `ceiling` used [comparison tolerance](/cookbook/precision/#comparison-tolerance).

    <pre><code class="language-q">
    q)ceiling 2 + 10 xexp -12 -13
    3 2
    </code></pre>

    Prior to V3.0, `ceiling` accepted datetime. Since V3.0, use `"d"$23:59:59.999+` instead.

    <pre><code class="language-q">
    q)ceiling 2010.05.13T12:30:59.999
    2010.05.14
    q)"d"$23:59:59.999+ 2010.05.13T12:30:59.999
    2010.05.14
    </code></pre>


## `deltas`

Syntax: `deltas y` (uniform)  
Syntax: `deltas[x;y]` (uniform)

Returns differences between consecutive pairs of items of `y`. It applies to all numeric and date types.

Where applied as 

- a binary function, the result is

```q
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

    <pre><code class="language-q">
    q)update diff:deltas price by sym from trade
    </code></pre>

    With `signum` to count the number of up/down/same ticks:

    <pre><code class="language-q">
    q)select count i by signum deltas price from trade
    price| x
    -----| ----
    -1   | 247
    0    | 3
    1    | 252
    </code></pre>

<i class="fa fa-hand-o-right"></i> [each-prior](adverbs/#each-prior), [differ](comparison/#differ), [ratios](arith-float/#ratios)


## `div`

Syntax: `x div y` (atomic) 

**Integer division**: returns `floor x%y`.

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

<i class="fa fa-hand-o-right"></i> [`%` float division](arith-float/#divide)


## `floor`

Syntax: `floor x` (atomic)

Returns the greatest integer less than or equal to `x`. 

```q
q)floor -2.1 0 2.1
-3 0 2
```

!!! note "Comparison tolerance; datetime"

    Prior to V3.0, `floor` used [comparison tolerance](/cookbook/precision/#comparison-tolerance).

    <pre><code class="language-q">
    q)floor 2 - 10 xexp -12 -13
    1 2
    </code></pre>

    Prior to V3.0, `floor` accepted datetime. Since V3.0, use `"d"$` instead.

    <pre><code class="language-q">
    q)floor 2009.10.03T13:08:00.222
    2009.10.03
    q)"d"$2009.10.03T13:08:00.222
    2009.10.03
    </code></pre>


## `|` `or` (maximum)

Syntax: `x | y` (atomic)  
Syntax: `x or y` (atomic) 

Returns the maximum of `x` and `y`. 

```q
q)2|3
3
q)1010b or 1100b  /logical OR with booleans
1110b
```

<i class="fa fa-hand-o-right"></i> [`or` in Logic](logic/#or-maximum)


## `-` (minus)

Syntax: `x - y`

Returns the difference between conforming numerics `x` and `y`. Slower than `+`.


## `mod`

Syntax: `x mod y` (atomic) 

Where `x` and `y` are numeric types, returns the remainder of `x%y`.

```q
q)-3 -2 -1 0 1 2 3 4 mod 3
0 1 2 0 1 2 0 1
```


## `&` `and` (minimum)

Syntax: `x and y` (atomic)  
Syntax: `x & y` (atomic)

Returns the minimum of `x` and `y`. 

```q
q)2&3
2
q)1010b and 1100b  /logical AND with booleans
1000b
```

<i class="fa fa-hand-o-right"></i> [`and` in Logic](logic/#and-minimum)


## `*` (multiply)

Syntax: `x * y`

Returns the product of conforming numeric atoms or lists `x` and `y`. 


## `neg`

Syntax: `neg x` (atomic)

Returns the negation of `x`. Applies to all data types except sym and char. Applies item-wise to lists, dict values and table columns.

```q
q)neg -1 0 1 2
1 0 -1 -2
```

!!! note "Why not `-`?"

    This is needed because q has no ambivalence for primitives, and `-` is already in use as an operator, i.e. in infix form. 


## `signum`

Syntax: `signum x` (atomic)

Returns -1, 0 or 1 where `x` is negative, zero or positive respectively. Applies item-wise to lists, dictionaries and tables, and to all data types except symbol. Returns -1 for nulls. 

```q
q)signum -2 0 1 3
-1 0 1 1
q)signum (0n;0N;0Nt;0Nd;0Nz;0Nu;0Nv;0Nm;0Nh;0Nj;0Ne)
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
```

!!! tip

    Find counts of price movements by direction:

    <pre><code class="language-q">
    q)select count i by signum deltas price from trade
    </code></pre>


## `sum`

Syntax: `sum x` (aggregate)

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

<i class="fa fa-hand-o-right"></i> [prd](arith-float/#prd), [prds](arith-float/#prds)


## `sums`

Syntax: `sums x` (uniform)

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

<i class="fa fa-hand-o-right"></i> [prd](arith-float/#prd), [prds](arith-float/#prds)


## `til`

Syntax: `til x` 

**Natural numbers until**: where `x` is a non-negative integer, returns the first `x` integers. 

```q
q)til 0
`long$()
q)til 1b
,0
q)til 5
0 1 2 3 4
q)til 5f
'type
  [0]  til 5f
       ^
```

<i class="fa fa-hand-o-right"></i> [`key`](metadata/#key)


## `xbar`

Syntax: `x xbar y` 

**Round down**: returns numeric `y` rounded down to the nearest multiple of integer `x`; `y` can be any numeric or temporal type.

```q
q)3 xbar til 16
0 0 0 3 3 3 6 6 6 9 9 9 12 12 12 15
q)5 xbar 11:00 + 0 2 3 5 7 11 13
11:00 11:00 11:00 11:05 11:05 11:10 11:10
```

Interval bars are useful in aggregation queries. To get last price and total size in 10-minute bars:

```q
q)select last price, sum size by 10 xbar time.minute from trade where sym=`IBM
minute| price size
------| -----------
09:30 | 55.32 90094
09:40 | 54.99 48726
09:50 | 54.93 36511
10:00 | 55.23 35768
...
```

Group symbols by closing price:

```q
q)select sym by 5 xbar close from daily where date=last date
close| sym
-----| ----------------------
25   | `sym$`AIG`DOW`GOOG`PEP,...
30   | `sym$,`AAPL,...
45   | `sym$`HPQ`ORCL,...
...
```

!!! tip "Grouping at irregular intervals"

    To group at irregular intervals, one solution is to use `bin`.

    <pre><code class="language-q">
    q)x:\`s#10:00+00:00 00:08 00:13 00:27 00:30 00:36 00:39 00:50
    q)select count i by x x bin time.minute from ([]time:\`s#10:00:00+asc 100?3600)
    minute| x 
    ------| --
    10:00 | 8 
    10:08 | 13
    10:13 | 24
    10:27 | 4 
    10:30 | 9 
    10:36 | 3 
    10:39 | 19
    10:50 | 20
    </code></pre>

