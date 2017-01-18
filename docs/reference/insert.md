Insert appends records to a table.

Syntax
------

    q)`table insert records

where `` `table `` is the symbol name of a table, and records is one or more records that match the table columns. The result is the new row indices. Note that insert can insert to global variables only, due to the lookup of the symbol name. If you need to insert to function local tables, use table,:data instead.

If the table is keyed, the new records may not match existing keys.

Example
-------

    q)show x:([a:`x`y];b:10 20)
    a| b
    -| --
    x| 10
    y| 20
    q)`x insert (`z;30)
    ,2
    q)x
    a| b
    -| --
    x| 10
    y| 20
    z| 30

New records may not match existing keys:

    q)`x insert (`z;30)
    'insert

Several records may be appended at once:

    q)`x insert (`s`t;40 50)
    3 4
    q)x
    a| b
    -| --
    x| 10
    y| 20
    z| 30
    s| 40
    t| 50

See also
--------

-   [,](Reference/Comma "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
