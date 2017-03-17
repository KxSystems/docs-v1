The functional forms of [`delete`](qsql/#delete), [`exec`](qsql/#exec), [`select`](qsql/#select) and [`update`](qsql/#update) are particularly useful for programmatically generated queries, such as when column names are dynamically produced. (The q interpreter parses `select`, `exec`, `update` and `delete` into their equivalent functional forms, so there is no performance difference.) The functional forms are
```q
![t;c;b;a]                /update and delete
?[t;c;b;a]                /select and exec
?[t;i;x]                  /simple exec
```

`t`
: is a table. 

`c`
: is a list of **where**-specifications (constraints). 
: Every item in `c` is a triple consisting of a boolean- or int- valued binary function together with its arguments, each an expression containing column names and other variables. The function is applied to the two arguments, producing a boolean vector. The resulting boolean vector selects the rows that yield non-zero results. The selection is performed in the order of the items in `c`, from left to right.

`b`
: is a dictionary of **group-by**-specifications (by phrase). 
: The domain of `b` is a list of symbols that are the key names for the grouping. The range of `b` is a list of column expressions whose results are used to construct the groups. The grouping is ordered by the domain elements, from major to minor.

`a`
: is a dictionary of **select** specifications (aggregations). 
: The domain of `a` is a list of symbols containing the names of the produced columns. Each element of the range of `a` is an evaluation list consisting of a function and its argument/s, each of which is a column name or another such result list. For each evaluation list, the function is applied to the specified value(s) for each row and the result is returned. The evaluation lists are resolved recursively when operations are nested.

`i`
: is a list of indexes

`p`
: is a [parse tree](parsetrees)


!!! note "Use my name"
    All q entities in `a`, `b` and `c` must be referenced by name, meaning they appear as symbols containing the entity names.

!!! note "Enlist me"
    Note throughout the use of [`enlist`](lists/#enlist) to create singletons to ensure that appropriate entities are lists.

<i class="fa fa-external-link-square"></i> <a href="http://www.q-ist.com/2012/10/functional-query-functions.html" target="_blank">[q-ist] Functional Query Functions.</a> 
 


## `?` – select

Syntax: `?[t;c;b;a]`

```q
q)show t:([]n:`x`y`x`z`z`y;p:0 15 12 20 25 14)
n p
----
x 0
y 15
x 12
z 20
z 25
y 14
q)select m:max p,s:sum p by name:n from t where p>0,n in `x`y
name| m  s
----| -----
x   | 12 12
y   | 15 29
```
Following is the equivalent functional form. Note the use of `enlist` to create singletons, ensuring that appropriate entities are lists.
```q
q)c: ((>;`p;0);(in;`n;enlist `x`y))
q)b: (enlist `name)!enlist `n
q)a: `m`s!((max;`p);(sum;`p))
q)?[t;c;b;a]
name| m  s
----| -----
x   | 12 12
y   | 15 29
```

!!! tip "Degenerate cases"
    - For no constraints, make `c` the empty list 
    - For no grouping make `b` a boolean `0b` 
    - To produce all columns of `t` in the result, make `a` the empty list `()`
    
    `select from t` is equivalent to functional form `?[t;();0b;()]`.


## `?` – exec

Syntax: `?[t;c;b;a]`

The functional form of `exec` is a simplified form of _select_. Since the constraint parameter is the same as in _select_, we omit it in the following.
In the simplest example of a single result column, the group-by parameter is the empty list and the aggregate parameter is a symbol atom.
```q
q)exec n from t
`x`y`x`z`z`y
q)?[t;();();`n]           / same as previous exec
`x`y`x`z`z`y
```
In the same query with multiple columns, the group-by parameter is the empty list and the aggregate parameter is a dictionary as it would be in a _select_. Remember that the result is a dictionary rather than a table.
```q
q)exec n,p from t
n| x y  x  z  z  y
p| 0 15 12 20 25 14
q)?[t;();();`n`p!`n`p]    / same as previous exec
n| x y  x  z  z  y
p| 0 15 12 20 25 14
```
If you wish to group by a single column, specify it as a symbol atom.
```q
q)exec p by n from t
x| 0  12
y| 15 14
z| 20 25
q)?[t;();`n;`p]           / same as previous exec
x| 0  12
y| 15 14
z| 20 25
```
More complex examples of _exec_ seem to reduce to the equivalent _select_.


## `?` – simple exec

Syntax: `?[t;i;p]`

Where `t` is a (non-partitioned) table, `i` is a list of indices, and `p` is a [parse tree](parsetrees), is another form of _exec_.
```
q)show t:([]a:1 2 3;b:4 5 6;c:7 9 0)
a b c
-----
1 4 7
2 5 9
3 6 0
q)?[t;0 1 2;`a]
1 2 3
q)?[t;0 1 2;`b]
4 5 6
q)?[t;0 1 2;(last;`a)]
3
q)?[t;0 1;(last;`a)]
2
q)?[t;0 1 2;(*;(min;`a);(avg;`c))]
5.333333
```


## `!` – update

Syntax: `![t;c;b;a]`

```q
q)show t:([]n:`x`y`x`z`z`y;p:0 15 12 20 25 14)
n p
----
x 0
y 15
x 12
z 20
z 25
y 14
q)select m:max p,s:sum p by name:n from t where p>0,n in `x`y
name| m  s
----| -----
x   | 12 12
y   | 15 29
q)update p:max p by n from t where p>0
n p
----
x 0
y 15
x 12
z 25
z 25
y 15
q)c: enlist (>;`p;0)
q)b: (enlist `n)!enlist `n
q)a: (enlist `p)!enlist (max;`p)
q)![t;c;b;a]
n p
----
x 0
y 15
x 12
z 25
z 25
y 15
```

!!! tip
    The degenerate cases are the same as in _select_.


## `!` – delete

The functional form of delete is a simplified form of _update_.
```q
![t;c;0b;a]
```
One of `c` or `a` must be empty, the other not. `c` selects which rows will be removed. `a` is a symbol vector with the names of columns to be removed.
```q
q)t:([]c1:`a`b`c;c2:`x`y`z)

q)/following is: delete c2 from t
q)![t;();0b;enlist `c2]
c1
--
a
b
c

q)/following is: delete from t where c2 = `y
q)![t;enlist (=;`c2; enlist `y);0b;`symbol$()]
c1 c2
-----
a  x
c  z
```


