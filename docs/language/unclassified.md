## `.` apply

Syntax: `f . x` 

Where `f` is a function of rank $N$ and `x` is a list of count $N$, returns the result of applying `f` to the items of `x` as its arguments, i.e. `f.(x;y;z)` is equivalent to `f[x;y;z]`.

Particularly useful when executing functions of varying rank. In the following, note that defining the binary `execFunction` as `{[fun;param] fun[param]}` would work for `f1` but not `f2`.
```q
q)f1:{x}
q)f2:{x+y}
q)execFunction:{[fun;param] fun . param}
q)execFunction[f1;enlist 1]
1
q)execFunction[f2;(1 2)]
3
```


## `(::)` identity

Syntax: `(::) x`
  
Returns `x`.
```q
q)(::)1
1
```
This can be used in statements applying multiple functions to the same data, if one of the operations desired is "do nothing".
```q
q)(::;avg)@\:1 2 3
1 2 3
2f
```
Similarly, the identity can also be achieved via indexing.
```q
q)1 2 3 ::
1 2 3
```
and used in variants thereof for e.g. amends
```q
q)@[til 10;(::;2 3);2+]
2 3 6 7 6 7 8 9 10 11
```


## `::` null

Q does not have a dedicated null type. Instead `::` is used to denote a generic null value. For example, functions that return no value, return `::`.
```q
q)enlist {1;}[]
::
```
We use `enlist` to force display of a null result: a pure `::` is not displayed.

When a unary function is called with no arguments, `::` is passed in.
```q
q)enlist {x}[]
::
```
Since `::` has a type for which no vector variant exists, it is useful to prevent a mixed list from being coerced into a vector when all elements happen to be of the same type. (This is important when you need to preserve the ability to add non-conforming items later.)
```
q)x:(1;2;3)
q)x,:`a
'type
```
but
```q
q)x:(::;1;2)
q)x,:`a  / ok
```


