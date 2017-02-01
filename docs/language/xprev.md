The uniform verb `xprev` returns the nth previous element to each item in the right argument list.

Syntax
------

    q)r:n xprev list

The result has the same length as the right argument. The first `n` elements of the result are null, empty or blank as appropriate, and thereafter each element is the nth previous element.

One can note that there is no `xnext` function. Fortunately `xprev` with a negative number on the left can achieve this.

Example
-------

    q)2 xprev 2 7 5 3 11
    0N 0N 2 7 5
    q)-2 xprev 2 7 5 3 11
    5 3 11 0N 0N
    q)1 xprev "abcde"
    " abcd"

See also
--------

-   [xrank](Reference/xrank "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
