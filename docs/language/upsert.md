The `upsert` verb adds new records to a table.

If the table is keyed, any new records that match on key are updated. Otherwise, new records are inserted.

If the table is passed by reference, it is updated in place. Otherwise the updated table is returned.

Syntax
------

    r:table upsert new_records

Example
-------

    q)show a:([s:`q`w`e]r:1 2 3;u:5 6 7)
    s| r u
    -| ---
    q| 1 5
    w| 2 6
    e| 3 7
    q)a upsert ([s:`e`r`q]r:30 4 10;u:70 8 50)    / update `q and `e, insert new `r
    s| r  u                                       / returning new table
    -| -----
    q| 10 50
    w| 2  6
    e| 30 70
    r| 4  8
    q)`a upsert ([s:`e`r`q]r:30 4 10;u:70 8 50)   / same but updating table in place
    `a

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
