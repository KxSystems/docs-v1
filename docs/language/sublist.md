The verb `sublist` returns a sublist of its right argument, as specified by its left argument. The result contains only as many items as are available in the right argument.

Syntax
------

    r:X sublist Y

If `X` is a single integer, it returns `X` items from the beginning of `Y` if positive, or from the end of `Y` if negative.

If `X` is an integer pair, it returns `X` `1` items from `Y`, starting at item `X` `0`.

Example
-------

    q)p:2 3 5 7 11
    q)3 sublist p    / take 3 from the front
    2 3 5
    q)10 sublist p   / returns only available values
    2 3 5 7 11
    q)1 2 sublist p  / takes 2 items starting from position 1
    3 5

`sublist` applies to the keys of a dictionary, and records of a table:

    q)2 sublist `a`b`c!(1 2 3;"xyz";2 3 5)
    a| 1 2 3
    b| x y z
    q)-3 sublist sp
    s p qty
    -------
    3 1 200
    3 3 300
    0 4 400

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
