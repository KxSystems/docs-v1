The uniform verb `rotate` takes an integer left argument and a list or table right argument.

Syntax
------

    r:N rotate L

This rotates `L` by `N` positions to the left for positive `N`, and to the right for negative `N`.

Example
-------

    q)2 rotate 2 3 5 7 11
    5 7 11 2 3
    q)-2 rotate 2 3 5 7 11
    7 11 2 3 5

On tables, rotates the columns:

    q)d:([]a:1 2 3;b:"xyz")
    q)1 rotate d
    a b
    ---
    2 y
    3 z
    1 x

See also
--------

-   [reverse](Reference/reverse "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
