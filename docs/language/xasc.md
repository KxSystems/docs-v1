The verb `xasc` sorts a table in ascending order of given columns. The sort is by the first column given, then by the second column within the first, and so on. The `` `s# `` attribute is set on the first column given (if possible).

The sort is stable, i.e. it preserves order amongst equals.

Syntax
------

    q)r:cols xasc table

Here, `cols` must be a subset of the columns of `table`.

The right argument is a table. If passed by reference, it is updated. If passed by value, a new table is returned.

Example
-------

    q)\l sp.q
    q)s
    s | name  status city
    --| -------------------
    s1| smith 20     london
    s2| jones 10     paris
    s3| blake 30     paris
    s4| clark 20     london
    s5| adams 30     athens
    q)`city xasc s                 / sort on city
    s | name  status city
    --| -------------------
    s5| adams 30     athens
    s1| smith 20     london
    s4| clark 20     london
    s2| jones 10     paris
    s3| blake 30     paris
    q)`city`name xasc s            / sort on city, and name within city
    s | name  status city
    --| -------------------
    s5| adams 30     athens
    s4| clark 20     london
    s1| smith 20     london
    s3| blake 30     paris
    s2| jones 10     paris
    q)`status`city`name xasc s    / sort on 3 columns, status first
    s | name  status city
    --| -------------------
    s2| jones 10     paris
    s4| clark 20     london
    s1| smith 20     london
    s5| adams 30     athens
    s3| blake 30     paris
    q)`status`city`name xasc `s   / table given by reference, updated in place
    `s
    q)s
    s | name  status city
    --| -------------------
    s2| jones 10     paris
    s4| clark 20     london
    s1| smith 20     london
    s5| adams 30     athens
    s3| blake 30     paris
    q)meta s                     / status column has sorted attribute
    c     | t f a
    ------| -----
    s     | s
    name  | s
    status| i   s
    city  | s

Sorting data on disk
--------------------

`xasc` can sort data on disk directly, without loading the entire table into memory.

    q)t:([]b:`s`g`a`s`a;c:30 10 43 13 24;g:til 5)
    q)`:dat/t/ set .Q.en[`:dat]t     / write splayed table
    `:dat/t/
    q)\ls dat/t                      / splayed columns
    ,"b"
    ,"c"
    ,"g"
    q)`c xasc `:dat/t                / sort table on disk by column c
    `:dat/t
    q)t                              / in-memory table is unsorted
    b c  g
    ------
    s 30 0
    g 10 1
    a 43 2
    s 13 3
    a 24 4
    q)\l dat/t                      / load table from disk
    `t
    q)t                             / table is sorted
    b c  g
    ------
    g 10 1
    s 13 3
    a 24 4
    s 30 0
    a 43 2

See also
--------

-   [xdesc](Reference/xdesc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
