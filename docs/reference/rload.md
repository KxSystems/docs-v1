The `rload` function loads a splayed table, and is the converse of [rsave](Reference/rsave "wikilink"). The argument is the table name as a symbol, and the table is read from a directory of the same name.

The usual and more general way of doing this is to use the [get](Reference/get "wikilink") function, which allows a table to be defined with a different name than the source directory.

Example
-------

    q)\l sp.q
    q)rsave `sp           / save splayed table
    `:sp/
    q)delete sp from `.
    `.
    q)sp
    'sp
    q)rload `sp           / load splayed table
    `sp
    q)3#sp
    s  p  qty
    ---------
    s1 p1 300
    s1 p2 200
    s1 p3 400
    q)sp:get `:sp/        / equivalent to rload `sp

See also
--------

-   [get](Reference/get "wikilink")
-   [rsave](Reference/rsave "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
