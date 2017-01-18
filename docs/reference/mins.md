The `mins` function returns the minimums of the prefixes of its argument.

If the argument is an atom, it is returned unchanged.

If the argument is a list, it returns the minimums of the prefixes of the list. The list may be any datatype except symbol. Nulls are ignored, except that initial nulls are returned as infinity.

Syntax
------

    q)r:mins X

Example
-------

    q)mins 2 5 7 1 3
    2 2 2 1 1
    q)mins "genie"
    "geeee"
    q)mins 0N 5 0N 1 3         / initial nulls return infinity
    0W 5 5 1 1

See also
--------

-   [maxs](Reference/maxs "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
