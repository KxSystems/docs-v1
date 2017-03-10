==FIXME==

When running [update](Reference/update "wikilink") and [delete](Reference/delete "wikilink") statements on a table, putting a \` before the table's name will modify the table:

    q)t1:t2:([]a:1 2;b:3 4)
    q)update a:neg a from t1
    a  b
    ----
    -1 3
    -2 4
    q)t1~t2
    1b
    q)update a:neg a from `t1
    `t1
    q)t1~t2
    0b



## `delete`

Delete rows, and columns, from a table.
```q
q)table: ([] a: `a`b`c; n: (1 2 3))
q)show table
a n
---
a 1
b 2
c 3
```
Delete all or selected rows, returning a new table.
```q
q)show delete from table where a = `c
a n
---
a 1
b 2
```
Delete one or more columns, returning a new table.
```q
q)show delete n from table
a
-
a
b
c
```
Deletion is _in-place_ if the table name is referred to as a symbol, ``  `table`` rather than `table`.

Delete objects:
```q
q)a:1
q)\v
,`a
q)delete a from `.
`.
q)\v
`symbol$()
```

![DevOps Borat on delete](../img/borat_delete.jpg)


## `exec`

<i class="fa fa-hand-o-right"></i> [`select` and `exec` templates](http://code.kx.com/wiki/JB:QforMortals2/queries_q_sql#The_select_and_exec_Templates)


## `insert`

Insert or append records to a table.

Syntax: `` `table insert records``  
Syntax: ` table insert records`

where `table` is the symbol name of a table, and `records` is one or more records that match the table columns. The result is the new row indexes. Note that `insert` can insert to global variables only, due to the lookup of the symbol name. If you need to insert to function-local tables, use `table,:data` instead.

If the table is keyed, the new records may not match existing keys.
```q
q)show x:([a:`x`y];b:10 20)
a| b
-| --
x| 10
y| 20
q)`x insert (`z;30)
,2
q)x
a| b
-| --
x| 10
y| 20
z| 30
```
New records may not match existing keys:
```q
q)`x insert (`z;30)
'insert
```
Several records may be appended at once:
```q
q)`x insert (`s`t;40 50)
3 4
q)x
a| b
-| --
x| 10
y| 20
z| 30
s| 40
t| 50
```

