## `!` (dict)

Syntax: `x ! y`

Where `x` and `y` are two [lists](elements/#lists) of the same length, returns a [dictionary](elements/#dictionaries)
```q
q)`a`b`c!1 2 3
a| 1
b| 2
c| 3
```
Because [tables](elements/#tables) are lists of dictionaries with the same keys, `!` applied to each member of a list will return a table of that list. For example:
```
q)(`a`b`c!)each(0 0 0;1 2 3;2 4 6)
a b c
-----
0 0 0
1 2 3
2 4 6
```

!!! tip "Flip me"
    The same result may be achieved with `flip`:

        q)flip`a`b`c!flip(0 0 0;1 2 3;2 4 6)
        a b c
        -----
        0 0 0
        1 2 3
        2 4 6

<i class="fa fa-hand-o-right"></i> [`.h.xt`](doth/#hxt-json) (JSON), [`.Q.qt`](dotq/#qqt-is-table) (is table), [`.Q.V`](dotq/#qv-table-to-dict) (table to dictionary) 


## `group`

Syntax: `group x`

Returns a dictionary in which the keys are the distinct items of `x`, and the values the indices where the distinct items occur. The order of the keys is the order in which they appear in `x`.
```q
q)group "mississippi"
m| ,0
i| 1 4 7 10
s| 2 3 5 6
p| 8 9
```
To count the number of occurrences of each distinct item:
```q
q)count each group "mississippi"
m| 1
i| 4
s| 4
p| 2
```
To get the index of the first occurrence of each distinct item:
```q
q)first each group "mississippi"
m| 0
i| 1
s| 2
p| 8
```


## `!` (key)

Syntax: `x ! y`

Where `x` is a non-negative integer atom and `y` is a table, returns a table:

- if `x` is positive and `y` is simple, returns `y` with `x` key columns.
```q
q)t:([]a:1 2 3;b:10 20 30;c:`x`y`z)
q)2!t
a b | c
----| -
1 10| x
2 20| y
3 30| z
```
- if `x` is 0, returns a simple table.
```q
q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
q)0!t
a b  c
------
1 10 x
2 20 y
3 30 z
```

!!! tip "amending in place"
    If `y` is a table name, instead of returning a table `!` amends `y`
    ```q
    q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
    q)0!`t
    `t
    q)t
    a b  c
    ------
    1 10 x
    2 20 y
    3 30 z
    ```

<i class="fa fa-hand-o-right"></i> [`.Q.fk`](dotq/#qfk-foreign-key) (foreign key), [`.Q.ft`](dotq/#qft-apply-simple) (apply simple), [`.Q.id`](dotq/#qid-sanitize) (sanitize)


## `ungroup`

Syntax: `ungroup x`

Where `x` is a table, in which some cells are lists, but for any row, all lists are of the same length, returns the normalized table, with one row for each item of a lists.
```q
q)p:((enlist 2);5 7 11;13 17)
q)r:((enlist"A");"CDE";"FG")
q)show t:([]s:`a`b`c;p;q:10 20 30;r)
s p      q  r
-----------------
a ,2     10 ,"A"
b 5 7 11 20 "CDE"
c 13 17  30 "FG"
q)ungroup t             / flatten lists p and r
s p  q  r
---------
a 2  10 A
b 5  20 C
b 7  20 D
b 11 20 E
c 13 30 F
c 17 30 G
```
Typically used on the result of `xgroup` or `select`.
```q
q)\l sp.q
q)show t:select p,qty by s from sp where qty>200
s | p            qty
--| ------------------------
s1| `p$`p1`p3`p5 300 400 400
s2| `p$`p1`p2    300 400
s4| `p$,`p4      ,300
q)ungroup t
s  p  qty
---------
s1 p1 300
s1 p3 400
s1 p5 400
s2 p1 300
s2 p2 400
s4 p4 300
```


## `xasc`

<div markdown="1" style="float: right; margin: 0 0 0 1em; padding: 0;">
![xasc](img/xasc.png) 
</div>

_Sorts a table in ascending order of specified columns. The sort is by the first column specified, then by the second column within the first, and so on._

Syntax: `x xasc y`

Where `x` is a symbol vector of column names defined in `y`, which is passed by

- value, returns
- reference, updates

`y` sorted in ascending order by `cols`. 

