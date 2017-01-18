For a floating point number `x`, returns the *floor* of `x`, i.e. the greatest integer less than or equal to `x`. An integer `x` is returned unchanged.

Syntax
------

    q)r:floor X

Example
-------

    q)floor -2.1 0 2.1
    -3 0 2

Prior to v3.0, floor uses [comparison tolerance](Cookbook/ComparisonTolerance "wikilink"), for example:

    q)floor 2 - 10 xexp -12 -13
    1 2

Prior to v3.0, the floor of a datetime is the date. Since 3.0, use "d"$ instead.

    q)floor 2009.10.03T13:08:00.222
    2009.10.03
    q)"d"$2009.10.03T13:08:00.222
    2009.10.03

See also
--------

-   [ceiling](Reference/ceiling "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
