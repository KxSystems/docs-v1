The `xlog` verb computes the base-x logarithm of y. Integer arguments are first converted to float, and the result is type float. Null is returned if the right argument is negative, and negative infinity if the right argument is 0.

Syntax
------

    q)r:X xlog Y

Example
-------

    q)2 xlog 8
    3f
    q)2 xlog 0.125
    -3f
    q)1.5 xlog 0 0.125 1 3 0n
    -0w -5.128534 0 2.709511 0n

Remark
------

`xlog` is the inverse of `xexp`. Where both are defined, `Y=X` `xexp` `X` `xlog` `Y`:

    q)2 xexp 2 xlog -1 0 0.125 1 42
    0n 0 0.125 1 42

See also
--------

-   [exp](Reference/exp "wikilink")
-   [log](Reference/log "wikilink")
-   [xexp](Reference/xexp "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
