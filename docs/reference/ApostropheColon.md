': (prior/peach)
================

`':` is an adverb like [`\`](Reference/BackSlash#iterate "wikilink") (iterate) and [`'`](Reference/Apostrophe#each "wikilink") (each).

In the expression `f':`

-   when f is dyadic, the expression is [prior](Reference/ApostropheColon#prior "wikilink")
-   when f is monadic, it is [peach](Reference/ApostropheColon#peach "wikilink")

prior
-----

### Monadic prior

For dyadic f, `f':` applied to a list x of length n returns `(f[x` `0;0N];f[x` `1;x` `0];f[x` `2;x` `1];...;f[x` `n-1;x` `n-2])`

The first item in the result is produced by passing the first value and null to `f`. This first null value has the same type as the first value in x. eg. if x is a float list, the null will be `0n`.

**example: Show the current and prior**

`q)({(x;y)}':)1 2 3 4`
`1`
`2 1`
`3 2`
`4 3`
`q)0N!({(x;y)}':)1 2 3 4; /show the result in `[`executable` `syntax`](Reference/BangSymbol#other "wikilink")
`(1 0N;2 1;3 2;4 3)`
`q)0N!((;)':)1 2 3 4;     /{(x;y)} can be replaced by the shorter (;)`
`(1 0N;2 1;3 2;4 3)`

### Some primitives behave specially with monadic prior

`q)(-':)1 4 9 16`
`1 3 5 7                   /q helps us out by behaving like 0 -': 1 4 9 16`
`q)({x-y}':)1 4 9 16       /general behaviour using an equivalent lambda`
`0N 3 5 7`

### Dyadic prior

In the monadic form, prior passes a null for the first prior value. In the dyadic form, the first prior value can be specified.

In `x` `f':` `y`, `x` is used in place of the initial null so the result is `(f[y` `0;x];f[y` `1;y` `0];f[y` `2;y` `1];...;f[y` `n-1;y` `n-2])`.

`q)0N!9(;)':1 2 3 4;`
`(1 9;2 1;3 2;4 3)`

peach
-----

If f is a *monad*, `':` is [peach](Reference/peach "wikilink").

`$ q -s 2`
`KDB+ 3.0 2012.11.13 Copyright (C) 1993-2012 Kx Systems`
`l32/ 2()core 3539MB jack sff 127.0.0.1 PLAY 2013.02.11 `
`q)\t ({sum exp x?1.0}' )2#1000000  /`[`each`](Reference/Apostrophe "wikilink")
`163`
`q)\t ({sum exp x?1.0}':)2#1000000  /`[`peach`](Reference/peach "wikilink")
`114`

`q)peach`
`k){x':y}`

Syntax
------

`form            example`
`  f':[y]         -':[  1 4 9 16]`
` (f':)y         (-':)  1 4 9 16`
`x f': y         9-':   1 4 9 16    `
`  f':[x;y]      -':[9; 1 4 9 16]`
`  f':[x;]y      -':[9;]1 4 9 16   /projection`

Examples
--------

`q)"abc",':"xyz"`
`("xabc";"yx";"zy")`
`q)0 1-':2 5 9`
`(2 1;3;4)`
`q)0-':2 5 9`
`2 3 4`
`q)-':[2 5 9]     /deltas`
`2 3 4`
