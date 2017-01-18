[each-both](JB:QforMortals2/functions#each-both_.28.27.29 "wikilink")

signal
------

signal is a control word that aborts evaluation. signal accepts a symbol or string like `` '`err `` or `'"err"`

`` q)0N!0;'`err;0N!1 ``
`0`
`'err`

As shown above, when q detects the \`err signal, it is shown on the console as 'err.

The only way to detect a signal is to use [trap](Reference/trap "wikilink").

`q)f:{@[{'x};x;{"trap:",x}]}`
`` q)f`err ``
`"trap:err"`

Note that [trap](Reference/trap "wikilink") always receives a string regardless of the type of x.

signal has some restrictions as illustrated:

`q)f 1             /q signals a type error indicating that ' will not signal a number`
`"trap:stype"  `
`q)f"a"            /q will not signal a char`
`"trap:stype"`

Using an undefined word throws a signal:

`q)'word`
`'word`

which is indistinguishable from

`q)word`
`'word`

case
----

On the right of an integer vector of length n, turns the vector v into an n-ary function that for each i-th argument selects its v\[i\]-th element. All arguments must be of the same length or scalar. Scalar arguments treated as infinitely repeated values.

    q)0 1 2'[1 2 3;10 20 30;100]
    1 20 100

### composition

Provided a monadic function and a polyadic function, the monadic function can be composed with the polyadic function to produce a new function with the same function signature as the original function but with the composition applied.

    q)f:{[w;x;y;z]w+x+y+z}
    q)g:{2*x}
    q)h:('[g;f]) / The interpreter is finicky about :'
    q)h[1;2;3;4]
    20

This can be extended to use the over function to compose a list of functions:

    q)g1:{10*x}
    q)h1:('[;]) over (g1;g;f) / Use ('[;]) so the correct form is used
    q)h1[1;2;3;4]
    200
