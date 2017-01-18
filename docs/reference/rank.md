The uniform function `rank` takes a list argument, and returns an integer list of the same length. Each value is the position where the corresponding list element would occur in the sorted list. This is the same as calling `iasc` twice on the list.

Syntax
------

    q)r:rank A

Example
-------

    q)rank 2 7 3 2 5
    0 4 2 1 3
    q)iasc 2 7 3 2 5
    0 3 2 4 1
    q)iasc iasc 2 7 3 2 5     / same as rank
    0 4 2 1 3
    q)asc[2 7 3 2 5] rank 2 7 3 2 5 / identity
    2 7 3 2 5
    q)iasc idesc 2 7 3 2 5  / descending rank
    3 0 2 4 1

See also
--------

-   [iasc](Reference/iasc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
