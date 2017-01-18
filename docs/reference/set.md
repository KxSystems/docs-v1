The `set` verb assigns the right argument to the left, which must represent a well-formed name. The left argument can be a filename, in which case the right argument is written to file.

Syntax
------

    q)X set Y

Example
-------

    q)`a set 1 2 3            / set name a
    `a
    q)a
    1 2 3

    q)a:`t
    q)a set 1 2 3             / set name t (indirect assignment)
    `t
    q)t
    1 2 3

    q)a:"t"
    q)a set 1 2 3             / fails, as name must be a symbol
    :["type"]

If the left argument is a filename, the values are written to file:

    q)`:work.dat set 1 2 3    / write values to file
    `:work.dat
    q)get `:work.dat
    1 2 3

Example where the data is a table, and is written to a single file:

    q)\l sp.q
    q)`:mytable.dat set sp
    `:mytable.dat
    q)get `:mytable.dat
    s  p  qty
    ---------
    s1 p1 300
    s1 p2 200
    s1 p3 400
    ..

To save a table splayed across a directory using `set`, the left argument must be a path (i.e. must end with a forward slash), and the table must be fully enumerated with no primary keys:

    q)`:mydata/ set sp
    `:mydata/
    q)\ls mydata
    ,"p"
    "qty"
    ,"s"
    q)get `:mydata
    s  p  qty
    ---------
    s1 p1 300
    s1 p2 200
    s1 p3 400
    ..

Avoid setting variables in the .q namespace, as undesired and confusing behaviour can result.

See also
--------

-   [get](Reference/get "wikilink")
-   [save](Reference/save "wikilink")
-   [load](Reference/load "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
