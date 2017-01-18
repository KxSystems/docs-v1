Syntax
------

The `while` statement has the form:

  
while\[test;exp<sub>1</sub>;...;exp<sub>n</sub>\]

where the *test* expression is evaluated and the result compared with zero. If not zero, the remaining expressions are evaluated in order. This is repeated as long as test is not zero. The test expression should return an atom.

`while` does not return a result.

Example
-------

    q)r:1 1
    q)x:10
    q)while[x-:1;r,:sum -2#r]
    q)r
    1 1 2 3 5 8 13 21 34 55 89

See also
--------

-   [do](Reference/do "wikilink")
-   [if](Reference/if "wikilink")
-   [if-else](Reference/DollarSign "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
