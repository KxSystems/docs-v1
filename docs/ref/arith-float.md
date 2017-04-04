These functions return floating-point results.

## `%` (divide)

Syntax: `x % y` (atomic)  

where `x` and `y` are numeric, returns a float. Note that this is different from some other programming languages, e.g. C++.
```q
q)2%3
0.6666667
```
<i class="fa fa-hand-o-right"></i> [`div` integer division](arith-integer/#div),  [Q for Mortals](http://code.kx.com/q4m3/4_Operators/#44-basic-arithmetic-)


## `exp`

Syntax: ``exp x`` (atomic)

Returns _e_<sup>x</sup>, where _e_ is the base of natural logarithms.
```q
q)exp 1
2.718282
q)exp 0.5
1.648721
q)exp -4.2 0 0.1 0n 0w
0.01499558 1 1.105171 0n 0w
```


## `log`

Syntax: `log x` (atomic)

Returns the natural logarithm of `x`. Null is returned if the argument is negative, and negative infinity where x is 0.
```q
q)log 1
0f
q)log 0.5
-0.6931472
q)log exp 42
42f
q)log -2 0n 0 0.1 1 42
0n 0n -0w -2.302585 0 3.73767
```


## `prd`

Syntax: `prd x` (aggregate)

Product: where x is

- a simple numeric list, returns the product of the items of `x`
- an atom, returns `x`
- a list of numeric lists, returns their products

Nulls are treated as 1s.
```q
q)prd 7                    / product of atom (returned unchanged)
7
q)prd 2 3 5 7              / product of list
210
q)prd 2 3 0N 7             / 0N is treated as 1
42
q)prd (1 2 3 4;2 3 5 7)    / product of list of lists
2 6 15 28
q)prd "abc"
'type
```

<i class="fa fa-hand-o-right"></i> [`sum`](arith-integer/#sum), [`sums`](arith-integer/#sums) 


## `prds`

Syntax: `prds x` (atomic)

Returns the cumulative products of the items of `x`. The product of an atom is itself. Nulls are treated as 1s.
```q
q)prds 7                     / atom is returned unchanged
7
q)prds 2 3 5 7               / cumulative products of list
2 6 30 210
q)prds 2 3 0N 7              / 0N is treated as 1
2 6 6 42
q)prds (1 2 3;2 3 5)         / cumulative products of list of lists
1 2 3                        / same as (1 2 3;1 2 3 * 2 3 5)
2 6 15
q)prds "abc"                 / type error if list is not numeric
'type
```

<i class="fa fa-hand-o-right"></i> [`sum`](arith-integer/#sum), [`sums`](arith-integer/#sums) 


## `ratios`

Syntax: `ratios y` (uniform)  
Syntax: `ratios[x;y]` (uniform)

Returns the ratios of consecutive pairs of items of numeric list `y`.

Where applied as: 

- a binary function, the result is
```
(%[y 0;x];%[y 1;y 0];%[y 2;y 1];…;%[y n-1;y n-2])
```
```q
q)ratios[5;1 2 4 6 7 10]
0.2 2 2 1.5 1.166667 1.428571
```

- a unary function, 1 replaces the `x` in the binary application.
```q
q)ratios 1 2 4 6 7 10
1 2 2 1.5 1.166667 1.428571
```

!!! tip "Example"
    In a query to get returns on prices:
    ```q
    q)update ret:ratios price by sym from trade
    q)select log ratios price from trade
    ```

<i class="fa fa-hand-o-right"></i> [each-prior](adverbs/#each-prior), [`differ`](comparison/#differ)


## `reciprocal`

Syntax: `reciprocal x` (atomic)

Returns the reciprocal of `x`.
```q
q)reciprocal 0 0w 0n 3 10
0w 0 0n 0.3333333 0.1
```


## `sqrt`

Syntax: `sqrt x` (atomic)

Returns the square root of `x`. Where `x` is negative or null, the result is null.
```q
q)sqrt -1 0n 0 25 50
0n 0n 0 5 7.071068
```


## `xexp`

Syntax: `x xexp y` (atomic)

_To the power_: returns x<sup>y</sup>.
```q
q)2 xexp 8
256f
q)9 xexp 0.5
3f
q)1.5 xexp -4.2 0 0.1 0n 0w
0.1821448 1 1.04138 0n 0w
```

!!! Note
    The calculation is performed as `exp y * log x`. Note that if `y` is integer, this is not identical to `prd y#x`.
    ```q
    q)\P 0
    q)prd 3#2
    8
    q)2 xexp 3
    7.9999999999999982
    q)exp 3 * log 2
    7.9999999999999982
    ```


## `xlog`

Syntax: `x xlog y` (atomic)

Returns the base-x logarithm of `y`. Where `y` is negative or zero, the result is null and negative infinity respectively.
```q
q)2 xlog 8
3f
q)2 xlog 0.125
-3f
q)1.5 xlog 0 0.125 1 3 0n
-0w -5.128534 0 2.709511 0n
```

!!! note "xlog and xexp"
    `xlog` is the inverse of `xexp`. Where both are defined, `y=x xexp x xlog y`.
    ```q
    q)2 xexp 2 xlog -1 0 0.125 1 42
    0n 0 0.125 1 42
    ```

