Computes the arithmetic mean of a list of numbers.

Null is returned if the list is empty, or contains both positive and negative infinity. Any null elements in the input list are ignored.

Example
-------

    q)avg 1 2 3
    2f
    q)avg 1 0n 2 3       / null values are ignored
    2f
    q)avg 1.0 0w
    0w
    q)avg -0w 0w
    0n
    q)\l trade.q
    q)show select ap:avg price by sym from trade
    sym| ap
    ---| -----
    a  | 10.75

See also
--------

-   [med](Reference/med "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
