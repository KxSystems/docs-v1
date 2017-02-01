The `pj` (plus join) verb joins tables on the key columns of its right argument. The left argument is a table, and the right argument is a keyed table, where the key columns must be a subset of the columns of the left argument.

`pj` adds matching records in the right argument to those in the left argument, by adding common columns, other than the key columns. These common columns must be of appropriate types for addition.

Syntax
------

    q)r:t1 pj t2

For each record in `t1`:

-   if there is a matching record in `t2` it is added to the `t1` record.

<!-- -->

-   if there is no matching record in `t2`, common columns are left unchanged, and new columns are zero.

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
    q)x pj y
    a b c  d
    ---------
    1 x 11 10
    2 y 20 0
    3 z 32 20

Note that in the example above, `pj` is equivalent to `` x+0^y[`a`b#x] `` (compute the value of `y` on `a` and `b` columns of `x`, fill the result with zeros and add to `x`).

See also
--------

-   [,](Reference/Comma "wikilink")
-   [joins](Reference/joins "wikilink")
-   [ej](Reference/ej "wikilink"), [ij](Reference/ij "wikilink"), [lj](Reference/lj "wikilink"), [uj](Reference/uj "wikilink"), [upsert](Reference/upsert "wikilink")
-   [asof](Reference/asof "wikilink"), [aj](Reference/aj "wikilink"), [wj](Reference/wj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
