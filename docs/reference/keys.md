The `keys` function takes an argument of a table name or reference, and returns a symbol list of the primary key columns of its argument, or empty if none.

Example
-------

    q)\l trade.q        / no keys
    q)keys trade
    `symbol$()
    q)keys`trade
    `symbol$()
    q)`sym xkey`trade   / define a key
    q)keys`trade
    ,`sym

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
