The `log` function computes the natural logarithm of its argument. The result is type float. Null is returned if the argument is negative, and negative infinity if the argument is 0.

Syntax
------

    q)r:log X

Example
-------

    q)log 1
    0f
    q)log 0.5
    -0.6931472
    q)log exp 42
    42f
    q)log -2 0n 0 0.1 1 42
    0n 0n -0w -2.302585 0 3.73767

See also
--------

-   [exp](Reference/exp "wikilink")
-   [xexp](Reference/xexp "wikilink")
-   [xlog](Reference/xlog "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
