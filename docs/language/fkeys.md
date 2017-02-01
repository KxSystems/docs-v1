The function `fkeys` takes a table as an argument and returns a dictionary that maps foreign key columns to their tables.

Example
-------

    q)f:([x:1 2 3]y:10 20 30)
    q)t:([]a:`f$2 2 2;b:0;c:`f$1 1 1)
    q)meta t
    c| t f a
    -| -----
    a| i f
    b| i
    c| i f
    q)fkeys t
    a| f
    c| f

See also
--------

-   [meta](Reference/meta "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
