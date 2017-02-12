`avg`
-----

Syntax: `avg x` (unary, aggregate)

Returns the arithmetic mean of numeric list `x`. the mean of an atom is itself. Null is returned if `x` is empty, or contains both positive and negative infinity. Any null elements in `x` are ignored.
```q
q)avg 1 2 3
2f
q)avg 1 0n 2 3       / null values are ignored
2f
q)avg 1.0 0w
0w
q)avg -0w 0w
0n
q)\l trade.q
q)show select ap:avg price by sym from trade
sym| ap
---| -----
a  | 10.75
```


`avgs`
------

Syntax: `avgs x` (unary, uniform)

Returns the running averages of numeric list `x`, i.e. applies function `avg` to successive prefixes of `x`.
```q
q)avgs 1 2 3 0n 4 -0w 0w
1 1.5 2 2 2.5 -0w 0n
```


`cor`
-----

Syntax: `x cor y` (binary, aggregate)

Returns the correlation coefficient of `x` and `y` as a floating point number in the range `-1f` to `1f`. Applies to all numeric data types and signals an error with temporal types, char and sym.

```q
q)29 10 54 cor 1 3 9
0.7727746
q)10 29 54 cor 1 3 9
0.9795734
q)1 3 9 cor neg 1 3 9
-1f

q)select price cor size by sym from trade
```

!!! note "Correlation"
    Perfectly correlated data results in a `1` or `-1`. When one variable increases as the other increases the correlation is positive; when one decreases as the other increases it is negative. Completely uncorrelated arguments return `0f`. Arguments must be of the same length.


`cov`
-----

Syntax: `x cov y` (binary, aggregate)

