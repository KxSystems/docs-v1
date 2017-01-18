The functions `aj,` `aj0` joins tables along columns that are usually time columns.

In the join, the last value (most recent time) is taken.

Syntax
------

    q)a:aj[c1...cn;t1;t2]

where `c1...cn` is a symbol list of common column names, and `t1` and `t2` are the tables to be joined. The columns need not be keys on `t1`, and `t2` must not have a key. Moreover common columns in `t1` and `t2` must be of the same type and `cn` (last sym in common columns) must be a common column, typically time, although aj can work on any other type if sorted.

The result is a table with records from the left join of `t1` and `t2`.

For each record in `t1`, the result has one record with the items in `t1`, and

-   if there are matching records in `t2`, the items of the last (in row order) matching record are appended to those of `t1`

<!-- -->

-   if there is no matching record in `t2`, the remaining columns are null

Example
-------

    q)t:([]time:10:01:01 10:01:03 10:01:04;sym:`msft`ibm`ge;qty:100 200 150)
    q)t
    time       sym  qty
    -----------------
    10:01:01 msft 100
    10:01:03 ibm  200
    10:01:04 ge   150

    q)q:([]time:10:01:00 10:01:00 10:01:00 10:01:02;sym:`ibm`msft`msft`ibm;px:100 99 101 98)
    q)q
    time     sym  px 
    -----------------
    10:01:00 ibm  100
    10:01:00 msft 99 
    10:01:00 msft 101
    10:01:02 ibm  98 

    q)aj[`sym`time;t;q]
    time       sym  qty px
    ---------------------
    10:01:01 msft 100 101
    10:01:03 ibm  200 98
    10:01:04 ge   150

Remarks
-------

0. If the resulting time value is to be from the quote (actual time) instead of the (boundary time) from trade, use **aj0** instead of aj.

1. `aj` should run at a million or two trade records per second; whether trade/quote are mapped or not is irrelevant. However, for speed,

-   in-memory quote must have `` `g#sym `` and time sorted within sym.

<!-- -->

-   on-disk quote must have `` `p#sym `` and time sorted within sym.

Note that on-disk `` `g#sym `` does not help.

2. Unlike in memory, to use `aj` with on-disk, you must map in your splay or day-at-a-time partitioned db:

Splay:

    aj[`sym`time;select .. from trade where ..;select .. from quote]

Partitioned db:

    aj[`sym`time;select .. from trade where ..;
                 select .. from quote where date = ..]

Further *where* constraints cannot be used, or the columns will be copied instead of mapped into memory (resulting in slowdown for the `aj`).

3. There is no need to select on quote, i.e. irrespective of the number of quote records, use:

    aj[`sym`time;select .. from trade where ..;quote]

instead of

    aj[`sym`time;select .. from trade where ..;
                 select .. from quote where ..]

See also
--------

-   [joins](Reference/joins "wikilink")
-   [asof](Reference/asof "wikilink")
-   [ij](Reference/ij "wikilink")
-   [lj](Reference/lj "wikilink")
-   [uj](Reference/uj "wikilink")
-   [wj](Reference/wj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
