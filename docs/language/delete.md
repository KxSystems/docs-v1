Delete rows, and columns, from a table.

    q)table: ([] a: `a`b`c; n: (1 2 3))
    q)show table
    a n
    ---
    a 1
    b 2
    c 3

Delete all or selected rows, returning a new table.

    q)show delete from table where a = `c
    a n
    ---
    a 1
    b 2

Delete one or more columns, returning a new table.

    q)show delete n from table
    a
    -
    a
    b
    c

Deletion is *in-place* if the table name is referred to as a symbol, '''`` `table''' `` rather than **table**.

Delete objects

    q)a:1
    q)\v
    ,`a
    q)delete a from `.
    `.
    q)\v
    `symbol$()

![](Screen_Shot_2012-10-25_at_09.26.30.jpg "Screen_Shot_2012-10-25_at_09.26.30.jpg")
