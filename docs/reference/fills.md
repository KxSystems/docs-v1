Uniform function that is used to forward fill a list containing nulls.

Syntax
------

    r:fills A

The result is the same as A, except that where A is null, the result is the preceding non-null value, if any.

Example
-------

    q)fills 0N 2 3 0N 0N 7 0N
    0N 2 3 3 3 7 7

Remark
------

To back fill, reverse the argument and result:

    q)reverse fills reverse 0N 2 3 0N 0N 7 0N
    2 2 3 7 7 7 0N

To use a similar function on infinities, first replace them with nulls:

    q)fills {(x where x=0W):0N;x} 0N 2 3 0W 0N 7 0W
    0N 2 3 3 3 7 7

See also
--------

-   [^](Reference/Caret "wikilink") (fill)
-   [null](Reference/null "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
