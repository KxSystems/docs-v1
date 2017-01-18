The `raze` function joins items of its argument, and collapses one level of nesting. To collapse all levels, use over i.e. `raze/[x]`.

An atom argument is returned as a one-element list.

Example
-------

    q)raze (1 2;3 4 5)
    1 2 3 4 5
    q)b:(1 2;(3 4;5 6);7;8)
    q)raze b                 / flatten one level
    1
    2
    3 4
    5 6
    7
    8
    q)raze/[b]               / flatten all levels
    1 2 3 4 5 6 7 8

Acts on a dictionary to return the flattened values:

    q)d:`q`w`e!(1 2;3 4;5 6)
    q)value d
    1 2
    3 4
    5 6
    q)raze d
    1 2 3 4 5 6

Remark
------

`raze` is defined in k as `,/` and requires that items can be joined together. For example:

    q)d:`a`b!(1 2;3 5)
    q)10,d          / cannot join integer and dictionary
    'type
    q)raze (10;d)   / raze will not work
    'type

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
