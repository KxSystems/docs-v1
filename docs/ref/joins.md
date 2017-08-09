## Overview

A _join_ combines data from two tables, or from a table and a dictionary.

Some joins are _keyed_, in that columns in the first argument are matched with the key columns of the second argument.

Some joins are _as-of_, where a time column in the first argument specifies corresponding intervals in a time column of the second argument. Such joins are not keyed.

In each case, the result has the merge of columns from both arguments. Where necessary, rows are filled with nulls or zeroes.


### Keyed joins

[`^`](#coalesce) coalesce
: Merge two tables

[`ej`](#ej-equi-join) equi-join
: Similar to `ij`, where the columns to be matched are given as a parameter.

[`ij`](#ij-inner-join) inner-join 
: Joins on the key columns of the second table. The result has one row for each row of the first table that matches the key columns of the second table.

[`lj` `ljf`](#lj-ljf-left-join) left-join 
: Joins on the key columns of the second table. The result has one row for each row of the first table. Null values are used where a row of the first table has no match in the second table. This is now built-in to `,\:`.

[`pj`](#pj-plus-join) plus-join 
: A variation on left join. For each matching row, values from the second table are added to the first table, instead of replacing values from the first table.

[`uj`](#uj-union-join) union-join 
: Uses all rows from both tables. If the second table is not keyed, the result is the catenation of the two tables. Otherwise, the result is the left join of the tables, catenated with the unmatched rows of the second table.

[`upsert`](qsql/#upsert) 
: Can be used to join two tables with matching columns (as well as add new records to a table). If the first table is keyed, any records that match on key are updated. The remaining records are appended.

!!! tip "_Join_ operator"
    The [_join_ operator](lists/#join) `,` joins tables and dictionaries as well as lists. For tables `t1` and `t2`:
    
    - `t1,t2` is `t1 upsert t2`
    - `t1,'t2` joins records to records
    - `t1,\:t2` is `t1 lj t2` (since V2.7 2011.01.24)


### As-of joins

In each case, the time column in the first argument specifies \[) intervals in the second argument.

[`wj`, `wj1`](#wj-wj1-window-join) window-join
: The most general forms of as-of join. Function parameters aggregate values in the time intervals of the second table. In `wj`, prevailing values on entry to each interval are considered. In `wj1`, only values occurring within each interval are considered.

[`aj`,`aj0`](#aj-aj0-asof-join) asof-join
: Simpler window joins where only the last value in each interval is used. In the `aj` result, the time column is from the first table, while in the `aj0` result, the time column is from the second table.

[`asof`](#asof) 
: A simpler `aj` where all columns (or dictionary keys) of the second argument are used in the join.


## `aj` `aj0` (asof-join )

Syntax: <code>aj[c<sub>1</sub>…c<sub>n</sub>;t1;t2]</code>

Where 

- `t1` is a table
- `t2` is a simple table 
- <code>c<sub>1</sub>…c<sub>n</sub></code> is a symbol list of column names, common to `t1` and `t2`, and of matching type
- column <code>c<sub>n</sub></code> is of a sortable type (typically time)

returns a table with records from the left-join of `t1` and `t2`.
In the join, the last value (most recent time) is taken.
For each record in `t1`, the result has one record with the items in `t1`, and

- if there are matching records in `t2`, the items of the last (in row order) matching record are appended to those of `t1`;
- otherwise the remaining columns are null.
```q
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
```

!!! tip "Use `aj0` for quote time"
    If the resulting time value is to be from the quote (actual time) instead of the (boundary time) from trade, use `aj0` instead of `aj`.

!!! tip "Speed"
    `aj` should run at a million or two trade records per second; whether trade/quote are mapped or not is irrelevant. However, for speed:
    
    - in-memory quote must have `` `g#sym `` and time sorted within sym. 
    - on-disk quote must have `` `p#sym `` and time sorted within sym.
    
    Note that on-disk `` `g#sym `` does not help.

!!! warning "Map in splays and partions"
    Unlike in memory, to use `aj` with on-disk, you must map in your splay or day-at-a-time partitioned db:
    
    Splay:
    <pre><code class="language-q">
    aj[`sym`time;select .. from trade where ..;select .. from quote]
    </code></pre>
    Partitioned db:
    <pre><code class="language-q">
    aj[`sym`time;select .. from trade where ..;
                 select .. from quote where date = ..]
    </code></pre>
    Further `where` constraints cannot be used, or the columns will be copied instead of mapped into memory (resulting in slowdown for the `aj`).

!!! tip "No need to `select` on quote"
    There is no need to select on quote, i.e. irrespective of the number of quote records, use:
    <pre><code class="language-q">
    aj[`sym`time;select .. from trade where ..;quote]
    </code></pre>
    instead of
    <pre><code class="language-q">
    aj[`sym`time;select .. from trade where ..;
                 select .. from quote where ..]
    </code></pre>


## `asof`

Syntax: `t1 asof t2`

Where `t1` is a table and `t2` is a table or dictionary, and the last key or column of `t2` corresponds to a time column in `t1`, returns the values from the last rows matching the rest of the keys and time less-or-equal-to the time in `t2`.
```q
q)show trade asof`sym`time!(`IBM;09:30:00.0)
price| 96.3e
size | 200
stop | 0b
corr | 0
cond | "T"
ex   | "D"
q)show trade asof([]sym:`AAPL`IBM;ex:"TD";time:09:30:00.0)
price size stop corr cond
-------------------------
78.14 100  0    0    T
96.3  200  0    0    T
```
The following examples use the `mas` table from TAQ.
```q
q)`date xasc`mas       / sort by date
`mas

q)show a!mas asof a:([]sym:`A`B`C`GOOG;date:1995.01.01)
sym  date      | cusip     name                           wi ex uot
---------------| --------------------------------------------------
A    1995.01.01| 049870207 ATTWOODS PLC ADS REP5 ORD/5PNC 0  N  100
B    1995.01.01| 067806109 BARNES GROUP INCORPORATED      0  N  100
C    1995.01.01| 171196108 CHRYSLER CORP                  0  N  100
GOOG 1995.01.01|                                          0

q)show a!mas asof a:([]sym:`A`B`C`GOOG;date:2006.01.01)
sym  date      | cusip     name                      wi ex uot
---------------| ---------------------------------------------
A    2006.01.01| 00846U101 AGILENT TECHNOLOGIES, INC 0  N  100
B    2006.01.01| 067806109 BARNES GROUP INCORPORATED 0  N  100
C    2006.01.01| 172967101 CITIGROUP                 0  N  100
GOOG 2006.01.01| 38259P508 GOOGLE INC CLASS A        0  T  100

q)show a!mas asof a:([]sym:`A;date:1993.01.05 1996.05.23 2000.08.04)
sym date      | cusip     name                           wi ex uot
--------------| --------------------------------------------------
A   1993.01.05| 049870207 ATTWOODS PLC ADS REP5 ORD/5PNC 0  N  100
A   1996.05.23| 046298105 ASTRA AB CL-A ADS 1CL-ASEK2.50 0  N  100
A   2000.08.04| 00846U101 AGILENT TECHNOLOGIES  INC      0  N  100
```


## `^` (coalesce)

Syntax: `t1 ^ t2`

Where `t1` and `t2` are keyed tables returns them merged.
```q
q)kt1:([k:1 2 3] c1:10 20 30;c2:`a`b`c)
q)kt2:([k:3 4 5] c1:300 400 500;c2:`cc`dd`ee)
q)kt1,kt2
k| c1  c2
-| ------
1| 10  a
2| 20  b
3| 300 cc
4| 400 dd
5| 500 ee

q)kt1^kt2
k| c1  c2
-| ------
1| 10  a
2| 20  b
3| 300 cc
4| 400 dd
5| 500 ee
```
When `t2` has null column values, the column values of `t1` are only updated with non-null values of the right operand.
```q
q)kt3:([k:2 3] c1:0N 3000;c2:`bbb`)
q)kt3
k| c1   c2
-| --------
2|      bbb
3| 3000

q)kt1,kt3
k| c1   c2
-| --------
1| 10   a
2|      bbb
3| 3000

q)kt1^kt3
k| c1   c2
-| --------
1| 10   a
2| 20   bbb
3| 3000 c
```

!!! note "Speed"
    The performance of `^` is slower than that of `,` since each column value of the right operand must be checked for null.


## `ej` (equi-join)

Syntax: `ej[c;t1;t2]`

Where `c` is a list of column names (or a single column name) and `t1` and `t2` are tables, returns `t1` and `t2` joined on column/s `c`.
The result has one combined record for each row in `t1` that matches `t2` on columns `c`. (Since V2.6.)
```q
q)t:([]sym:`IBM`FDP`FDP`FDP`IBM`MSFT;price:0.7029677 0.08378167 0.06046216 0.658985 0.2608152 0.5433888)
q)s:([]sym:`IBM`MSFT;ex:`N`CME;MC:1000 250)
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
sym  ex  MC
-------------
IBM  N   1000
MSFT CME 250
q)ej[`sym;s;t]
sym  price     ex  MC
-----------------------
IBM  0.7029677 N   1000
IBM  0.2608152 N   1000
MSFT 0.5433888 CME 250
```

## `ij` (inner-join)

Syntax: `t1 ij t2`

Where `t1` and `t2` are tables, `t2` is keyed, and its key columnns are columns of `t1`, returns two tables joined on the key columns of the second table. The result has one combined record for each row in `t1` that matches a row in `t2`.
```q
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
```

!!! note "Changes in V3.0"
    Since V3.0, `ij` has changed behavior (similarly to `lj`): when there are nulls in `t2`, `ij` uses the `t2` null, where the earlier version left the corresponding value in `t1` unchanged:

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
        q)x ij y        /V3.0
        a b c
        -----
        1   1
        2 z
        q)x ij y        /V2.8
        a b c
        ------
        1 x 1
        2 z 20
        q)


## `lj` `ljf` (left-join)

Syntax: `t1 lj t2`

Where `t1` and `t2` are tables, `t2` is keyed, and the key column/s of `t2` are columns of `t1`, returns `t1` and `t2` joined on the key columns of `t2`. 
For each record in `t1`, the result has one record with the columns of `t1` joined to columns of `t2`:
- if there is a matching record in `t2`, it is joined to the `t1` record. Common columns are replaced.
- if there is no matching record in `t2`, common columns are left unchanged, and new columns are null
```q
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
```
The `t2` columns joined to `t1` are given by:
```q
q)y[select a,b from x]
c d
----
1 10
2 20
```

!!! note "Changes in V3.0"
    Since V3.0, the `lj` operator is a cover for `,\:` (_comma join_) that allows the left argument to be a keyed table. `,\:` was introduced in V2.7 2011.01.24.

    Prior to V3.0, `lj` had similar behavior, with one difference - when there are nulls in the right argument, `lj` in V3.0 uses the right-argument null, while the earlier version left the corresponding value in the left argument unchanged:

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

    Since 2014.05.03, the earlier version is available in all V3.x versions as `ljf`.


## `pj` (plus-join)

Syntax: `t1 pj t2`

Where `t1` and `t2` are tables, `t2` is keyed, and the key column/s of `t2` are columns of `t1`, returns `t1` and `t2` joined on the key columns of `t2`.

`pj` adds matching records in `t2` to those in `t1`, by adding common columns, other than the key columns. These common columns must be of appropriate types for addition.

For each record in `t1`:

- if there is a matching record in `t2` it is added to the `t1` record.
- if there is no matching record in `t2`, common columns are left unchanged, and new columns are zero.

```q
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
```
In the example above, `pj` is equivalent to `` x+0^y[`a`b#x] `` (compute the value of `y` on `a` and `b` columns of `x`, fill the result with zeros and add to `x`).


## `uj` (union-join)

Syntax: `t1 uj t2`

Where `t1` and `t2` are keyed tables, returns the union of the columns, filled with nulls where necessary:

- if `t1` and `t2` have matching key column/s, then records in `t2` update matching records in `t1`
- otherwise, `t2` records are inserted.

```q
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
q)s uj t                         / simple, so second table is inserted
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
```

!!! note "Generalizing the `,` operator"
    The `uj` operator is a type of union join that generalizes the [`,` _join_ operator](lists/#join)


## `wj` `wj1` (window-join)

Syntax: `wj[w;c;t;(q;(f0;c0);(f1;c1))]`

Where:

- `t` and `q` are simple tables to be joined. (`q` should be sorted `` `sym`time `` with `` `p# `` on sym)
- `w` is a pair of lists of times/timestamps, begin and end
- `c` are the names of the two common columns, syms and times
- `f0`,`f1` are aggregation functions applied to values in q columns `c0`,`c1` over the intervals

returns for each record in `t`, a record with additional columns `c0` and `c1`, which are the results of the aggregation functions applied to values over the matching intervals in `w`.

Typically. this might be:
```q
wj[w;`sym`time;trade;(quote;(max;`ask);(min;`bid))]
```
A quote is understood to be in existence until the next quote.

!!! note "Interval behaviour"
    Since V3.0, `wj` and `wj1` are both \[\] interval, i.e. they consider quotes&gt;=beginning and &lt;=end of the interval.
    
    For `wj`, the prevailing quote on entry to the window is considered valid as quotes are a step function.
    
    `wj1` considers quotes on or after entry to the window. If the join is to consider quotes that arrive from the beginning of the interval, use `wj1`.
    
    Prior to V3.0, `wj1` considers only quotes in the window except for the window end (i.e. quotes &gt;= start and &lt; end).
    
    | version | wj1  |  wj               |
    |---------|------|-------------------|
    | 3.0     | `[]` | prevailing + `[]` |
    | 2.7/2.8 | `[)` | prevailing + `[]` |


```q
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
```
The interval values may be seen as:
```q
q)wj[w;f;t;(q;(::;`ask);(::;`bid))]
sym time     price ask             bid
--------------------------------------------------
ibm 10:01:01 100   101 103         98 99
ibm 10:01:04 101   103 103 104 104 99 102 103 103
ibm 10:01:08 105   107 108 107 108 104 106 106 107
```

!!! warning "Joining on multiple symbols"
    Window-joins with multiple symbols should be used only with a `` `p#sym`` like schema. (Typical RTD-like `` `g#`` gives undefined results.) 

!!! warning "Integral windows"
    Only integral types are supported for the column to do the windowing on – no reals, floats or datetimes.

!!! note "A generalization of _asof-join_"
    _Window-join_ is a generalization of _asof-join_, and is available from V2.6. _Asof-join_ takes a snapshot of the current state, while _window-join_ aggregates all values of specified columns within intervals. (Since V3.0, `wj` and `wj1` are both implemented with `ww`.)

