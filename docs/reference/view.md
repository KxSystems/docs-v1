The `view` function returns the expression defining the dependency passed as its symbol argument.

Example
-------

    q)v::2+a*3                        / define dependency v
    q)a:5
    q)v
    17
    q)view `v                         / view the dependency expression
    "2+a*3"

See also
--------

-   [views](Reference/views "wikilink")
-   [Views tutorial](Views "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
