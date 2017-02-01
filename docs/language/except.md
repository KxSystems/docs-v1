The verb `except` returns all elements of its left argument that are not in its right argument.

Syntax
------

    R:X except Y

where X is a list and Y is either a list or an atom.

Example
-------

    q)1 2 3 except 2
    1 3
    q)1 2 3 4 1 3 except 2 3
    1 4 1

See also
--------

-   [in](Reference/in "wikilink")
-   [inter](Reference/inter "wikilink")
-   [union](Reference/union "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
