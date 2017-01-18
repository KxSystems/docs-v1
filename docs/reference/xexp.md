The `xexp` verb computes x<sup>y</sup>. Integer arguments are first converted to float, and the result is type float.

Syntax
------

    q)r:X xexp Y

Example
-------

    q)2 xexp 8
    256f
    q)9 xexp 0.5
    3f
    q)1.5 xexp -4.2 0 0.1 0n 0w
    0.1821448 1 1.04138 0n 0w

Remark
------

The calculation is performed as `exp` `Y` `*` `log` `X`. Note that if `Y` is integer, this is not identical to `prd` `Y#X`:

    q)\P 0
    q)prd 3#2
    8
    q)2 xexp 3
    7.9999999999999982
    q)exp 3 * log 2
    7.9999999999999982

See also
--------

-   [exp](Reference/exp "wikilink")
-   [log](Reference/log "wikilink")
-   [xlog](Reference/xlog "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
