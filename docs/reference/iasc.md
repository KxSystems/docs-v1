Uniform function that returns the indices needed to sort the list argument.

Syntax
------

    q)r:iasc L

The same considerations apply as for [asc](Reference/asc "wikilink"). They are related as:

    (asc L) ~ L iasc L

Example
-------

    q)L:2 1 3 4 2 1 2
    q)iasc L
    1 5 0 4 6 2 3
    q)L iasc L
    1 1 2 2 2 3 4
    q)(asc L)~L iasc L
    1b

See also
--------

-   [asc](Reference/asc "wikilink")
-   [desc](Reference/desc "wikilink")
-   [idesc](Reference/idesc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
