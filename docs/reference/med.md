Computes the median of a numeric list.

Syntax
------

    q)r:med X

Example
-------

    q)med 10 34 23 123 5 56
    28.5
    q)select med price by sym from trade where date=2001.10.10,sym in`AAPL`LEH

Note that in v3.0 upwards med throws a rank error when running a median over partitions, or segments - this is deliberate, as previously med was returning median of medians for such cases. This should now be explicitly coded as a cascading select

    q)select med price by sym from select price,sym from trade where date=2001.10.10,sym in`AAPL`LEH

See also
--------

-   [avg](Reference/avg "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
