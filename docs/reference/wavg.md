The `wavg` verb returns the average of its right argument weighted by its left argument. The result is floating point.

Syntax
------

    q)R:X wavg Y

The calculation is `(sum` `X*Y)` `%` `sum` `X`.

Example
-------

    q)2 3 4 wavg 1 2 4
    2.666667
    q)2 0N 4 5 wavg 1 2 0N 8  / nulls in either argument ignored
    6f

The financial analytic called `vwap` is a weighted average (volume-weighted-average-price):

    q)select size wavg price by sym from trade
    sym| price
    ---| -----
    a  | 10.75

See also
--------

-   [wsum](Reference/wsum "wikilink")
-   [ema](Reference/ema "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
