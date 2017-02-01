The `uj` verb is a type of union join that generalizes [comma](Reference/Comma "wikilink"). The result has the union of the columns filled with nulls where necessary.

Syntax
------

    q)r:t1 uj t2

If `t1` and `t2` have matching key columns, then records in `t2` update matching records in `t1`. Otherwise, `t2` records are inserted.

    q)show s:([]a:1 2;b:2 3;c:5 7)
    a b c
    -----
    1 2 5
    2 3 7
    q)show t:([]a:1 2 3;b:2 3 7;c:10 20 30;d:"ABC")
    a b c  d
    --------
    1 2 10 A
    2 3 20 B
    3 7 30 C
    q)s,t                            / tables do not conform for ,
    'mismatch
    q)s uj t                         / unkeyed, so second table is inserted
    a b c  d
    --------
    1 2 5
    2 3 7
    1 2 10 A
    2 3 20 B
    3 7 30 C
    q)(2!s) uj 2!t                   / keyed, so matching records are updated
    a b| c  d
    ---| ----
    1 2| 10 A
    2 3| 20 B
    3 7| 30 C

See also
--------

-   [,](Reference/Comma "wikilink")
-   [joins](Reference/joins "wikilink")
-   [ej](Reference/ej "wikilink"), [ij](Reference/ij "wikilink"), [lj](Reference/lj "wikilink"), [pj](Reference/pj "wikilink"), [upsert](Reference/upsert "wikilink")
-   [asof](Reference/asof "wikilink"), [aj](Reference/aj "wikilink"), [wj](Reference/wj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
