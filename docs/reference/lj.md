The `lj` (left join) verb joins tables on the key columns of its right argument. The left argument is a table, and the right argument is a keyed table, where the key columns must be a subset of the columns of the left argument.

Syntax
------

    q)r:t1 lj t2

For each record in `t1`, the result has one record with the columns of `t1` joined to columns of `t2`.

-   if there is a matching record in `t2`, it is joined to the `t1` record. Common columns are replaced.

<!-- -->

-   if there is no matching record in `t2`, common columns are left unchanged, and new columns are null

For example:

    q)show x:([]a:1 2 3;b:`x`y`z;c:10 20 30)
    a b c
    ------
    1 x 10
    2 y 20
    3 z 30
    q)show y:([a:1 3;b:`x`z]c:1 2;d:10 20)
    a b| c d
    ---| ----
    1 x| 1 10
    3 z| 2 20
    q)x lj y
    a b c  d
    ---------
    1 x 1  10
    2 y 20
    3 z 2  20

Note that the `t2` columns joined to `t1` are given by:

    q)y[select a,b from x]
    c d
    ----
    1 10

    2 20

Changes in 3.0
--------------

Since kdb+ 3.0, the `lj` verb is a cover for `,\:` (comma join) that allows the left argument to be a keyed table. `,\:` was introduced in kdb+ 2.7 2011.01.24.

Prior to kdb+ 3.0, `lj` had similar behavior, with one difference - when there are nulls in the right argument, `lj` in kdb+ 3.0 uses the right argument null, while the earlier version left the corresponding value in the left argument unchanged:

    q)show x:([]a:1 2;b:`x`y;c:10 20)
    a b c
    ------
    1 x 10
    2 y 20
    q)show y:([a:1 2]b:``z;c:1 0N)
    a| b c
    -| ---
    1|   1
    2| z
    q)x lj y        / kdb+ 3.0
    a b c
    -----
    1   1
    2 z
    q)x lj y        / kdb+ 2.8 
    a b c
    ------
    1 x 1
    2 z 20

Since 2014.05.03, the earlier version is available in all kdb+ 3.x versions as `ljf`.

See also
--------

::\* [,](Reference/Comma "wikilink")

::\* [joins](Reference/joins "wikilink")

::\* [ej](Reference/ej "wikilink"), [ij](Reference/ij "wikilink"), [pj](Reference/pj "wikilink"), [uj](Reference/uj "wikilink"), [upsert](Reference/upsert "wikilink")

::\* [asof](Reference/asof "wikilink"), [aj](Reference/aj "wikilink"), [wj](Reference/wj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
