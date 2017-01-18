For a floating point number `x`, returns the *ceiling* of `x`, i.e. the least integer greater than or equal to `x`. An integer `x` is returned unchanged.

Syntax
------

    q)r:ceiling X

Example
-------

    q)ceiling -2.1 0 2.1
    -2 0 3

Prior to v3.0, ceiling uses [comparison tolerance](Cookbook/ComparisonTolerance "wikilink"), for example:

    q)ceiling 2 + 10 xexp -12 -13
    3 2

Prior to kdb+3.0, ceiling accepted datetime. Since 3.0, use "d"$23:59:59.999+ instead.

    q)ceiling 2010.05.13T12:30:59.999
    2010.05.14
    q)"d"$23:59:59.999+ 2010.05.13T12:30:59.999
    2010.05.14

See also
--------

-   [floor](Reference/floor "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
