The verb `xgroup` groups its right argument table by the foreign keys in the left argument. It is equivalent to doing a *select .. by* on the table, except that all the remaining columns are grouped without having to list them explicitly.

Syntax
------

    q)r:keys xgroup table

Here, `keys` is one or more foreign key columns of `table`.

Example
-------

    q)\l sp.q
    q)meta sp                        / both s and p are foreign keys of sp
    c  | t f a
    ---| -----
    s  | s s
    p  | s p
    qty| i
    q)`p xgroup sp                   / group by column p
    p | s               qty
    --| -------------------------------
    p1| `s$`s1`s2       300 300
    p2| `s$`s1`s2`s3`s4 200 400 200 200
    p3| `s$,`s1         ,400
    p4| `s$`s1`s4       200 300
    p5| `s$`s4`s1       100 400
    p6| `s$,`s1         ,100
    q)select s,qty by p from sp      / equivalent select statement
    p | s               qty
    --| -------------------------------
    p1| `s$`s1`s2       300 300
    p2| `s$`s1`s2`s3`s4 200 400 200 200
    p3| `s$,`s1         ,400
    p4| `s$`s1`s4       200 300
    p5| `s$`s4`s1       100 400
    p6| `s$,`s1         ,100
    q)ungroup `p xgroup sp           / ungroup flattens the groups
    p  s  qty
    ---------
    p1 s1 300
    p1 s2 300
    p2 s1 200
    p2 s2 400
    p2 s3 200
    p2 s4 200
    p3 s1 400
    ...

See also
--------

-   [ungroup](Reference/ungroup "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
