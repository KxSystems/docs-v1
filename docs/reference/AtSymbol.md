@ (index/apply)
===============

The verb `@` is used for indexing at the top level. It selects items from the list specified by the first argument at indices specified by the second

    q)d:((1 2 3;4 5 6 7);(8 9;10;11 12);(13 14;15 16 17 18;19 20))
    q)d@1
    (8 9;10;11 12)
    q)d@1 2 / selects 2 items at the top level
    ((8 9;10;11 12);(13 14;15 16 17 18;19 20))
    q)@[d;1 1 1;+;3]
    ((1 2 3;4 5 6 7);(17 18;19;20 21);(13 14;15 16 17 18;19 20))

For the four-argument form above, see [Functional Forms of Amend](JB:QforMortals2/functions#Functional_Forms_of_Amend "wikilink").

Since kdb+ v3.4 certain vectors can be updated directly on disk without the need to fully rewrite the file. Such vectors must have no attribute, be of a mappable type, not nested, and not compressed. e.g.

`` q)`:data set til 20; ``
`` q)@[`:data;3 6 8;:;100 200 300]; ``
`` q)get`:data ``
`0 1 2 100 4 5 200 7 300 9 10 11 12 13 14 15 16 17 18 19`

A monadic function g with argument d can be evaluated by `g@d` or `g` `.` `enlist` `d`.

    q)f:{x*2}
    q)f@42
    84

Functions with no arguments require special handling. For example, if f:{2+3} then f can be evaluated with @ and any argument.

    q)f:{2+3}
    q)f[]
    5
    q)f@0
    5

Both `.` and `@` are referred to as Index or Apply, depending on the context.

trap
----

@ is also [trap](Reference/trap "wikilink")

See also
--------

-   [.](Reference/DotSymbol "wikilink") (index/apply)
-   [Functional Forms of Amend](JB:QforMortals2/functions#Functional_Forms_of_Amend "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
