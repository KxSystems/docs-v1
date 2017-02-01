The aggregate `svar` function returns the variance of a numeric list. The result has type float.

$svar(x)=\\frac{n}{n-1}var(x)$

Syntax
------

    q)r:svar X

Examples
--------

    q)var 2 3 5 7
    3.6875
    q)svar 2 3 5 7
    4.916667
    q)select svar price by sym from trade where date=2010.10.10,sym in`IBM`MSFT

See also
--------

-   [var](Reference/var "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
