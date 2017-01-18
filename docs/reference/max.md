The `max` function returns the maximum of its argument.

If the argument is an atom, it is returned unchanged.

If the argument is a list, it returns the maximum of the list. The list may be any datatype except symbol. Nulls are ignored, except that if the argument has only nulls, the result is negative infinity.

Syntax
------

    q)r:max X

Example
-------

    q)max 2 5 7 1 3
    7
    q)max "genie"
    "n"
    q)max 0N 5 0N 1 3                  / nulls are ignored
    5
    q)max 0N 0N                        / negative infinity if all null
    -0W
    q)select max price by sym from t   / use in a select statement

See also
--------

-   [min](Reference/min "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
