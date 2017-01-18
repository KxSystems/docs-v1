Uniform function that returns the indices needed to sort the list argument.

Syntax
------

    q)r:idesc L

The same considerations apply as for [desc](Reference/desc "wikilink"). They are related as:

    (desc L) ~ L idesc L

Example
-------

    q)L:2 1 3 4 2 1 2
    q)idesc L
    3 2 0 4 6 1 5
    q)L idesc L
    4 3 2 2 2 1 1
    q)(desc L)~L idesc L
    1b

See also
--------

-   [asc](Reference/asc "wikilink")
-   [desc](Reference/desc "wikilink")
-   [iasc](Reference/iasc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
