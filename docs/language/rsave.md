The `rsave` function saves a table splayed to a directory of the same name. The argument is the table name as a symbol. The table must be fully enumerated and not keyed.

The usual and more general way of doing this is to use the [set](Reference/set "wikilink") function, which allows the target directory to be given.

Example
-------

    q)\l sp.q
    q)rsave `sp           / save splayed table
    `:sp/
    q)\ls sp
    ,"p"
    "qty"
    ,"s"
    q)`:sp/ set sp        / equivalent to rsave `sp
    `:sp/

See also
--------

-   [rload](Reference/rload "wikilink")
-   [set](Reference/set "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
