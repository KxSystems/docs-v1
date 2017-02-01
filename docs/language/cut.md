Verb `cut` splits its right argument according to its left.

Syntax
------

    R:X cut Y

`cut` has two slightly different behaviors, depending on its left argument:

-   if `X` is a single integer, `cut` splits its right argument into `X`-sized parts, for example:

<!-- -->

    q)4 cut til 10
    0 1 2 3
    4 5 6 7
    8 9

-   if `X` is a non-decreasing list of integers, it cuts `Y` at the indices given in `X`. The result R has the same number of elements as X and will always be a list. For example:

<!-- -->

    q)2 4 9 cut til 10           / the first result item starts at index 2
    2 3
    4 5 6 7 8
    ,9
    q)
    q)2 4 4 9 cut til 10         / cuts are empty for duplicate indices
    2 3
    `int$()
    4 5 6 7 8
    ,9

Remark
------

`cut` is a simple derivative of the primitive `_` (drop/cut). Where the left argument is an atom, it cuts the right argument into equal sized parts, and otherwise it behaves like `_`. For example:

    q)"abcde" _ 3                / drop element with index 3
    "abce"
    q)"abcde" cut 3              / cut works the same
    "abce"

See also
--------

-   [drop/cut](Reference/Underscore "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
