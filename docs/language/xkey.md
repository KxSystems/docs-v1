The verb `xkey` sets the primary keys in a table.

Syntax
------

    r:keys xkey table

The left argument is a symbol list of column names, which must belong to the table.

The right argument is a table. If passed by reference, it is updated. If passed by value, a new table is returned.

Example
-------

    q)\l trade.q
    q)keys trade
    `symbol$()            / no primary key
    q)`sym xkey trade     / return table with primary key sym
    sym| time         price size
    ---| -----------------------
    a  | 09:30:00.000 10.75 100
    q)keys trade         / trade has not changed
    `symbol$()
    q)`sym xkey `trade   / pass trade by reference updates the table in place
    `trade
    q)keys trade         / sym is now primary key of trade
    ,`sym

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
