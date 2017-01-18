() (precedence/list/table)
==========================

precedence
----------

Normally, q expressions are parsed from right to left regardless of the operators used (so the rightmost operators take precedence), but using parentheses can change this:

    q)til 3-1
    0 1
    q)til (3-1)    / same thing
    0 1
    q)(til 3)-1
    -1 0 1

list
----

Parentheses can be used to define a list with arbitrary contents, by separating each element with a semicolon (;). The same syntax is also used for [parse trees](Reference/parse_tree "wikilink"). See also [Q for Mortals](JB:QforMortals2/lists "wikilink").

    q)(1 2 3;`symbol;+)
    1 2 3
    `symbol
    +

table
-----

Tables are defined with a similar syntax to lists, but with a set of brackets inside the parentheses. Both keyed and non-keyed tables can be defined this way. See also [Q for Mortals](JB:QforMortals2/tables#Table_Definition_Syntax "wikilink").

    q)([] a:2 3; b:5 6)
    a b
    ---
    2 5
    3 6
    q)([x:0 1] a:2 3; b:5 6)
    x| a b
    -| ---
    0| 2 5
    1| 3 6

monad
-----

    q)0+/1 2 3   // Dyadic form needs initial value on the left.
    6
    q)+/1 2 3    // Error of omitted.
    '/
    q)(+/)1 2 3  // Monadic form if in parens.
    6
    q)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
