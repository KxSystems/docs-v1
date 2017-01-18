The verb `union` returns a list of the distinct elements of its combined arguments, i.e. `distinct` applied to the append of the two arguments.

Syntax
------

    q)r:X union Y

Example
-------

    q)1 2 3 3 6 union 2 4 6 8
    1 2 3 6 4 8
    q)distinct 1 2 3 3 6, 2 4 6 8      / same as distinct on append
    1 2 3 6 4 8

`union` can also be applied to tables, returning the distinct rows in both:

    q)t0:([]x:2 3 5;y:"abc")
    q)t1:([]x:2 4;y:"ad")
    q)t0 union t1
    x y
    ---
    2 a
    3 b
    5 c
    4 d
    q)(distinct t0,t1)~t0 union t1
    1b

See also
--------

-   [in](Reference/in "wikilink")
-   [inter](Reference/inter "wikilink")
-   [except](Reference/except "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
