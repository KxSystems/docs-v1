The `ij` verb joins two tables on the key columns of the second table.

Syntax
------

    q)a:t1 ij t2

where `t1` and `t2` are the tables to be joined. `t2` must be keyed, and its key columnns must be columns of `t1`.

The result has one combined record for each row in `t1` that matches a row in `t2`.

    q)t
    sym  price
    ---------------
    IBM  0.7029677
    FDP  0.08378167
    FDP  0.06046216
    FDP  0.658985
    IBM  0.2608152
    MSFT 0.5433888
    q)s
    sym | ex  MC
    ----| --------
    IBM | N   1000
    MSFT| CME 250
    q)t ij s
    sym  price     ex  MC
    -----------------------
    IBM  0.7029677 N   1000
    IBM  0.2608152 N   1000
    MSFT 0.5433888 CME 250

Changes in 3.0
--------------

Since kdb+ 3.0, `ij` has changed behavior similarly to \*[lj](Reference/lj "wikilink") -- when there are nulls in the right argument, ij in kdb+ 3.0 uses the right argument null, while the earlier version left the corresponding value in the left argument unchanged:

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
    q)x ij y        / kdb+ 3.0
    a b c
    -----
    1   1
    2 z
    q)x ij y        / kdb+ 2.8
    a b c
    ------
    1 x 1
    2 z 20
    q)

See also
--------

-   [joins](Reference/joins "wikilink")
-   [asof](Reference/asof "wikilink")
-   [aj](Reference/aj "wikilink")
-   [lj](Reference/lj "wikilink")
-   [uj](Reference/uj "wikilink")
-   [wj](Reference/wj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
