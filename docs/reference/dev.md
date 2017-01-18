Computes the standard deviation of a list (as the square root of the variance).

`dev` applies to all numeric data types and throws an error with temporal types, char and sym.

Syntax
------

    q)r:dev X

Example
-------

    q)dev 10 343 232 55
    134.3484
    q)select dev price by sym from trade

See also
--------

-   [cov](Reference/cov "wikilink")
-   [mdev](Reference/mdev "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
