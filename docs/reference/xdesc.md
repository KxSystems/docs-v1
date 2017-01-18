The verb `xdesc` sorts a table in descending order of given columns. The behaviour is just like `xasc` except that the sort is descending and the `` `s# `` attribute is not set.

The sort is stable, i.e. it preserves order amongst equals.

Syntax
------

    q)r:cols xdesc table

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
    q)`city xdesc s                 / sort descending by city
    s | name  status city
    --| -------------------
    s2| jones 10     paris
    s3| blake 30     paris
    s1| smith 20     london
    s4| clark 20     london
    s5| adams 30     athens
    q)meta `city xdesc s            / `s# attribute not set
    c     | t f a
    ------| -----
    s     | s
    name  | s
    status| i
    city  | s

See also
--------

-   [xasc](Reference/xasc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