Returns the [covariance](https://en.wikipedia.org/wiki/Covariance) of `x` and `y` as a floating point number. Applies to all numeric data types and signals an error with temporal types, char and sym.
```q
q)2 3 5 7 cov 3 3 5 9
4.5
q)2 3 5 7 cov 4 3 0 2
-1.8125
q)select price cov size by sym from trade
```

<i class="fa fa-hand-o-right"></i> [`cor`](#cor "correlation"), [`scov`](#scov "statistical covariance")


`dev`
-----

Syntax: `dev x` (unary, aggregate)

Returns the standard deviation of list `x` (as the square root of the variance). Applies to all numeric data types and signals an error with temporal types, char and sym.
```q
q)dev 10 343 232 55
134.3484
q)select dev price by sym from trade
```


`ema`
-----

Syntax: `x ema y` (binary, uniform)

Returns the exponentially weighted moving average (EWMA), also known as [exponential moving average](https://en.wikipedia.org/wiki/Moving_average#Exponential_moving_average) (EMA) of numeric list `y`, with `x` as the smoothing parameter.

Example: An impulse response with decay of &frac13;.
```q
q)ema[1%3;1,10#0]
1 0.6666667 0.4444444 0.2962963 0.1975309 0.1316872 0.0877915 
0.05852766 0.03901844 0.02601229 0.01734153
```
Example: 10-day EMA on price, as at [stockcharts.com](http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_averages). Smoothing parameter for EMA over _N_ points is defined as $\frac{2}{1+N}$.
```q
q)p:22.27 22.19 22.08 22.17 22.18 22.13 22.23 22.43 22.24 22.29 22.15 22.39 
22.38 22.61 23.36 24.05 23.75 23.83 23.95 23.63 23.82 23.87 23.65 23.19 23.1 
23.33 22.68 23.1 22.4 22.17
q)(2%1+10)ema p
22.27 22.25545 22.22355 22.21382 22.20767 22.19355 22.20017 22.24196 22.2416 
22.2504 22.23215 22.26085 22.28251 22.34206 22.52714 22.80402 22.97602 
23.13129 23.28014 23.34375 23.43034 23.51028 23.53568 23.47283 23.40505 
23.3914 23.26206 23.23259 23.08121 22.91554
```


`lsq`
-----

Syntax: `x lsq y` (binary)

Matrix divide. Where: 

- `x` and `y` are float matrices with the same number of columns
- the number of rows of `y` do not exceed the number of columns
- the rows of `y` are linearly independent

returns the least-squares solution of `x = (x lsq y) mmu y`. That is, if
```q
d:x - (x lsq y) mmu y
```
then `sum d*d` is minimized. If `y` is a square matrix, `d` is the zero matrix, up to rounding errors.
```q
q)a:1f+3 4#til 12
q)b:4 4#2 7 -2 5 5 3 6 1 -2 5 2 7 5 0 3 4f
q)a lsq b
-0.1233333 0.16      0.4766667 0.28
0.07666667 0.6933333 0.6766667 0.5466667
0.2766667  1.226667  0.8766667 0.8133333
q)a - (a lsq b) mmu b
-4.440892e-16 2.220446e-16 0             0
0             8.881784e-16 -8.881784e-16 8.881784e-16
0             0            0             1.776357e-15
q)a ~ (a lsq b) mmu b      / tolerant match
1b

q)b:3 4#2 7 -2 5 5 3 6 1 -2 5 2 7f
q)a lsq b
-0.1055556 0.3333333 0.4944444
0.1113757  1.031746  0.7113757
0.3283069  1.730159  0.9283069
q)a - (a lsq b) mmu b     / minimum squared difference
0.5333333 -0.7333333 -0.2       0.7333333
1.04127   -1.431746  -0.3904762 1.431746
1.549206  -2.130159  -0.5809524 2.130159
```

!!! tip "Polynomial fitting"
    `lsq` can be used to approximate `x` and `y` values by polynomials.
    ```q
    lsfit:{(enlist y) lsq x xexp/: til 1+z} / fit y to poly in x with degree z
    poly:{[c;x]sum c*x xexp til count c}    / polynomial with coefficients c
    x:til 6
    y:poly[1 5 -3 2] each x   / cubic
    lsfit[x;y] each 1 2 3     / linear,quadratic,cubic(=exact) fits
    -33 37.6
    7 -22.4 12
    1 5 -3 2
    ```

<i class="fa fa-hand-o-right"></i> [`inv`](#inv "matrix inverse"), [`mmu`](#mmu "matrix multiply")


`mavg`
------

Syntax: `x mavg y` (binary, uniform)

Moving average: returns the `x`-item moving average of numeric list `y`, with any nulls after the first element replaced by zero. The first `x` items of the result are the averages of the terms so far, and thereafter the result is the moving average. The result is floating point.

N.B. Infinities (0w) are incompatible with this function.
<aside class="comment" markdown="1">
What does this mean? Including `0w` in `y` doesn’t signal an error.
</aside>

```q
q)2 mavg 1 2 3 5 7 10
1 1.5 2.5 4 6 8.5
q)5 mavg 1 2 3 5 7 10
1 1.5 2 2.75 3.6 5.4
q)5 mavg 0N 2 0N 5 7 0N    / nulls after the first are replaced by 0
0n 2 2 3.5 4.666667 4.666667
```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`mcount`](#mcount "moving count"), [`mdev`](#mdev "moving deviation"), [`mmax`](#mmax "moving maximums"), [`mmin`](#mmin "moving minimums"), [`msum`](#msum "moving sums"), [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F)


`max`
-----

Syntax: `max x` (unary, aggregate)

Returns the maximum of the items of list `x`. The maximum of an atom is itself. Applies to any datatype except symbol. Nulls are ignored, except that if the items of `x` are all nulls, the result is negative infinity.
```q
q)max 2 5 7 1 3
7
q)max "genie"
"n"
q)max 0N 5 0N 1 3                  / nulls are ignored
5
q)max 0N 0N                        / negative infinity if all null
-0W
q)select max price by sym from t   / use in a select statement
```

<i class="fa fa-hand-o-right"></i> [`min`](#min "minimum") 


`maxs`
------

Syntax: `maxs x` (unary, uniform)

Returns the maximums of the prefixes of list `x`. The maximum of an atom is itself. Applies to any datatype except symbol. Nulls are ignored, except that initial nulls are returned as negative infinity.
```q
q)maxs 2 5 7 1 3
2 5 7 7 7
q)maxs "genie"
"ggnnn"
q)maxs 0N 5 0N 1 3         / initial nulls return negative infinity
-0W 5 5 5 5
```

<i class="fa fa-hand-o-right"></i> [`mins`](#mins "minimums")


`mcount`
--------

Syntax: `x mcount y` (binary, uniform)

The `mcount` verb returns the `x`-item moving count of the non-null items of  numeric list `y`. The first `x` items of the result are the counts so far, and thereafter the result is the moving count.
```q
q)3 mcount 0 1 2 3 4 5
1 2 3 3 3 3
q)3 mcount 0N 1 2 3 0N 5
0 1 2 3 2 2
```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`mavg`](#mavg "moving average"), [`mdev`](#mdev "moving deviation"), [`mmax`](#mmax "moving maximums"), [`mmin`](#mmin "moving minimums"), [`msum`](#msum "moving sums"), [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F)


`mdev`
------

Syntax: `x mdev y` (binary, uniform)

Returns the floating-point `x`-item moving deviation of numeric list `y`, with any nulls after the first element replaced by zero. The first `x` items of the result are the deviations of the terms so far, and thereafter the result is the moving deviation. 
```q
q)2 mdev 1 2 3 5 7 10
0 0.5 0.5 1 1 1.5
q)5 mdev 1 2 3 5 7 10
0 0.5 0.8164966 1.47902 2.154066 2.87054
q)5 mdev 0N 2 0N 5 7 0N    / nulls after the first are replaced by 0
0n 0 0 1.5 2.054805 2.054805
```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`mavg`](#mavg "moving average"), [`mcount`](#mcount "moving count"), [`mmax`](#mmax "moving maximums"), [`mmin`](#mmin "moving minimums"), [`msum`](#msum "moving sums"), [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F)


`med`
------

Syntax: `med x` (unary, aggregate)

Returns the median of numeric list `x`.
```q
q)med 10 34 23 123 5 56
28.5
q)select med price by sym from trade where date=2001.10.10,sym in`AAPL`LEH
```

!!! warning "Partitions and segments"
    In V3.0 upwards `med` signals a rank error when running a median over partitions, or segments. This is deliberate, as previously `med` was returning median of medians for such cases. This should now be explicitly coded as a cascading select.
    ```q
    q)select med price by sym from select price,sym from trade where date=2001.10.10,sym in`AAPL`LEH
    ```
<i class="fa fa-hand-o-right"></i> [`avg`](#avg "average")


`min`
-----

Syntax: `min x` (unary, aggregate)

Returns the minimum value of list `x`. The minimum of an atom is itself. Applies to any datatype except symbol. Nulls are ignored, except that if the argument has only nulls, the result is infinity.
```q
q)min 2 5 7 1 3
1
q)min "genie"
"e"
q)min 0N 5 0N 1 3                  / nulls are ignored
1
q)min 0N 0N                        / infinity if all null
0W
q)select min price by sym from t   / use in a select statement
```

!!! note "Aggregating nulls"
    `avg`, `min`, `max` and `sum` are special: they ignore nulls, in order to be similar to SQL92.
    But for nested `x` these functions preserve the nulls.
    ```q
    q)avg (1 2;0N 4)
    0n 3
    ```

<i class="fa fa-hand-o-right"></i> [`avg`](#avg), [`max`](#max), [`min`](#min), [`sum`](#sum)



`mins`
------

Syntax: `mins x` (unary, uniform) 

Returns the minimums of the prefixes of list `x`. The minimum of an atom is itself. Applies to any datatype except symbol. Nulls are ignored, except that initial nulls are returned as infinity.
```q
q)mins 2 5 7 1 3
2 2 2 1 1
q)mins "genie"
"geeee"
q)mins 0N 5 0N 1 3         / initial nulls return infinity
0W 5 5 1 1
```

<i class="fa fa-hand-o-right"></i> [`maxs`](#maxs "maximums")

`mmax`
------

Syntax: `x mmax y` (binary, uniform)

Returns the `x`-item moving maximum of numeric `y`, with nulls after the first replaced by the preceding maximum. The first `x` items of the result are the maximums of the items so far, and thereafter the result is the moving maximum.
```q
q)3 mmax 2 7 1 3 5 2 8
2 7 7 7 5 5 8
q)3 mmax 0N -3 -2 0N 1 0  / initial null returns negative infinity
-0W -3 -2 -2 1 1          / remaining nulls replaced by preceding max
```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`mavg`](#mavg "moving average"), [`mcount`](#mcount "moving count"), [`mdev`](#mdev "moving deviations"), [`mmin`](#mmin "moving minimums"), [`msum`](#msum "moving sums"), [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F)


`mmin`
------

Syntax: `x mdev y` (binary, uniform)

Returns the `x`-item moving minimum of numeric list `y`, with nulls treated as the minimum value. The first `x` items of the result are the minimums of the terms so far, and thereafter the result is the moving minimum.
```q
q)3 mmin 0N -3 -2 1 -0W 0
0N 0N 0N -3 -0W -0W
q)3 mmin 0N -3 -2 1 0N -0W    / null is the minimum value
0N 0N 0N -3 0N 0N
```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`mavg`](#mavg "moving average"), [`mcount`](#mcount "moving count"), [`mdev`](#mdev "moving deviations"), [`mmax`](#mmax "moving maximums"), [`msum`](#msum "moving sums"), [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F)


`msum`
------

Syntax: `x msum y` (binary, uniform) 

Returns the `x`-item moving sum of numeric list `y`, with nulls replaced by zero. The first `x` items of the result are the sums of the terms so far, and thereafter the result is the moving sum.
```q
q)3 msum 1 2 3 5 7 11
1 3 6 10 15 23
q)3 msum 0N 2 3 5 0N 11     / nulls treated as zero
0 2 5 10 8 16
```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`mavg`](#mavg "moving average"), [`mcount`](#mcount "moving count"), [`mdev`](#mdev "moving deviations"), [`mmax`](#mmax "moving maximums"), [`mmin`](#mmin "moving minimums"), [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F)


`scov`
------

Syntax: `x scov y` (binary, aggregate)

Returns the statistical covariance of `x` and `y` as a float atom.

$$scov(x,y)=\frac{n}{n-1}cov(x,y)$$

Applies to all numeric data types and signals an error with temporal types, char and sym.
```q
q)2 3 5 7 scov 3 3 5 9
8
q)2 3 5 7 scov 4 3 0 2
-2.416667
q)select price scov size by sym from trade
```

<i class="fa fa-hand-o-right"></i> [`cov`](#cov "covariance"), [`cor`](#cor "correlation")


`sdev`
------

Syntax: `sdev x` (unary, aggregate)

Returns the statistical standard deviation of list `x` (as the square root of the statistical variance).

$sdev(x)=\\sqrt{\\frac{n}{n-1}var(x)}$

Applies to all numeric data types and signals an error with temporal types, char and sym.
```q
q)sdev 10 343 232 55
155.1322
q)select sdev price by sym from trade
```

<i class="fa fa-hand-o-right"></i> [`cov`](#cov "covariance"), [`scov`](#scov "statistical covariance"), [`mdev`](#mdev "moving deviation"), [`dev`](#dev "deviation") 


`svar`
------

Syntax: `svar x` (unary, aggregate)

Returns the variance of numeric list `x` as a float atom.

$$svar(x)=\frac{n}{n-1}var(x)$$

```q
q)var 2 3 5 7
3.6875
q)svar 2 3 5 7
4.916667
q)select svar price by sym from trade where date=2010.10.10,sym in`IBM`MSFT
```

<i class="fa fa-hand-o-right"></i> [`var`](#var "variance")


`var`
-----

Syntax: `var x` (unary, aggregate)

Returns the variance of numeric list `x` as a float atom. Nulls are ignored.
```q
q)var 2 3 5 7
3.6875
q)var 2 3 5 0n 7
3.6875
q)select var price by sym from trade where date=2010.10.10,sym in`IBM`MSFT
```

<i class="fa fa-hand-o-right"></i> [`svar`](#svar)


`wavg`
------

Syntax: `x wavg y` (binary, aggregate)

Returns the average of numeric list `y` weighted by numeric list `x`. The result is a float atom. The calculation is `(sum x*y) % sum x`.
```q
q)2 3 4 wavg 1 2 4
2.666667
q)2 0N 4 5 wavg 1 2 0N 8  / nulls in either argument ignored
6f
```

!!! tip "Volume-weighted average price"
    The financial analytic known as VWAP is a weighted average.
    ```q
    q)select size wavg price by sym from trade
    sym| price
    ---| -----
    a  | 10.75
    ```

<i class="fa fa-hand-o-right"></i> [`ema`](#ema "exponential moving average"), [`wsum`](#wsum "weighted sum")


`wsum`
------

Syntax: `x wsum y` (binary, aggregate)

Returns the sum of the products of `x` and `y`. When both `x` and `y` are integer lists, they are first converted to floats. The calculation is `sum x *y`.
```q
q)2 3 4 wsum 1 2 4   / equivalent to sum 2 3 4 * 1 2 4f
24f
q)2 wsum 1 2 4       / equivalent to sum 2 * 1 2 4
14
```

<i class="fa fa-hand-o-right"></i> [`wavg`](#wavg "weighted average")


