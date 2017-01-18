The aggregate function `prd` returns the product of the items in its argument.

If the argument is an atom, it is returned unchanged.

Otherwise, if the argument is a numeric list, it returns the product as an atom. A null is treated as 1.

If the argument is a non-numeric list, a type error is signaled.

Syntax
------

    q)r:prd X

Example
-------

    q)prd 7                    / product of atom (returned unchanged)
    7
    q)prd 2 3 5 7              / product of list
    210
    q)prd 2 3 0N 7             / 0N is treated as 1
    42
    q)prd (1 2 3 4;2 3 5 7)    / product of list of lists
    2 6 15 28
    q)prd "abc"
    'type

### See also

-   [prds](Reference/prds "wikilink")
-   [sum](Reference/sum "wikilink")
-   [sums](Reference/sums "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
