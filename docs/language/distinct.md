Returns the distinct (unique) elements of its argument, and applies to data types other than dictionary.

Syntax
------

    L:distinct L

Example
-------

    q)distinct 2 3 7 3 5 3
    2 3 7 5

For a table, it returns the distinct rows:

    q)distinct flip `a`b`c!(1 2 1;2 3 2;"aba")
    a b c
    -----
    1 2 a
    2 3 b

It does not use comparison tolerance:

    q)\P 14
    q)distinct 2 + 0f,10 xexp -13
    2 2.0000000000001

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
