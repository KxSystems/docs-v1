The verb `xcol` renames columns in a table.

Syntax
------

    newtable:cols xcol table

The left argument is a symbol list of new column names, of length less than or equal to the number of columns in the table. The right argument is a table, passed by value. The result is the new table.

Example
-------

    q)\l trade.q
    q)cols trade
    `time`sym`price`size
    q)`Time`Symbol xcol trade           / rename first two columns
    Time         Symbol price size
    ------------------------------
    09:30:00.000 a      10.75 100
    q)trade:`Time`Symbol`Price`Size xcol trade  / rename all and assign
    q)cols trade
    `Time`Symbol`Price`Size

See also
--------

-   [xcols](Reference/xcols "wikilink") reorder columns in a table

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
