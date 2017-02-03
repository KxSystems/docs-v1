## do

`do` is a control word.

It applies to a bracketed list of expressions, the first of which evaluates to an integer atom.
  
do\[count;exp<sub>1</sub>;…;exp<sub>n</sub>\]

The following expressions are evaluated, in order, _count_ times.

`do` does not return a result.

Example: continued fraction for _pi_, for 7 steps:
```q
q)r:()
q)t:2*asin 1
q)do[7;r,:q:floor t;t:reciprocal t-q]
q)r
3 7 15 1 292 1 1
```

`do` can be used for accurate timing of expressions, e.g. time log of first 100,000 numbers, over 100 trials:
```q
q)\t do[100;log til 100000]
396
```


## eval

The `eval` function is the complement of `parse` and can be used to evaluate the [parse trees](datatypes#parse_tree) it returns; also manually constructed parse trees.
```q
q)parse "2+3"
+
2
3
q)eval parse "2+3"
5
q)eval (+;2;3)      / manually constructed 
5
```


## exit

The `exit` function terminates the q process with the argument as exit code
```q
q)exit 0        / typical successful exit status
..

q)exit 42
guest@localhost:~$ echo $?
42
```


## if 

`if` is a control word. 

It is applied to a bracketed list of expressions, the first of which evaluates to an atom.
  
if\[test;exp<sub>1</sub>;...;exp<sub>n</sub>\]

The _test_ expression is always evaluated and the result compared with zero. If not zero, the remaining expressions are evaluated in order. 

`if` does not return a result.

```q
q)a:100
q)r:""
q)if[a>10;a:20;r:"true"]
q)a
20
q)r
"true"
```


## parse 

The `parse` function parses a string as a k or q expression, and returns a [parse tree](datatypes#parse_tree).

The string should be a well-formed k or q expression. (kdb+v3.4 can accept newlines within the string; previous versions cannot.)

The resulting parse tree can be executed with the `eval` function.
```q
q)parse "1 2 3 + 5"            / the list 1 2 3 is parsed as a single item
+
1 2 3
5
```
This function can clarify order of execution.
```q
q)parse "1 2 3 +/: 5 7"        / adverb /: applies to verb on its left
(/:;+)
1 2 3
5 7
q)parse "1 2 3 +neg 5 7"       / neg is applied before +
+
1 2 3
(-:;5 7)
```
K expressions should be prefixed with "k)", e.g.
```q
q)parse "k)!10"
```
Use `eval` to evaluate the parse tree:
```
q)eval parse "1 2 3 +/: 5 7"
6 7 8
8 9 10
```
Explicit definitions in .q are shown in full:
```q
q)foo:{x+2}
q)parse "foo each til 5"
k){x'y}
`foo
(k){$[-6h=@x;!x;'`type]};5)
```
Q-SQL statements are parsed to the corresponding functional form:
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
    Views are special in that they are not parsable (sensibly) with `-5!x` (parse).
    ```q
        q)eval parse"a::5"
        5
        q)a
        5
        q)views[]
        `symbol$()
    ```

## reval

The `reval` function is similar to `eval` `(-6!)`, and behaves as if the command-line option `-b` were active during evaluation.

An example usage is inside the message handler `.z.pg`, useful for access control, here blocking sync messages from updating:
```q
q).z.pg:{reval(value;x)} / define in process listening on port 5000
q)h:hopen 5000 / from another process on same host
q)h"a:4"
'noupdate: `. `a
```

!!! tip "Partitioned databases"
    For partitioned databases, q caches the count for a table, and this count cannot be updated from within a `reval` expression or from a slave thread. Thus to avoid `'noupdate` on queries on partitioned tables you should put `count table` in your startup script.


## Signal

Signal aborts evaluation and passes to the interpreter a string or a symbol as an error message.
```q
q)0N!0;'`err;0N!1
0
'err
```
The only way to detect a signal is to use _trap_.
```q
q)f:{@[{'x};x;{"trap:",x}]}
q)f`err
"trap:err"
```
Trap always receives a string regardless of the type of `x`.

!!! note "Signal has some restrictions"
    ```q
    q)f 1         / signals a type error indicating ' will not signal a number
    "trap:stype"
    q)f"a"        /q will not signal a char
    "trap:stype"
    ```
    Using an undefined word throws a signal
    ```q
    q)'word
    'word
    ```
    which is indistinguishable from
    ```q
    q)word
    'word
    ```


## Trap 

Called with 3 arguments and function `x`, higher-order functions `@` and `.` are _trap_. Trap is similar to try/catch in other languages.

When there is no signal, `@` behaves like binary `@`.
```q
q)@[string;42;`err]
"42"
```
When there is a signal the result of the trap is the third argument.
```q
q)@[{'x};"signal this";`err]
`err
```
If `z` is a function, it is called with argument `y`.
```q
q)@[{'x};"signal this";(`e;)]
`e
"signal this"
```
This can be used to return a result unambiguously indicating whether the function succeeded. Here, the first element of the pair indicates success or failure, while the second element is either the result or the error. This is useful when `0` or `()` might be valid results. 
```q
q)@[(1b;){1+x}@;0;(0b;)]
1b
1
q)@[(1b;){1+x}@;`a;(0b;)]
0b
"type"
q)
```
`@[f;x;t]` is equivalent to `.[f;enlist x;t]`. "dot" trap is used for multi-argument `f`.
```q
q).[*;(42;42);`err]
1764
```
Examples:
```q
q)@[parse;"1b1";`err]
`err
q)@[parse;"22 1b1 44";::]
"1b1"
```


## while 

`while` is a control word. 

It controls a bracketed list of expressions, the first of which evaluates to an atom.
  
while\[test;exp<sub>1</sub>;...;exp<sub>n</sub>\]

_test_ is always evaluated, and the result compared with zero. If not zero, the following expressions are evaluated in order, repeatedly, as long as _test_ is not zero.

`while` does not return a result.

```q
q)r:1 1
q)x:10
q)while[x-:1;r,:sum -2#r]
q)r
1 1 2 3 5 8 13 21 34 55 89
```
