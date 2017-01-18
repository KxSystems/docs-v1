The aggregate verb `wsum` calculates the sum of the products of its arguments. When both arguments are integer lists, they are first converted to floats.

Syntax
------

    q)R:X wsum Y

The calculation is `sum` `X` `*` `Y`.

Example
-------

    q)2 3 4 wsum 1 2 4   / equivalent to sum 2 3 4 * 1 2 4f
    24f
    q)2 wsum 1 2 4       / equivalent to sum 2 * 1 2 4
    14

See also
--------

-   [wavg](Reference/wavg "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
