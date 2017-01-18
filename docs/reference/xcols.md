The verb `xcols` reorders columns in a table.

Syntax
------

    newtable:cols xcols table

The left argument is a symbol list of column names, of length less than or equal to the number of columns in the table. The column names given must belong to the table. The right argument is a table, passed by value, with no primary keys. The result is the new table.

Example
-------

    q)\l trade.q
    q)cols trade
    `time`sym`price`size
    q)trade:xcols[reverse cols trade;trade] / reverse cols and reassign trade
    q)cols trade
    `size`price`sym`time
    q)trade:`sym xcols trade                / move sym to the front
    q)cols trade
    `sym`size`price`time

See also
--------

-   [xcol](Reference/xcol "wikilink") rename columns in a table

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
