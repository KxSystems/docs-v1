The uniform function `sums` returns the cumulative sums of the items in its argument.

If the argument is an atom, it is returned unchanged.

Otherwise, if the argument is a numeric list, it returns the cumulative sum as a list of the same length. A null is treated as 0.

If the argument is a non-numeric list, a type error is signaled.

Syntax
------

    r:sums X

Example
-------

    q)sums 7                        / cumulative sum atom (returned unchanged)
    7
    q)sums 2 3 5 7                  / cumulative sum list
    2 5 10 17
    q)sums 2 3 0N 7                 / 0N is treated as 0
    2 5 5 12
    q)sums (1 2 3;2 3 5)            / cumulative sum list of lists
    1 2 3                           / same as (1 2 3;1 2 3 + 2 3 5)
    3 5 8
    q)\l sp.q
    q)select sums qty by s from sp  / use in select statement
    s | qty
    --| --------------------------
    s1| 300 500 900 1100 1200 1600
    s2| 300 700
    s3| ,200
    s4| 100 300 600
    q)sums "abc"                    / type error if list is not numeric
    'type

### See also

-   [prd](Reference/prd "wikilink")
-   [prds](Reference/prds "wikilink")
-   [sum](Reference/sum "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
