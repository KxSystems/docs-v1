`cols` returns a symbol list of the column names of a table. The table can be passed by reference or by value.

Syntax
------

    L:cols T

Example
-------

    q)\l trade.q
    q)cols trade
     `time`sym`price`size
    q)cols`trade
     `time`sym`price`size

See also
--------

-   [meta](Reference/meta "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
