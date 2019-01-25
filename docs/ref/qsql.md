Q-SQL expressions have their own syntax rules, with optional dependent clauses, such as `from` and `where`. Q-SQL column lists are comma-separated lists of column names, not symbol vectors, and can include definitions of new, _derived_ columns. 

!!! note "Call by value, call by reference"

    In Q-SQL expressions, where a table is called

    - by value, the expression returns a result
    - by reference, the table is _replaced_ as a side effect, and its name returned

    <pre><code class="language-q">
    q)t1:t2:([]a:1 2;b:3 4)
    q)update a:neg a from t1
    a  b
    \----
    -1 3
    -2 4
    q)t1~t2
    1b
    q)update a:neg a from \`t1
    `t1
    q)t1~t2
    0b
    </code></pre>

Q-SQL templates all have [functional forms](funsql), which can be used without performance penalty. 

<i class="fa fa-hand-o-right"></i> 
[_Q for Mortals_: The `select` template](http://code.kx.com/q4m3/9_Queries_q-sql/#93-the-select-template)



## `delete`

Syntax: `delete from t [where {cond}]`  
Syntax: `delete [cols] from t`  
Syntax: `delete [keys] from x`  
Syntax: `delete from x` 

Where 

- `t` is a table and `{cond}` a condition, deletes rows matching `{cond}`

```q
q)show table: ([] a: `a`b`c; n: 1 2 3)
a n
---
a 1
b 2
c 3
q)show delete from table where a = `c
a n
---
a 1
b 2
```

- `t` is a table and `cols` a list of column names, deletes `cols`

```q
q)show delete n from table
a
-
a
b
c
```

- `x` and `keys` are a dictionary and a list of keys to it, deletes entries for `keys`

```q
q)show d:`a`b`c!til 3
a| 0
b| 1
c| 2
q)delete b from `d
`d
q)d
a| 0
c| 2
```

- `x` and `keys` are a namespace and a list of names defined in it, deletes the named objects

```q
q)a:1
q)\v
,`a
q)delete a from `.
`.
q)\v
`symbol$()
```

[![DevOps Borat on delete](../img/borat_delete.jpg)](https://twitter.com/devops_borat)



## `exec`

Syntax: `exec [{cols}] from t [where {cond}]`

```q
q)\l sp.q
q)exec qty from sp /list 
300 200 400 200 100 100 300 400 200 200 300 400
q)exec (qty;s) from sp /list per column 
300 200 400 200 100 100 300 400 200 200 300 400
s1  s1  s1  s1  s4  s1  s2  s2  s3  s4  s4  s1
q)exec qty, s from sp /dict by column name
qty| 300 200 400 200 100 100 300 400 200 200 300 400
s  | s1  s1  s1  s1  s4  s1  s2  s2  s3  s4  s4  s1
q)exec sum qty by s from sp /dict by key 
s1| 1600
s2| 700
s3| 200
s4| 600
q)exec q:sum qty by s from sp /xtab:list!table 
  | q
--| ----
s1| 1600
s2| 700
s3| 200
s4| 600
q)exec sum qty by s:s from sp /table!list 
s |
--| ----
s1| 1600
s2| 700
s3| 200
s4| 600
q)exec qty, s by 0b from sp /table
qty s
------
300 s1
200 s1
400 s1
200 s1
100 s4
100 s1
300 s2
400 s2
200 s3
200 s4
300 s4
400 s1
q)exec q:sum qty by s:s from sp
s | q
--| ----
s1| 1600
s2| 700
s3| 200
s4| 600
```



## `fby`

Syntax: `(aggr;data) fby group`

Where 

-   `aggr` is an aggregate function 
-   `data` is a vector
-   `group` is either a vector conforming to `data` or a table 

collects the items of `data` into sublists according to the corresponding items of `group`, applies `aggr` to each sublist, and returns the results as a vector with the same count as `data`.

!!! tip

    `fby` is designed to collapse cascaded `select … from select … by … from t` expressions into a single `select … by … from … where … fby …`. Think of `fby` when you find yourself trying to apply a filter to the aggregated column of a table produced by `select … by …`.

```q
q)dat: 0 1 2 3 4 5 6 7 8 9
q)grp:`a`b`a`b`c`d`c`d`d`a
q)(sum;dat) fby grp
11 4 11 4 10 20 10 20 20 11
```

Collect the items of `data` into sublists according to the items of `group`.

```q
0 2 9  (`a)
1 3    (`b)
4 6    (`c)
5 7 8  (`d)
```

Apply `aggr` to each sublist.

```q
sum 0 2 9 -> 11
sum 1 3   -> 4
sum 4 6   -> 10
sum 5 7 8 -> 20
```

The result is created by replacing each item of `group` with the result of applying `aggr` to its corresponding sublist. 

```q
q)(sum;dat) fby grp
11 4 11 4 10 20 10 20 20 11
q)(sum each dat group grp)grp / w/o fby
11 4 11 4 10 20 10 20 20 11
```

When used in a `select`, usually a comparison function is applied to the results of `fby`.

```q
q)select from t where 10 < (sum;d) fby a

