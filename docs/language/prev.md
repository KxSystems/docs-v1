The uniform function `prev` returns the previous element for each item in its argument list. For the first element, it returns a null value of the list if simple (a homogeneous list), and an empty list `()` if non-simple (a mixed list).

Syntax
------

    q)r:prev A

Example
-------

    q)prev 2 3 5 7 11
    0N 2 3 5 7
    q)prev (1 2;"abc";`ibm)
    `int$()
    1 2
    "abc"

Shift the times in a table:

    q)update time:prev time by sym from t

See also
--------

-   [next](Reference/next "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
