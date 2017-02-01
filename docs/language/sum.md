The aggregate function `sum` returns the sum of the items in its argument.

If the argument is an atom, it is returned unchanged.

Otherwise, if the argument is a numeric list, it returns the sum as an atom. A null is treated as 0.

If the argument is a non-numeric list, a type error is signaled.

Syntax
------

    r:sum X

Example
-------

    q)sum 7                         / sum atom (returned unchanged)
    7
    q)sum 2 3 5 7                   / sum list
    17
    q)sum 2 3 0N 7                  / 0N is treated as 0
    12
    q)sum (1 2 3 4;2 3 5 7)         / sum list of lists
    3 5 8 11                        / same as 1 2 3 4 + 2 3 5 7
    q)\l sp.q
    q)select sum qty by s from sp   / use in select statement
    s | qty
    --| ----
    s1| 1600
    s2| 700
    s3| 200
    s4| 600
    q)sum "abc"                     / type error if list is not numeric
    'type
    q)sum (0n 8;8 0n) / n.b. sum list of vectors does not ignore nulls
    0n 0n
    q)sum 0n 8 / the vector case was modified to match sql92 (ignore nulls)
    8f
    q)sum each flip(0n 8;8 0n) /do this to fall back to vector case
    8 8f

### See also

-   [prd](Reference/prd "wikilink")
-   [prds](Reference/prds "wikilink")
-   [sums](Reference/sums "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
