Computes the statistical standard deviation of a list (as the square root of the statistical variance).

$sdev(x)=\\sqrt{\\frac{n}{n-1}var(x)}$

`sdev` applies to all numeric data types and throws an error with temporal types, char and sym.

Syntax
------

    q)r:sdev X

Example
-------

    q)sdev 10 343 232 55
    155.1322
    q)select sdev price by sym from trade

See also
--------

-   [cov](Reference/cov "wikilink")
-   [scov](Reference/scov "wikilink")
-   [mdev](Reference/mdev "wikilink")
-   [dev](Reference/dev "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
