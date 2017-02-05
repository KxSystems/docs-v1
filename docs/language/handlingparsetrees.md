## eval

Syntax: `eval x`

Where `x` is a [parse tree](datatypes#parse-tree), returns the result of evaluating it. 

The `eval` function is the complement of `parse` and can be used to evaluate the parse trees it returns. (Also parse trees constructed explicitly.)
```q
q)parse "2+3"
+
2
3
q)eval parse "2+3"
5
q)eval (+;2;3)      / constructed explicitly
5
```


## parse 

Syntax: `parse x`

Where `x` is a string representing a well-formed q or k expression, returns a [parse tree](datatypes#parse-tree). (V3.4 can accept newlines within the string; previous versions cannot.)

The resulting parse tree can be executed with the `eval` function.
```q
q)parse "1 2 3 + 5"            / the list 1 2 3 is parsed as a single item
+
1 2 3
5
```
This function can clarify order of execution.
```q
q)parse "1 2 3 +/: 5 7"        / each-right has postfix syntax
(/:;+)
1 2 3
5 7
q)parse "1 2 3 +neg 5 7"       / neg is applied before +
+
1 2 3
(-:;5 7)
```
K expressions should be prefixed with `"k)"`, e.g.
```q
q)parse "k)!10"
!:
10
```
Use `eval` to evaluate the parse tree:
```
q)eval parse "1 2 3 +/: 5 7"
6 7 8
8 9 10
```
Explicit definitions in `.q` are shown in full:
```q
q)foo:{x+2}
q)parse "foo each til 5"
k){x'y}
`foo
(k){$[-6h=@x;!x;'`type]};5)
```
Q-SQL statements are parsed to the corresponding functional form.
```q
q)\l sp.q
q)x:parse "select part:p,qty by sup:s from sp where qty>200,p=`p1"
q)x
?
`sp
,((>;`qty;200);(=;`p;,`p1))
(,`sup)!,`s
`part`qty!`p`qty
q)eval x
sup| part qty
---| --------
s1 | p1   300
s2 | p1   300
```

!!! note "Parsing views"
    Views are special in that they are not parsable (sensibly) with `-5!x` (`parse`).
    ```q
        q)eval parse"a::5"
        5
        q)a
        5
        q)views[]
        `symbol$()
    ```

## reval

Syntax: `reval x`

Where `x` is a string representing a well-formed q or k expression, returns a [parse tree](datatypes#parse-tree). (V3.4 can accept newlines within the string; previous versions cannot.)

The `reval` function is similar to `eval` (`-6!`), and behaves as if the command-line option `-b` were active during evaluation.

An example usage is inside the message handler `.z.pg`, useful for access control, here blocking sync messages from updating:
```q
q).z.pg:{reval(value;x)} / define in process listening on port 5000
q)h:hopen 5000 / from another process on same host
q)h"a:4"
'noupdate: `. `a
```

!!! tip "Partitioned databases"
    For partitioned databases, q caches the count for a table, and this count cannot be updated from within a `reval` expression or from a slave thread. Thus to avoid `'noupdate` on queries on partitioned tables you should put `count table` in your startup script.


