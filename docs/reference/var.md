The aggregate `var` function returns the variance of a numeric list. The result has type float. Nulls are ignored.

Syntax
------

    q)r:var X

Examples
--------

    q)var 2 3 5 7
    3.6875
    q)var 2 3 5 0n 7
    3.6875
    q)select var price by sym from trade where date=2010.10.10,sym in`IBM`MSFT

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
