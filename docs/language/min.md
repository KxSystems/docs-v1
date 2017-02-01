The `min` function returns the minimum of its argument.

If the argument is an atom, it is returned unchanged.

If the argument is a list, it returns the minimum of the list. The list may be any datatype except symbol. Nulls are ignored, except that if the argument has only nulls, the result is infinity.

Syntax
------

    q)r:min X

Example
-------

    q)min 2 5 7 1 3
    1
    q)min "genie"
    "e"
    q)min 0N 5 0N 1 3                  / nulls are ignored
    1
    q)min 0N 0N                        / infinity if all null
    0W
    q)select min price by sym from t   / use in a select statement

    n.b. for vector v

    min v
    max v
    sum v
    avg v

    are special as they ignore nulls, in order to be similar to sql92.
    But for nested x these functions preserve the nulls.
    e.g.
    q)avg (1 2;0N 4)
    0n 3

See also
--------

-   [max](Reference/max "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
