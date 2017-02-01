The `maxs` function returns the maximums of the prefixes of its argument.

If the argument is an atom, it is returned unchanged.

If the argument is a list, it returns the maximums of the prefixes of the list. The list may be any datatype except symbol. Nulls are ignored, except that initial nulls are returned as negative infinity.

Syntax
------

    q)r:maxs X

Example
-------

    q)maxs 2 5 7 1 3
    2 5 7 7 7
    q)maxs "genie"
    "ggnnn"
    q)maxs 0N 5 0N 1 3         / initial nulls return negative infinity
    -0W 5 5 5 5

See also
--------

-   [mins](Reference/mins "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
