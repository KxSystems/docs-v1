Returns the correlation of its arguments as a floating point number between `-1f` and `1f`. Perfectly correlated data results in a `1` or `-1`. When one variable increases as the other increases the correlation is positive; when one decreases as the other increases it is negative. Completely uncorrelated arguments return `0f`. Arguments must be of the same length.

`cor` applies to all numeric data types and throws an error with temporal types, char and sym.

Syntax
------

    q)r:X cor Y

Example
-------

    q)29 10 54 cor 1 3 9
    0.7727746
    q)10 29 54 cor 1 3 9
    0.9795734
    q)1 3 9 cor neg 1 3 9
    -1f

    q)select price cor size by sym from trade

See also
--------

-   [covariance](Reference/cov "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
