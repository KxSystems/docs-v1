The syntax of control words `do`, `if` and `while` resembles that of [functions](functions), but control words do not return results. 


## do

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


## if 

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


## while 

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
