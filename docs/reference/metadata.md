## `attr`

Syntax: `attr x`

Returns the attributes of `x`. It can be applied to all data types. The possible attributes are:

-   `` `s# `` sorted
-   `` `u# `` unique (hash table)
-   `` `p# `` partitioned (grouped)
-   `` `g# `` true index (dynamic attribute): enables constant time update and access for real-time tables

The result is a symbol atom and is one of `` `s`u`p`g` `` with `` ` `` meaning no attributes are set on the argument.
```q
q)attr 1 3 4
`
q)attr asc 1 3 4
`s
```


## `cols`

Syntax: `cols x`

Where `x` is a table, returns as a symbol vector its column names. The table can be passed by reference or by value.
```q
q)\l trade.q
q)cols trade            /value
 `time`sym`price`size
q)cols`trade            /reference
 `time`sym`price`size
```


## `fkeys`

Syntax: `fkeys x`

Where `x` is a table, returns a dictionary that maps foreign-key columns to their tables.
```q
q)f:([x:1 2 3]y:10 20 30)
q)t:([]a:`f$2 2 2;b:0;c:`f$1 1 1)
q)meta t
c| t f a
-| -----
a| i f
b| i
c| i f
q)fkeys t
a| f
c| f
```


## `key`

Syntax `key x`

Where `x` is

- a **dictionary** (by value or by reference), returns its keys as a symbol vector.
```q
q)D:`q`w`e!(1 2;3 4;5 6)
q)key D
`q`w`e
q)key `D
`q`w`e
```
A namespace is a dictionary.
```q
q)key `.
`D`daily`depth`mas`sym`date`nbbo...
q)key `.q
``neg`not`null`string`reciprocal`floor`ceiling`signum`mod`xbar`xlog`and`or`ea..
```
So is the root namespace.
```q
q)key `           /list namespaces in the root
`q`Q`h`o`util`rx
```

- a **keyed table** (by value or reference), returns its key column/s.
```q
q)K:([s:`q`w`e]g:1 2 3;h:4 5 6)
q)key K
s
-
q
w
e
```

- a **directory filepath**, returns a list of objects in the directory. 
```
q)key`:c:/q
`c`profile.q`sp.q`trade.q`w32
```

!!! tip "To select particular files, use `like`"
    ```q
    q)f:key`:c:/q
    q)f where f like "*.q"
    `profile.q`sp.q`trade.q
    ```

- a **filepath**, returns the descriptor if the file exists, otherwise an empty list.
```q
q)key`:c:/q/sp.q
`:c:/q/sp.q
q)key`:c:/q/notfound.q
()
```
Note that an empty directory returns an empty symbol vector, while a non-existent directory returns an empty _general_ list.
```q
q)\ls foo
ls: cannot access foo: No such file or directory
'os
q)()~key`:foo
1b
q)\mkdir foo
q)key`:foo
`symbol$()
```

- a **symbol atom** that is not a file or directory descriptor, nor the name of a dictionary or table, returns the original symbol if a variable of that name exists, otherwise an empty list. The name is interpreted relative to the current context if not fully qualified.
```q
q)()~key`a.       /now you don't see it
1b
q)a:1
q)key`a.          /now you see it
`a
q)\d .foo
q.foo)key`a.      /now you don't
q.foo)a:1 2!3 4
q.foo)key`a       /this one has keys
1 2
q.foo)key`.foo.a. /fully qualified name
1 2
q.foo)key`..a.    /fully qualified name
`..a
q.foo)\d .
q)key`a
`a
q)key`.foo.a
1 2
q)key`..a
`..a
```

- a **foreign-key column**, returns the name of the foreign-key table.
```q
q)f:([f:1 2 3]v:`a`b`c)
q)x:`f$3 2
q)key x
`f
```

- a **vector**, returns the name of its type as a symbol.
```q
q)key each ("abc";101b;1 2 3h;1 2 3;1 2 3j;1 2 3f)
`char`boolean`short`int`long`float
q)key 0#5
`long
```

- an **enumerated list**, returns the name of the enumerating list.
```q
q)ids:`a`b`c
q)x:`ids$`a`c
q)key x
`ids
```

- a **positive integer**, returns the same result as [til](arithmetic-integer/#til).
```q
q)key 10
0 1 2 3 4 5 6 7 8 9
```


## `keys`

Syntax: `keys x`

Where `x` is a table (by value or reference), returns as a symbol vector the primary key column/s of `x` – empty if none.
```q
q)\l trade.q        / no keys
q)keys trade
`symbol$()
q)keys`trade
`symbol$()
q)`sym xkey`trade   / define a key
q)keys`trade
,`sym
```


## `meta`

Syntax: `meta x`

Where `x` is a table (by value or reference) returns a table keyed by column name, with columns:

- `c` – column name
- `t` – data type
- `f` – foreign key (enumeration)
- `a` – attribute

