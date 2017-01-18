The function `neg` negates its argument, e.g. `neg` `3` is `-3`. This is needed in q because it has no ambivalence, and `-` is already in use as a verb (i.e. takes arguments to left and right).

Applies to all data types except sym and char. Applies item-wise to lists, dict values and table columns.

Syntax
------

    q)r:neg X

Example
-------

    q)neg -1 0 1 2
    1 0 -1 -2

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
