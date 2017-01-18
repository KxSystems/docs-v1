The uniform function `next` returns the next element for each item in its argument list. For the last element, it returns a null value of the list if simple (a homogeneous list), and an empty list `()` if non-simple (a mixed list).

Syntax
------

    q)r:next A

Example
-------

    q)next 2 3 5 7 11
    3 5 7 11 0N
    q)next (1 2;"abc";`ibm)
    "abc"
    `ibm
    `int$()

Duration of a quote:

    q)update (next time)-time by sym from quote

See also
--------

-   [prev](Reference/prev "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
