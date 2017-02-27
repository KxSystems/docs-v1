## `$` cond

Syntax: `$[x;y;z]` 

Where `x` evaluates to zero, returns `z`, otherwise `y`.
```q
q)$[0b;`true;`false]
`false
q)$[1b;`true;`false]
`true
```
Only the first argument is guaranteed to be evaluated.
```q
q)$[1b;`true;x:`false]
`true
q)x
'x
```
For brevity, nested triads can be flattened: `$[q;a;$[r;b;c]]` is equivalent to `$[q;a;r;b;c]`. An example of _cond_ in a _signum_-like function:
```q
q){$[x>0;1;x<0;-1;0]}'[0 3 -9]
0 1 -1
```
`$[q;$[r;a;b];c]` is not the same as `$[q;r;a;b;c]`.

_Cond_ with many arguments can be translated to triads by repeatedly replacing the last three arguments with the triad: `$[q;a;r;b;s;c;d]` is `$[q;a;$[r;b;$[s;c;d]]]`. So _cond_ always has an odd number of arguments.

These two expressions are equivalent:
```q
q)$[0;a;r;b;c]
q)    $[r;b;c]
```

!!! note 
    The control words `do`, `if` and `while` do not return results. 


## `do`

Syntax: `do[count;e1;e2;e3;…;en]`

where 

- `count` is a positive integer
- `e1`, `e2`, … `en` are expressions

the expressions `e1` to `en` are evaluated, in order, `count` times.

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


## `if` 

Syntax: `if[count;e1;e2;e3;…;en]`

- `test` is an expression that evaluates to an atom
- `e1`, `e2`, … `en` are expressions

unless `test` evaluates to zero, the expressions `e1` to `en` are evaluated, in order
```q
q)a:100
q)r:""
q)if[a>10;a:20;r:"true"]
q)a
20
q)r
"true"
```


## `while` 

Syntax: `while[test;e1;e2;e3;…;en]`

- `test` is an expression that evaluates to an atom
- `e1`, `e2`, … `en` are expressions

Unless `test` evaluates to zero, the expressions `e1` to `en` are evaluated, in order. The cycle – evaluate `test`, then the expressions – continues until ``test` evaluates to zero. 

```q
q)r:1 1
q)x:10
q)while[x-:1;r,:sum -2#r]
q)r
1 1 2 3 5 8 13 21 34 55 89
```


## toggle q/k

In the interactive session `\` toggles between the q and k interpreters.
```q
q)\
  \
q)
```