q)dat:2 5 4 1 7             / data
q)grp:"abbac"               / group by
q)(sum;dat) fby grp         / apply sum to the groups
3 9 9 3 7
q)(first;dat) fby grp       / apply first to the groups
2 5 5 2 7

q)\l sp.q
q)show sp                                       / for reference
s  p  qty
---------
s1 p1 300
s1 p2 200
s1 p3 400
s1 p4 200
s4 p5 100
s1 p6 100
s2 p1 300
s2 p2 400
s3 p2 200
s4 p2 200
s4 p4 300
s1 p5 400
```

Sales where quantity &gt; average quantity by part:

```q
q)select from sp where qty > (avg;qty) fby p
s  p  qty
---------
s2 p2 400
s4 p4 300
s1 p5 400
```

Sales where quantity = maximum quantity by part:

```q
q)select from sp where qty = (max;qty) fby p
s  p  qty
---------
s1 p1 300
s1 p3 400
s1 p6 100
s2 p1 300
s2 p2 400
s4 p4 300
s1 p5 400
```

To group on multiple columns, tabulate them in `group`.

```q
q)update x:12?3 from `sp
`sp
q)sp
s  p  qty x
-----------
s1 p1 300 0
s1 p2 200 2
s1 p3 400 0
s1 p4 200 1
s4 p5 100 0
s1 p6 100 0
s2 p1 300 0
s2 p2 400 2
s3 p2 200 2
s4 p2 200 2
s4 p4 300 1
s1 p5 400 1
q)select from sp where qty = (max;qty) fby ([]s;x)
s  p  qty x
-----------
s1 p2 200 2
s1 p3 400 0
s4 p5 100 0
s2 p1 300 0
s2 p2 400 2
s3 p2 200 2
s4 p2 200 2
s4 p4 300 1
s1 p5 400 1
```

!!! note "`fby` before V2.7"

    In V2.6 and below, `fby`’s behaviour is undefined if the aggregation function returns a list; it usually signals an error from the k definition of `fby`. However, if the concatenation of all list results from the aggregation function results `raze` has the same length as the original vectors, a list of some form is returned, but the order of its items is not clearly defined.


## `insert`

Syntax: `tname insert records`

Insert or append records to a table. Where `tname` is a table name (as a symbol atom), and `records` is one or more records that match the table columns, returns the new row indexes. 

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

If the table is keyed, the new records may not match existing keys.

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

!!! tip "Function-local tables"

    `insert` can insert to global variables only, due to the lookup of the symbol name. If you need to insert to function-local tables, use `table,:data` instead.

<i class="fa fa-hand-o-right"></i> 
[`,` _join_](lists/#join)


## `select`

Syntax: `select [cols] [by groups] from t [where filters]`

`select` retrieves specified columns from a table. It has many forms; not all are described here. 

### Limiting results

To limit the returned results you can also use these forms:

```q
select[n]
select[m n]
select[order]
select[n;order]
```

where 

- `n` limits the result to the first `n` rows of the selection if positive, or the last `n` rows if negative 
- `m` is the number of the first row to be returned: useful for stepping through query results one block of `n` at a time
- `order` is a column (or table) and sort order: use `<` for ascending, `>` for descending

```q
select[3;>price] from bids where sym=s,size>0
```

This would return the three best prices for symbol `s` with a size greater than 0.

This construct works on in-memory tables but not on memory-mapped tables loaded from splayed or partitioned files. 

!!! tip "Performance characteristic"

    `select[n]` applies the where-clause on all rows of the table, and takes the first `n` rows, before applying the select-clause. So if you are paging it is better to store the result of the query somewhere and `select[n,m]` from there, rather than run the filter again.


### Performance 

- Select only the columns you will use.
- Use the most restrictive constraint first.
- Ensure you have a suitable attribute on the first non-virtual constraint (e.g.`` `p`` or `` `g`` on sym).
- Constraints should have the unmodified column name on the left of the constraint operator (e.g. where sym in syms,…)
- When aggregating, use the virtual field first in the by-clause. (E.g. `select .. by date,sym from …`)

!!! tip 

    ``…where `g=,`s  within …``  
    Maybe rare to get much speedup, but if the `` `g `` goes to 100,000 and then `` `s `` is 1 hour of 24 you might see some overall improvement (with overall table of 30 million). 


### Multithreading

The following pattern will make use of slave threads via `peach`

```q
select … by sym, … from t where sym in …, … 
```

when `sym` has a `` `g`` or `` `p`` attribute. (Since V3.2 2014.05.02)

It uses `peach` for both in-mem and on-disk tables. For single-threaded, this is approx 6&times; faster in-mem, 2&times; faster on disk, and uses less memory than previous releases – but mileage will vary. This is also applicable for partitioned DBs as

```q
select … by sym, … from t where date …, sym in …, …
```

<i class="fa fa-hand-o-right"></i> [Parallel processing](peach)


### Special functions

The following functions (essentially `.Q.a0` in q.k) receive special treatment within `select`:

`count`, `first`, `last`, `sum`, `prd`, `min`, `max`, `med`, `avg`, `wsum`, `wavg`, `var`, `dev`, `cov`, `cor`

When used explicitly, such that it can recognize the usage, q will perform additional steps, such as enlisting results or aggregating across partitions. However, when wrapped inside another function, q does not know that it needs to perform these additional steps, and it is then left to the programmer to insert them.

```q
q)select sum a from ([]a:1 2 3)
a
-
6
q)select {(),sum x}a from ([]a:1 2 3)
a
-
6
```


### Name resolution

Resolution of a name within select/exec/update is as follows:

1. column name
1. local name in (or param of) the encapsulating function
1. global name in the current working namespace – not necessarily the space in which the function was defined

!!! tip 

    You can [refer explicitly to namespaces](elements/#names-and-namespaces):

    <pre><code class="language-q">
    select (\`. \`toplevel) x from t
    </code></pre>


### Implicit arguments

When compiling functions, the implicit args `x`, `y`, `z` are visible to the compiler only when they are not inside the select-, by- and where-clauses. The from-clause is not masked. This can be observed by taking the [`value`](metadata/#value) of the function and observing the second item: the args.

```q
q)args:{(value x)1}
q)args{} / no explicit args, so x is a default implicit arg of identity (::)
,`x
q)/from clause is not masked, y is detected as an implicit arg here
q)args{select from y where a=x,b=z}
`x`y
q)args{[x;y;z]select from y where a=x,b=z} / x,y,z are now explicit args
`x`y`z
q)/call with wrong number of args results in rank error
q){select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2]
'rank
  [0]  {select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2]
       ^
q)/works with explicit args
q){[x;y]select from ([]a:0 1;b:2 3) where a=x,b=y}[0;2]
a b
---
0 2
```


### _cond_

The tertiary conditional _cond_ is not supported inside q-SQL expressions.

```q
q)u:([]a:raze ("ref/";"kb/"),\:/:"abc"; b:til 6)
q)select from u where a like $[1b;"ref/*";"kb/*"]
'rank
  [0]  select from u where a like $[1b;"ref/*";"kb/*"]
                                  ^
```

Enclose in a lambda

```q
q)select from u where a like {$[x;"ref/*";"kb/*"]}1b
a       b
---------
"ref/a" 0
"ref/b" 2
"ref/c" 4
```

or use the [_vector conditional_](lists.md#vector-conditional) instead.

## `update`

<i class="fa fa-hand-o-right"></i> [_Q for Mortals_: The `update` template](http://code.kx.com/q4m3/9_Queries_q-sql/#95-the-update-template)


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

<i class="fa fa-hand-o-right"></i> 
[`,` _join_](lists/#join), 
[joins](joins)
