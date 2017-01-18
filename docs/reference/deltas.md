The uniform function `deltas` returns differences between consecutive pairs. It applies to all numeric and date types.

Syntax
------

deltas can be either monadic or dyadic.

    q)r:deltas y
    q)r:deltas[x;y]

The result can be interpreted as follows: for monadic

    r[i]=A[i]               for i=0
    r[i]=A[i]-A[i-1]        otherwise

With deltas\[x;y\], x is used in place of the initial zero so the result is (f\[y 0;x\];f\[y 1;y 0\];f\[y 2;y 1\];...;f\[y n-1;y n-2\]). See [eachprior](Reference/ApostropheColon "wikilink")

Example
-------

    q)deltas 1 4 9 16
    1 3 5 7
    q)deltas[0N;1 4 9 16]
    0N 3 5 7

It can be used in a query to get price movements:

    q)update diff:deltas price by sym from trade

Use with `signum` to count the number of up/down/same ticks:

    q)select count i by signum deltas price from trade
    price| x
    -----| ----
    -1   | 247
    0    | 3
    1    | 252

See also
--------

-   [eachprior](Reference/ApostropheColon "wikilink")
-   [differ](Reference/differ "wikilink")
-   [ratios](Reference/ratios "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