The `` `s# `` attribute is set on the first column given (if possible).
The sort is stable, i.e. it preserves order amongst equals.
```q
q)\l sp.q
q)s
s | name  status city
--| -------------------
s1| smith 20     london
s2| jones 10     paris
s3| blake 30     paris
s4| clark 20     london
s5| adams 30     athens
q)`city xasc s                 / sort on city
s | name  status city
--| -------------------
s5| adams 30     athens
s1| smith 20     london
s4| clark 20     london
s2| jones 10     paris
s3| blake 30     paris
q)`city`name xasc s            / sort on city, and name within city
s | name  status city
--| -------------------
s5| adams 30     athens
s4| clark 20     london
s1| smith 20     london
s3| blake 30     paris
s2| jones 10     paris
q)`status`city`name xasc s     / sort on 3 columns, status first
s | name  status city
--| -------------------
s2| jones 10     paris
s4| clark 20     london
s1| smith 20     london
s5| adams 30     athens
s3| blake 30     paris
q)`status`city`name xasc `s    / table given by reference, updated in place
`s
q)s
s | name  status city
--| -------------------
s2| jones 10     paris
s4| clark 20     london
s1| smith 20     london
s5| adams 30     athens
s3| blake 30     paris
q)meta s                      / status column has sorted attribute
c     | t f a
------| -----
s     | s
name  | s
status| i   s
city  | s
```

!!! note "Sorting data on disk"
    `xasc` can sort data on disk directly, without loading the entire table into memory.

        q)t:([]b:`s`g`a`s`a;c:30 10 43 13 24;g:til 5)
        q)`:dat/t/ set .Q.en[`:dat]t     / write splayed table
        `:dat/t/
        q)\ls dat/t                      / splayed columns
        ,"b"
        ,"c"
        ,"g"
        q)`c xasc `:dat/t                / sort table on disk by column c
        `:dat/t
        q)t                              / in-memory table is unsorted
        b c  g
        ------
        s 30 0
        g 10 1
        a 43 2
        s 13 3
        a 24 4
        q)\l dat/t                      / load table from disk
        `t
        q)t                             / table is sorted
        b c  g
        ------
        g 10 1
        s 13 3
        a 24 4
        s 30 0
        a 43 2



## `xcol`

Syntax: `x xcol y`

Where `y` is a table (passed by value) and `x` is a symbol vector of length no greater than `count cols y`, returns `y` with its first `count x` columns renamed. 
```q
q)\l trade.q
q)cols trade
`time`sym`price`size
q)`Time`Symbol xcol trade           / rename first two columns
Time         Symbol price size
------------------------------
09:30:00.000 a      10.75 100
q)trade:`Time`Symbol`Price`Size xcol trade  / rename all and assign
q)cols trade
`Time`Symbol`Price`Size
```


## `xcols`

Syntax: `x xcols y`

Where `y` is a simple table (passed by value) of which symbol vector `x` lists some or all of the column names, returns `y` with `x` as its first column/s.
```q
q)\l trade.q
q)cols trade
`time`sym`price`size
q)trade:xcols[reverse cols trade;trade] / reverse cols and reassign trade
q)cols trade
`size`price`sym`time
q)trade:`sym xcols trade                / move sym to the front
q)cols trade
`sym`size`price`time
```
<i class="fa fa-hand-o-right"></i> [`.Q.V`](dotq/#qv-table-to-dict) (table to dictionary) 

## `xdesc`

Syntax: `x xdesc y`

Where `x` is a symbol vector of column names defined in `y`, which is passed by

- value, returns
- reference, updates 

`y` sorted in descending order by `x`. 

The `` `s# `` attribute is not set.
The sort is stable, i.e. it preserves order amongst equals.
```q
q)\l sp.q
q)s
s | name  status city
--| -------------------
s1| smith 20     london
s2| jones 10     paris
s3| blake 30     paris
s4| clark 20     london
s5| adams 30     athens
q)`city xdesc s                 / sort descending by city
s | name  status city
--| -------------------
s2| jones 10     paris
s3| blake 30     paris
s1| smith 20     london
s4| clark 20     london
s5| adams 30     athens
q)meta `city xdesc s            / `s# attribute not set
c     | t f a
------| -----
s     | s
name  | s
status| i
city  | s
```


## `xgroup`

Syntax: `x xgroup y`

Where `y` is a table (passed by value) and symbol atom or vector `x` a list of column names in it, returns `y` grouped by `x`.
It is equivalent to doing a `select … by` on `y`, except that all the remaining columns are grouped without having to be listed explicitly.
```q
q)`a`b xgroup ([]a:0 0 1 1 2;b:`a`a`c`d`e;c:til 5)
a b| c  
---| ---
0 a| 0 1
1 c| ,2 
1 d| ,3 
2 e| ,4 
q)\l sp.q
q)meta sp                        / s and p are both columns of sp
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
```


## `xkey`

Syntax: `x xkey y`

Where symbol atom or vector `x` lists columns in table `y`, which is passed by 

- value, returns 
- reference, updates 

`y` with `x` set as the primary keys.
```q
q)\l trade.q
q)keys trade
`symbol$()            / no primary key
q)`sym xkey trade     / return table with primary key sym
sym| time         price size
---| -----------------------
a  | 09:30:00.000 10.75 100
q)keys trade         / trade has not changed
`symbol$()
q)`sym xkey `trade   / pass trade by reference updates the table in place
`trade
q)keys trade         / sym is now primary key of trade
,`sym
```

<i class="fa fa-hand-o-right"></i> [`.Q.ff`](dotq/#qff-append-columns) (append columns)