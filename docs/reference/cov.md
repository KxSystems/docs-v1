Returns the covariance of its arguments as a floating point number.

`cov` applies to all numeric data types and throws error with temporal types, char and sym.

Syntax
------

    q)r:X cov Y

Example
-------

    q)2 3 5 7 cov 3 3 5 9
    4.5
    q)2 3 5 7 cov 4 3 0 2
    -1.8125
    q)select price cov size by sym from trade

See also
--------

-   [correlation](Reference/cor "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