```q
q)\l trade.q
q)show meta trade
c    | t f a
-----| -----
time | t
sym  | s
price| f
size | i
q)show meta `trade
c    | t f a
-----| -----
time | t
sym  | s
price| f
size | i
q)`sym xasc`trade;   / sort by sym thereby setting the `s attribute
q)show meta trade
c    | t f a
-----| -----
time | t
sym  | s   s
price| f
size | i
```
The `t` column denotes the column type. A lower-case letter indicates atomic entry and an upper-case letter indicates a list.
```
q)show u:([] code:`F1; vr:(enlist 2.3))
code vr
--------
F1   2.3
q)meta u
c   | t f a
----| -----
code| s
vr  | f
q)show v:([] code:`F2; vr:(enlist (5.4; 43.2)))
code vr
-------------
F2   5.4 43.2
q)meta v
c   | t f a
----| -----
code| s
vr  | F
```


## `show`

Syntax: `show x`

Formats `x` and writes it to the console, returns the identity function `(::)`.
```q
q)a:show til 5
0 1 2 3 4
q)a~(::)
1b
```

!!! tip "Display intermediate values"
    ```q
    q)f:{a:x<5;sum a}
    q)f 2 3 5 7 3
    3
    q)f:{show a:x<5;sum a}    / same function, showing value of a
    q)f 2 3 5 7 3
    11001b
    3
    ```

## `tables`

Syntax: `tables x`

Where `x` is a reference to a namespace, returns as a symbol vector a sorted list of the tables in `x`
```
q)\l sp.q
q)tables `.       / tables in root namespace
`p`s`sp
q)tables[]        / default is root namespace
`p`s`sp
q).work.tab:sp    / assign table in work namespace
q)tables `.work   / tables in work
,`tab
```


## `type`

Syntax: `type x`

Returns the type of `x` as a short integer atom: negative for an atom, positive for a list, and `0h` for a general list. 

<i class="fa fa-hand-o-right"></i> [Datatypes](datatypes), [Casting](casting)

!!! tip "Looking up primitive datatypes"
    ```q
    q)20#.Q.t
    " bg xhijefcspmdznuvt"
    q){key x$()}'[.Q.t where " "<>20#.Q.t]
    `boolean`guid`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time
    q)flip{(x;.Q.t x;key'[x$\:()])}5h$where" "<>20#.Q.t
    1h  "b" `boolean
    2h  "g" `guid
    4h  "x" `byte
    5h  "h" `short
    6h  "i" `int
    7h  "j" `long
    8h  "e" `real
    9h  "f" `float
    10h "c" `char
    11h "s" `symbol
    12h "p" `timestamp
    13h "m" `month
    14h "d" `date
    15h "z" `datetime
    16h "n" `timespan
    17h "u" `minute
    18h "v" `second
    19h "t" `time
    ```


## `value`

Syntax: `value x`

Where `x` is

- a **dictionary**, returns its values.
```q
q)d:`q`w`e!(1 2;3 4;5 6)
q)value d
1 2
3 4
5 6
```

- a **symbol**, returns the value of the variable it names.
```q
q)a:1 2 3
q)`a
`a
q)value `a
1 2 3
```

- an **enumeration**, returns the corresponding symbol vector.
```q
q)e:`a`b`c
q)x:`e$`a`a`c`b
q)x
`e$`a`a`c`b
q)value x
`a`a`c`b
```

- a **function**, returns a list:
```
(bytecode;parameters;locals;(context;globals);constants[0];...;constants[n];definition)
```
```q
q)f:{[a;b]d::neg c:a*b+5;c+e}
q)value f
0xa0794178430316220b048100028276410004
`a`b
,`c
``d`e
5
"{[a;b]d::neg c:a*b+5;c+e}"
q)/ Now define in .test context - globals refer to current context of test
q)\d .test
q.test)f:{[a;b]d::neg c:a*b+5;c+e}
q.test)value f
0xa0794178430316220b048100028276410004
`a`b
,`c
`test`d`e
5
"{[a;b]d::neg c:a*b+5;c+e}"
```

- a **view**, returns a list:
```
(cached value;parse tree;dependencies;definition)
```
When the view is _pending_, the cached value is `::`.
```q
q)a:1
q)b::a+1
q)get`. `b
::
(+;`a;1)
,`a
"a+1"
q)b
2
q)get`. `b
2
(+;`a;1)
,`a
"a+1"
q)
```

- a **projection**, returns a list of the function followed by the given arguments.
```q
q)value +[2]
+
2
```

- a **composition**, returns a list of the composed functions.
```q
q)value differ
~:
~':
```

- a **primitive**, returns the internal code for the primitive.
```q
q)value each (::;+;-;*;%)
0 1 2 3 4
```

- a **derivative**, returns the original function.
```
q)f:+/
q)f 1 2 3
6
q)value f
+
```

- a **string**, returns the result of evaluating it in the current context.
```q
q)value "enlist a:til 5"
0 1 2 3 4
q)value "k)<2 7 3 1"
3 0 2 1
q)\d .a
q.a)value"b:2"
2
q.a)b
2
q.a)\d .
q)b
'b
q).a.b
2
```

- a **list**, returns the result of applying the first item to the rest. If the first item is a symbol, it is evaluated first.
```q
q)value(+;1;2)
3
q)value(`.q.neg;2)
-2
```

!!! note "`value` and `get`"
    The function `value` is the same as [`get`](filewords/#get). By convention `get` is used for file I/O but the two are interchangeable.
    ```q
    q)get "2+3"                / same as value
    5
    q)value each (get;value)   / same internal code
    19 19
    ```


## `view`

Syntax: `view x`

Where `x` is a view (by reference), returns the expression defining `x`.
```q
q)v::2+a*3                        / define dependency v
q)a:5
q)v
17
q)view `v                         / view the dependency expression
"2+a*3"
```
<i class="fa fa-hand-o-right"></i> [Views](http://code.kx.com/wiki/Views)


## `views`

Syntax: `views[]`

Returns a sorted list of the views currently defined in the root namespace.
```q
q)w::b*10
q)v::2+a*3
q)views[]
`s#`v`w
```