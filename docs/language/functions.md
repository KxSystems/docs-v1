
A function takes one or more arguments and returns a result. 

Q has primitive functions; you can also define your own, known as _lambdas_. These can be given names, or simply applied anonymously where they are defined. 

Functions are first-class objects and can be passed as arguments to other functions. Functions that take other functions as arguments are known as _higher-order functions_.


Syntax
------

Functions use prefix form: their [arguments](#Arguments) are written on the right.
```q
q)foo[a;b;42;d]  / function foo, with four arguments
…
```
Operators are an exception to this: primitive binary functions which may also be written in infix form, e.g. `2+3` or `2 and 3` rather than `+[2;3]` or `and[2;3]`.


Explicit definition
-------------------

A function is defined explicitly as a _signature_ (a list of up to 8 argument names) followed by a list of expressions enclosed in curly braces and separated by semicolons. THis is known as the _lambda notation_. 
```q
q){[a;b] a2:a*a; b2:b*b; a2+b2+2*a*b}[20;4]  / binary function
576
```
Functions with 3 or fewer arguments may elide the signature and instead use default names `x`, `y` and `z`. 
```q
q){(x*x)+(y*y)+2*x*y}[20;4]
576
```
The result of the function is the result of the last statement evaluated. If the last statement is empty, the result is the generic null, which is not displayed.
```q
q)f:{2*x;}      / last statement is empty
q)f 10          / no result shown
q)(::)~f 10     / matches generic null
1b
```


## Actions on lists

Some functions can be categorised by their actions on lists – as _atomic_, _aggregate_, _uniform_:

- an _atomic_ function returns an atom for each atom in its argument
- an _aggregate_ function returns an atom from a list
- a _uniform_ function returns a list from a list
```q
q)signum 0 2 -3 5           / atomic
0 1 -1 1
q)sum 2 3 5 7               / aggregate
17
q)sums 2 3 5 7              / uniform
2 5 10 17
q)distinct 2 3 5 7 2 5      / none of the above
2 3 5 7
```


## Application

In applying a function, the canonical form of its arguments is a bracketed list separated by semicolons. 

<code>f[a<sub>1</sub>;a<sub>2</sub>;…;a<sub>n</sub>]</code>

The expression in brackets lists parameters to the function, but is _not_ itself a list, i.e. it is not the same as:

<code>(a<sub>1</sub>;a<sub>2</sub>;…;a<sub>n</sub>)</code>

A function’s _rank_ is the number of arguments it takes. Functions of rank 1 or 2 are known respectively as _unary_ and _binary_. 

A unary function can be applied by juxtaposition.
```q
q)reverse[0 1 2]    /function syntax
2 1 0
q)(reverse)(0 1 2)  /juxtaposition is application
2 1 0
q)reverse 0 1 2     /the parens are redundant
2 1 0
```

!!! note "Function arguments and list indexes"
    A function is a mapping from its arguments to its result. A list is a mapping from its indexes to its values. For this reason, they use the same syntax. 
    ```q
    q){x*x}[3 4 5]
    9 16 25
    q)0 1 4 9 16 25 36 49[3 4 5]
    9 16 25
    ```

A unary function `g` with argument `d` can be evaluated by `g@d` or `g.enlist d`.
```q
q)f:{x*2}
q)f@42
84
```
Functions with no arguments require special handling. For example, if `f:{2+3}` then `f` can be evaluated with `@` and any argument.
```q
q)f:{2+3}
q)f[]
5
q)f@0
5
```


Name scope
----------

Within the context of a function, name assignments with `:` are _local_ to it and end after evaluation. Assignments with `::` are _global_ (in the session root) and persist after evaluation.
```q
q)a:b:0                      / set globals a and b to 0
q)f:{a:10+3*x;b::100+a;}     / f sets local a, global b
q)f 1 2 3                    / apply f
q)a                          / global a is unchanged
0
q)b                          / global b is updated
113 116 119
```
References to names _not_ assigned locally are resolved in the session root. Local assignments are _strictly local_: invisible to other functions applied during evaluation. 
```q
q)a:42           / assigned in root
q)f:{a+x}
q)f 1            / f reads a in root
43
q){a:1000;f x}1  / f reads a in root
43
```


Implicit definition
-------------------

A function is defined implicitly 

- by an [adverb](adverbs)
- by projection


## Projection

The number of arguments a function takes is its _rank_. Applying the function to more arguments than its rank signals a rank error. Applying it to fewer projects (returns) a new function, a [_projection_](#projection). 

In the new function, the arguments already passed have the values supplied. The projected function has in its signature only the _undefined_ argument/s. 
```q
q)f:{x + 2 * y - z}       / f has rank 3
q)f[100;10;2 3 5]
116 114 110

q)g:f[100]                / g is projection of f on first argument
q)g[10;2 3 5]             / g is binary
116 114 110

q)g:f[100;;2 3 5]         / project on first and third arguments
q)g 10                    / g is unary
116 114 110
```
Similarly for [operators](operators):
```q
q)half:%[;2]              / % operator in prefix form
q)half 6                  / half is a unary function
3f
q)double:2*
q)double 5                / unary function
10
```


Ending evaluation
-----------------

### Return :

Syntax: `:x`

Terminates evaluation, returning `x`.
```q
q)f:{a:3*x;:a;a+10}            / the final a+10 is never evaluated
q)f 1
3
```

### Signal '

Syntax: `'e`

where `e` is a symbol or char list, terminates evaluation without result and signals an error with `e`.
```q
q)f:{a:3*x;'"end here";a+10}   / the final a+10 is never evaluated
q)f 1
'end here
10
```

See also: [Controlling evaluation](evaluation)


