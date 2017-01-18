. (index/apply)
===============

All indexing and function application can be done with the verb denoted by Dot.

*Everything starts from a dot.* - Wassily Kandinsky

    q)d:((1 2 3;4 5 6 7);(8 9;10;11 12);(13 14;15 16 17 18;19 20))
    q)d . 1 2        / same as d[1;2]
    11 12
    q)d . 1 2 0      / same as d[1;2;0]
    11
    q)d . enlist 1   / same as d[1]
    (8 9;10;11 12)

You can see from the examples that the i<sup>th</sup> item in the index selects from the i<sup>th</sup> level of the list. You can also see that to index at the top level only, you must use a one-item list.

Dot is particularly useful when executing functions of varying valence (argument count) under program control. Both `.` and `@` are referred to as Index or Apply, depending on the context.

Here is an example for using functions with varying valence. Defining execFunction as `{[fun;param]` `fun[param]}` would not work.

    f1: {x}
    f2: {x+y}
    execFunction: {[fun;param] .[fun;param] }
    execFunction[f1;enlist 1] // result is 1
    execFunction[f2;(1 2)] // result is 3

See also
--------

-   [@](Reference/AtSymbol "wikilink") (index/apply)
-   [Functional Forms of Amend](JB:QforMortals2/functions#Functional_Forms_of_Amend "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
