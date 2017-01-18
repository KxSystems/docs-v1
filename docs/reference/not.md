The logical `not` function returns a boolean result `0b` when the argument is not equal to zero, and `1b` otherwise.

Applies to all data types except sym. Applies item-wise to lists, dict values and table columns.

Syntax
------

    q)r:not X

Example
-------

    q)not -1 0 1 2
    0100b
    q)not "abc","c"$0
    0001b
    q)not `a`b!(-1 0 2;"abc","c"$0)
    a| 010b
    b| 0001b

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
