Evaluation is controlled by [adverbs](adverbs) and the following control words and functions.

!!! note 
    The control words – `do`, `if` and `while` – do not return results. 


## `$` cond

Syntax: `$[x;y;z]` (function, rank 3)

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


## `do`

Syntax: `do[count;e1;e2;e3;…;en]` (control word) 

Where 

- `count` is a positive integer
- `e1`, `e2`, … `en` are expressions

the expressions `e1` to `en` are evaluated, in order, `count` times.

Continued fraction for $\pi$, for 7 steps:
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
<i class="fa fa-hand-o-right"></i> [_repeat_](adverbs/#converge-repeat)


## `each` 

Syntax: `f each x` (binary operator) 

Where `f` is a binary function, applies `f` to each item in its argument.
```q
q)count (1 2 3;"hello")
2
q)count each (1 2 3;"hello")  /count is the left-argument of each
3 5
```
<i class="fa fa-hand-o-right"></i> [_each-both_](adverbs/#each-both), [_each-left_](adverbs/#each-left), [_each-parallel_](adverbs/#each-parallel), [_each-prior_](adverbs/#each-prior), [_each-right_](adverbs/#each-right)


## `if` 

Syntax: `if[count;e1;e2;e3;…;en]` (control word)

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


## `over`

Syntax: `f over x` (binary operator) 

Where `f` is a binary function, applies `f` between successive items of its argument. 
```q
q){x+2*y} over 2 3 5 7
32
q)over[{x+2*y};2 3 5 7]
32
q)(and)over 4 3 7
3
```
The result is built up by applying `f` successively as follows:
<pre><code>
r = x<sub>0</sub>
r = f[r;x<sub>i</sub>] for i = 1…n
</code></pre>

!!! tip "See the successive results"
    The successive results may be seen with `scan`. This works the same way as `over` but returns all the intermediate results:
    ```q
    q){x+2*y} scan 2 3 5 7
    2 8 18 32
    ```
<i class="fa fa-hand-o-right"></i> [_over_ adverb](adverbs/#over)


## `peach`

Syntax: `f peach x` (binary operator) 

```q
q)peach
{x':y}
```

See [_each-parallel_](adverbs/#each-parallel) and [Parallel processing](peach)


## `prior` 

Syntax: `f prior x` (binary operator) 

```q
q)(-)prior 2 3 4   / e.g. same as deltas 2 3 4
2 1 1
```
<i class="fa fa-hand-o-right"></i> [_each-prior_](adverbs/#each-prior)


## `scan`

Syntax: `f scan x` (binary operator, uniform)

```q
q){x+2*y} scan 2 3 5 7
2 8 18 32
```
The successive function application may be seen with:
```q
q){enlist x,y} scan 2 3 5 7
2
,2 3
,(2 3;5)
,((2 3;5);7)
q)(+) scan 2 3 5 7    / cumulative sums
2 5 10 17
```

!!! Tip 
    `over` works the same way as `scan` but returns only the last result.
<i class="fa fa-hand-o-right"></i> [_scan_ adverb](adverbs/#scan)

## `while` 

Syntax: `while[test;e1;e2;e3;…;en]` (control word)

- `test` is an expression that evaluates to an atom
- `e1`, `e2`, … `en` are expressions

Unless `test` evaluates to zero, the expressions `e1` to `en` are evaluated, in order. The cycle – evaluate `test`, then the expressions – continues until ``test` evaluates to zero. 

```q
q)r:1 1
q)x:10
q)while[x-:1;r,:sum -2#r]
q)r
1 1 2 3 5 8 13 21 34 55 89
```


