The `til` function takes a non-negative integer argument `X` and returns the first `X` integers. The argument must be of type integer:

Syntax
------

    q)r:til X

Example
-------

    q)til 0
    `int$()
    q)til 1
    ,0
    q)til 5
    0 1 2 3 4
    q)til 5h
    'type

See also
--------

-   [key](Reference/key "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
