The uniform function `prds` returns the cumulative products of the items in its argument.

If the argument is an atom, it is returned unchanged.

Otherwise, if the argument is a numeric list, it returns the cumulative product as a list of the same length. A null is treated as 1.

If the argument is a non-numeric list, a type error is signaled.

Syntax
------

    q)r:prds X

Example
-------

    q)prds 7                     / atom is returned unchanged
    7
    q)prds 2 3 5 7               / cumulative products of list
    2 6 30 210
    q)prds 2 3 0N 7              / 0N is treated as 1
    2 6 6 42
    q)prds (1 2 3;2 3 5)         / cumulative products of list of lists
    1 2 3                        / same as (1 2 3;1 2 3 * 2 3 5)
    2 6 15
    q)prds "abc"                 / type error if list is not numeric
    'type

### See also

-   [prd](Reference/prd "wikilink")
-   [sum](Reference/sum "wikilink")
-   [sums](Reference/sums "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
