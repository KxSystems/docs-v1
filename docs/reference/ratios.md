The uniform function `ratios` returns the ratio of consecutive pairs. It applies to all numeric data types.

Syntax
------

    q)r:ratios A

The result can be interpreted as follows:

    r[i]=A[i]               for i=0
    r[i]=A[i]%A[i-1]        otherwise

Example
-------

    q)ratios 1 2 4 6 7 10
    1 2 2 1.5 1.166667 1.428571

It can be used in a query to get returns on prices:

    q)update ret:ratios price by sym from trade
    q)select log ratios price from trade

See also
--------

-   [deltas](Reference/deltas "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
