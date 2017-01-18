Window join is a generalization of asof join, and is available from kdb+ 2.6. asof join takes a snapshot of the current state, while window join aggregates all values of specified columns within intervals. (Since 3.0, `wj` and `wj1` are both implemented with `ww`.)

Note that windows joins with multiple symbols should be only used with a \`p\#sym like schema (typical RTD-like \`g\# gives undefined results) Also note that only integral types are supported for the column to do the windowing on, so no reals, floats or datetimes.

Syntax
------

      wj[w;c;t;(q;(f0;c0);(f1;c1))]

where:

-   `t` and `q` are the unkeyed tables to be joined. `q` should be sorted `` `sym`time `` with `` `p# `` on sym
-   `w` is a pair of lists of times/timestamps, begin and end
-   `c` are the names of the two common columns, syms and times
-   `f0`,`f1` are aggregation functions applied to values in q columns `c0`,`c1` over the intervals

Typically. this might be:

      wj[w;`sym`time;trade;(quote;(max;`ask);(min;`bid))]

For each record in `t`, the result has a record with additional columns `c0` and `c1`, which are the results of the aggregation functions applied to values over the matching intervals in `w`.

A quote is understood to be in existence until the next quote.

Since v3.0, wj and wj1 are both \[\] interval, i.e. they consider quotes&gt;=beginning and &lt;=end of the interval.

For wj, the prevailing quote on entry to the window is considered valid as quotes are a step function.

wj1 considers quotes on or after entry to the window. If the join is to consider quotes that arrive from the beginning of the interval, please use **wj1**.

Prior to v3.0, wj1 considers only quotes in the window except for the window end (i.e. quotes &gt;= start and &lt; end).

**Interval behaviour by version**

|             |         |                   |
|-------------|---------|-------------------|
| **Version** | **wj1** | **wj**            |
| 3.0         | \[\]    | prevailing + \[\] |
| 2.7/2.8     | \[)     | prevailing + \[\] |
||

Example
-------

    q)t:([]sym:3#`ibm;time:10:01:01 10:01:04 10:01:08;price:100 101 105)
    q)t
    sym time     price
    ------------------
    ibm 10:01:01 100
    ibm 10:01:04 101
    ibm 10:01:08 105

    q)q:([]sym:9#`ibm;time:10:01:01+til 9;ask:101 103 103 104 104 107 108 107 108;bid:98 99 102 103 103 104 106 106 107)
    q)q
    sym time     ask bid
    --------------------
    ibm 10:01:01 101 98
    ibm 10:01:02 103 99
    ibm 10:01:03 103 102
    ibm 10:01:04 104 103
    ibm 10:01:05 104 103
    ibm 10:01:06 107 104
    ibm 10:01:07 108 106
    ibm 10:01:08 107 106
    ibm 10:01:09 108 107

    q)f:`sym`time
    q)w:-2 1+\:t.time

    q)wj[w;f;t;(q;(max;`ask);(min;`bid))]
    sym time     price ask bid
    --------------------------
    ibm 10:01:01 100   103 98
    ibm 10:01:04 101   104 99
    ibm 10:01:08 105   108 104

The interval values may be seen as:

    q)wj[w;f;t;(q;(::;`ask);(::;`bid))]
    sym time     price ask             bid
    --------------------------------------------------
    ibm 10:01:01 100   101 103         98 99
    ibm 10:01:04 101   103 103 104 104 99 102 103 103
    ibm 10:01:08 105   107 108 107 108 104 106 106 107

See also
--------

-   [asof](Reference/asof "wikilink")
-   [aj](Reference/aj "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
