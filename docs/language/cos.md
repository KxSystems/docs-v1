The `cos` function computes the cosine of its argument, taken to be in radians. The result is between `-1` and `1`, or null if the argument is null or infinity.

Syntax
------

    q)a:cos 0.5

Example
-------

    q)cos 0.2
    0.9800666
    q)min cos 10000?3.14159265
    -1f
    q)max cos 10000?3.14159265
    1f

See also
--------

-   [sin](Reference/sin "wikilink")
-   [tan](Reference/tan "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