<i class="fa fa-hand-o-right"></i> [`,` _join_](listfuctions/#join)


## `select`

`select` retrieves specified columns from a table. It has many forms; not all are described here. 

<i class="fa fa-hand-o-right"></i> [`select` and `exec` templates](http://code.kx.com/wiki/JB:QforMortals2/queries_q_sql#The_select_and_exec_Templates)

In general, it is:
```q
select columns by groups from table where filters
```
To limit the returned results you can use any of these:
```q
select[n]
select[m n]
select[order]
select[n;order]
```
`n` is the number of rows you wish to return (use `-n` for getting from the back as in [_take_](listfunctions/#take)). `m` is the row number you wish to start with. This is useful for stepping through query results one block of `n` at a time. `order` is a column (or table) and direction to order the results by; use `<` for ascending and `>` for descending.
```q
select[3;>price] from bids where sym=s,size>0
```
This would return the three best prices for symbol `s` with a size greater than 0.

!!! note 
    This construct works on in-memory tables but not on memory-mapped tables loaded from splayed or partitioned files. Another technique for limiting results from partitioned tables is to apply an additional final constraint
    ```q
    select...where..,(n&amp;count i)#1b
    ```
    which limits the results to `n` per partition.

Performance characteristic: `select[n]` applies the where-clause on all rows of the table, and takes the first `n` rows, before applying the select-clause. Hence, if you are doing paging, it is better to store the result of the query somewhere and `select[n,m]` from there instead of running the filter again.

!!! tip "Quick performance tips"
    - Select only the columns you will use.
    - Use the most restrictive constraint first.
    - Ensure you have a suitable attribute on the first non-virtual constraint (e.g.`` `p`` or `` `g`` on sym).
    - Constraints should have the unmodified column name on the left of the constraint operator (e.g. where sym in syms,…)
    - When aggregating, use the virtual field first in the by-clause. (E.g. `select .. by date,sym from …`)


### Multithreading

Since V3.2 2014.05.02, the following pattern will make use of slave threads via `peach`
```q
 select .. by sym,.. from t where sym in ...,.. when sym has a `g or `p attribute.
```
It uses `peach` for both in-mem and on-disk tables. For single-threaded, this is approx 6&times; faster in-mem, 2&times; faster on disk, and uses less memory than previous releases – but mileage will vary. This is also applicable for partitioned DBs as
```q
select .. by sym,.. from t where date ..,sym in ..,..
```


### Special functions within select

The following functions receive special treatment within `select`:

`count`, `first`, `last`, `sum`, `prd`, `min`, `max`, `med`, `avg`, `wsum`, `wavg`, `var`, `dev`, `cov`, `cor`

(essentially `.Q.a0` in q.k)

When used explicitly, such that it can recognize the usage, q will perform additional steps, such as enlisting results or aggregating across partitions. However, when wrapped inside another function, q does not know that it needs to perform these additional steps, and it is then left to the programmer to insert them.
``q
q)select sum a from ([]a:1 2 3)
a
-
6
q)select {(),sum x}a from ([]a:1 2 3)
a
-
6
``

### Scope

_In what places are the local variables masked?_

When compiling functions, the implicit args `x`, `y`, `z` are visible to the compiler only when they are not inside the select-, by- and where-clauses. The from-clause is not masked. This can be observed by taking the value of the function and observing the first element (args).
```q
q)value{} / no explicit args, so x is a default implicit arg of identity (::)
0x100001
,`x
`symbol$()
,`
"{}"

q)value{select from y where a=x,b=z} / from clause is not masked, y is detected as an implicit arg here
0x0ba0a179a20a040005
`x`y
`symbol$()
,`
0b
((=;`a;`x);(=;`b;`z))
?
"{select from y where a=x,b=z}"

q)value{[x;y;z]select from y where a=x,b=z} / x,y,z are now explicit args
0x0ba0a179a20a040005
`x`y`z
`symbol$()
,`
0b
((=;`a;`x);(=;`b;`z))
?
"{[x;y;z]select from y where a=x,b=z}"


q){select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2] / call with wrong number of args results in rank error
'rank

q){[x;y]select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2] / works with explicit args
a b
---
0 2
```
`select` is
```q
?\[t;c;b;a\]
```
`t` is a table.

`(c;b;a)` are all parse expressions executed in the context of `t`

Functional form of `select` can take a fifth or sixth parameter too. 
```q
?[t;c;b;a;n [m]; order]
```

### ``…where `g=,`s  within …``

Maybe rare to get much speedup,but if the `` `g `` goes to 100,000 and then `` `s `` is 1 hour of 24 you might see some overall improvement (with overall table of 30 million). 


## `update`

<i class="fa fa-hand-o-right"></i> [`update` template](http://code.kx.com/wiki/JB:QforMortals2/queries_q_sql#The_update_Template)


## `upsert`

Syntax: `table upsert new_records`

The `upsert` operator adds new records to a table.

If the table is keyed, any new records that match on key are updated. Otherwise, new records are inserted.

If the table is passed by reference, it is updated in place. Otherwise the updated table is returned.
```q
q)show a:([s:`q`w`e]r:1 2 3;u:5 6 7)
s| r u
-| ---
q| 1 5
w| 2 6
e| 3 7
q)a upsert ([s:`e`r`q]r:30 4 10;u:70 8 50)    / update `q and `e, insert new `r
s| r  u                                       / returning new table
-| -----
q| 10 50
w| 2  6
e| 30 70
r| 4  8
q)`a upsert ([s:`e`r`q]r:30 4 10;u:70 8 50)   / same but updating table in place
`a
```
<i class="fa fa-hand-o-right"></i> [`,` _join_](listfunctions/#join), [joins](joins)