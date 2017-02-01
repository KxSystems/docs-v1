The `show` function formats its argument to the console. For example, this can be useful for displaying intermediate values in explicit definitions.

Syntax
------

    q)show X

Example
-------

    q)f:{a:x<5;sum a}
    q)f 2 3 5 7 3
    3
    q)f:{show a:x<5;sum a}    / same function, showing value of a
    q)f 2 3 5 7 3
    11001b
    3

Note that `show` only writes to the console; it does not return the formatted result:

    q)a:show til 5
    0 1 2 3 4
    q)a                         / a is null

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
