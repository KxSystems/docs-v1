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
So is the default namespace.
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
```q
q)key`:c:/q
`c`profile.q`sp.q`trade.q`w32
```

To select particular files, use `like`
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
q)()~key`a        /now you don't see it
1b
q)a:1
q)key`a           /now you see it
`a
q)\d .foo
q.foo)key`a       /now you don't
q.foo)a:1 2!3 4
q.foo)key`a       /this one has keys
1 2
q.foo)key`.foo.a  /fully qualified name
1 2
q.foo)key`..a     /fully qualified name
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

- a **positive integer**, returns the same result as [til](arith-integer/#til).
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
- `f` – foreign key (enums)
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
```q
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


## `tables`

Syntax: `tables x`

Where `x` is a reference to a namespace, returns as a symbol vector a sorted list of the tables in `x`
```q
q)\l sp.q
q)tables `.       / tables in default namespace
`p`s`sp
q)tables[]        / default is default namespace
`p`s`sp
q).work.tab:sp    / assign table in work namespace
q)tables `.work   / tables in work
,`tab
```


## `type`

Syntax: `type x`

Returns the [datatype](datatypes) of `x` as a short integer atom: negative for an atom, positive for a list, and `0h` for a general list. 

<table class="kx-tight" markdown="1" style="font-size:80%">
<thead>
<tr><th>n</th><th>c</th><th>name</th><th>sz</th><th>literal</th><th>null</th><th>SQL</th><th>Java</th><th>.Net</th></tr>
</thead>
<tbody>
<tr><td class="nowrap">0</td><td>*</td><td>list</td><td/><td/><td/><td/><td/><td/></tr>
<tr><td class="nowrap">1</td><td>b</td><td>boolean</td><td>1</td><td>`0b`</td><td/><td/><td>Boolean</td><td>boolean</td></tr>
<tr><td class="nowrap">2</td><td>g</td><td>guid</td><td>16</td><td/><td>`0Ng`</td><td/><td>UUID</td><td>GUID</td></tr>
<tr><td class="nowrap">4</td><td>x</td><td>byte</td><td>1</td><td>`0x00`</td><td/><td/><td>Byte</td><td>byte</td></tr>
<tr><td class="nowrap">5</td><td>h</td><td>short</td><td>2</td><td>`0h`</td><td>`0Nh`</td><td>smallint</td><td>Short</td><td>int16</td></tr>
<tr><td class="nowrap">6</td><td>i</td><td>int</td><td>4</td><td>`0i`</td><td>`0Ni`</td><td>int</td><td>Integer</td><td>int32</td></tr>
<tr><td class="nowrap">7</td><td>j</td><td>long</td><td>8</td><td>`0j` or `0`</td><td>`0Nj` or `0N`</td><td>bigint</td><td>Long</td><td>int64</td></tr>
<tr><td class="nowrap">8</td><td>e</td><td>real</td><td>4</td><td>`0e`</td><td>`0Ne`</td><td>real</td><td>Float</td><td>single</td></tr>
<tr><td class="nowrap">9</td><td>f</td><td>float</td><td>8</td><td>`0.0` or `0f`</td><td>`0n`</td><td>float</td><td>Double</td><td>double</td></tr>
<tr><td class="nowrap">10</td><td>c</td><td>char</td><td>1</td><td>`" "`</td><td>`" "`</td><td/><td>Character</td><td>char</td></tr>
<tr><td class="nowrap">11</td><td>s</td><td>symbol</td><td>.</td><td>`` ` ``</td><td>`` ` ``</td><td>varchar</td><td>String</td><td>string</td></tr>
<tr><td class="nowrap">12</td><td>p</td><td>timestamp</td><td>8</td><td>dateDtimespan</td><td>`0Np`</td><td/><td>Timestamp</td><td>DateTime (RW)</td></tr>
<tr><td class="nowrap">13</td><td>m</td><td>month</td><td>4</td><td>`2000.01m`</td><td>`0Nm`</td><td/><td/><td/></tr>
<tr><td class="nowrap">14</td><td>d</td><td>date</td><td>4</td><td>`2000.01.01`</td><td>`0Nd`</td><td>date</td><td>Date</td><td/></tr>
<tr><td class="nowrap">15</td><td>z</td><td>datetime</td><td>8</td><td>dateTtime</td><td>`0Nz`</td><td>timestamp</td><td>Timestamp</td><td>DateTime (RO)</td></tr>
<tr><td class="nowrap">16</td><td>n</td><td>timespan</td><td>8</td><td>`00:00:00.000000000`</td><td>`0Nn`</td><td/><td>Timespan</td><td>TimeSpan</td></tr>
<tr><td class="nowrap">17</td><td>u</td><td>minute</td><td>4</td><td>`00:00`</td><td>`0Nu`</td><td/><td/><td/></tr>
<tr><td class="nowrap">18</td><td>v</td><td>second</td><td>4</td><td>`00:00:00`</td><td>`0Nv`</td><td/><td/><td/></tr>
<tr><td class="nowrap">19</td><td>t</td><td>time</td><td>4</td><td>`00:00:00.000`</td><td>`0Nt`</td><td>time</td><td>Time</td><td>TimeSpan</td></tr>
<tr><td class="nowrap" colspan="2">20-76</td><td>enums</td><td/><td/><td/><td/><td/><td/></tr>
<tr><td class="nowrap">77</td><td/><td colspan="7">anymap</td><td/><td/><td/></tr>
<tr><td class="nowrap" colspan="2">78-96</td><td colspan="7">77+t – mapped list of lists of type t</td><td/><td/><td/></tr>
<tr><td class="nowrap">97</td><td/><td colspan="7">nested sym enum</td><td/><td/><td/></tr>
<tr><td class="nowrap">98</td><td/><td colspan="7">table</td><td/><td/><td/></tr>
<tr><td class="nowrap">99</td><td/><td colspan="7">dictionary</td><td/><td/><td/></tr>
<tr><td class="nowrap">100</td><td/><td colspan="7">lambda</td><td/><td/><td/></tr>
<tr><td class="nowrap">101</td><td/><td colspan="7">unary primitive</td><td/><td/><td/></tr>
<tr><td class="nowrap">102</td><td/><td colspan="7">operator</td><td/><td/><td/></tr>
<tr><td class="nowrap">103</td><td/><td colspan="7">adverb</td><td/><td/><td/></tr>
<tr><td class="nowrap">104</td><td/><td colspan="7">projection</td><td/><td/><td/></tr>
<tr><td class="nowrap">105</td><td/><td colspan="7">composition</td><td/><td/><td/></tr>
<tr><td class="nowrap">106</td><td/><td colspan="7">f'</td><td/><td/><td/></tr>
<tr><td class="nowrap">107</td><td/><td colspan="7">f/</td><td/><td/><td/></tr>
<tr><td class="nowrap">108</td><td/><td colspan="7">f\</td><td/><td/><td/></tr>
<tr><td class="nowrap">109</td><td/><td colspan="7">f':</td><td/><td/><td/></tr>
<tr><td class="nowrap">110</td><td/><td colspan="7">f/:</td><td/><td/><td/></tr>
<tr><td class="nowrap">111</td><td/><td colspan="7">f\:</td><td/><td/><td/></tr>
<tr><td class="nowrap">112</td><td/><td colspan="7">dynamic load</td><td/><td/><td/></tr>
</tbody>
</table>

`n`: short int returned by `type`  
`c`: character used for [casting](casting) and [load-csv](filenumbers/#load-csv)  
`sz`: size in bytes  
RO: read only; RW: read-write

Looking up primitive datatypes:
```q
q)20#.Q.t
" bg xhijefcspmdznuvt"
q){key x$()}'[(20#.Q.t)except" "]
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
<i class="fa fa-hand-o-right"></i> [`.Q.v`](dotq/#qv-value) (value)

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

(bytecode; parameters; locals; (context; globals); constants[0]; …; constants[n]; definition)
```q
q)f:{[a;b]d::neg c:a*b+5;c+e}
q)value f
0xa0794178430316220b048100028276410004
`a`b
,`c
``d`e
5
"{[a;b]d::neg c:a*b+5;c+e}"
q)/ Now define in .test context – globals refer to current context of test
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

(cached value; parse tree; dependencies; definition)

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
```q
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
q)value("{x+y}";1;2)
3
```
The string form can be useful as a kind of ‘prepared statement’ from the Java client API since the Java serializer doesn’t support lambdas and verbs.

!!! note "`value` and `get`"
    The function `value` is the same as [`get`](filewords/#get). By convention `get` is used for file I/O but the two are interchangeable.
    <pre><code class="language-q">
    q)get "2+3"                / same as value
    5
    q)value each (get;value)   / same internal code
    19 19
    </code></pre>


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
<i class="fa fa-hand-o-right"></i> [Tutorials/Views](/tutorials/views)


## `views`

Syntax: `views[]`

Returns a sorted list of the views currently defined in the default namespace.
```q
q)w::b*10
q)v::2+a*3
q)views[]
`s#`v`w
```
<i class="fa fa-hand-o-right"></i> [Tutorials/Views](/tutorials/views)





##`.z.s` (self)

Returns the current function.  
<i class="fa fa-hand-o-right"></i> [`.z.s`](dotz/#zvs-value-set)