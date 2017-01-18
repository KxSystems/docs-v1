Returns the statistical covariance of its arguments as a floating point number.

$scov(x,y)=\\frac{n}{n-1}cov(x,y)$

`scov` applies to all numeric data types and throws error with temporal types, char and sym.

Syntax
------

    q)r:X scov Y

Example
-------

    q)2 3 5 7 scov 3 3 5 9
    8
    q)2 3 5 7 scov 4 3 0 2
    -2.416667
    q)select price scov size by sym from trade

See also
--------

-   [covariance](Reference/cov "wikilink")
-   [correlation](Reference/cor "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
