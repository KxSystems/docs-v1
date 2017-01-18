The function `ss` finds positions of a substring within a string.

Syntax
------

    q)r:X ss Y

This searches for string `Y` in string `X`.

Example
-------

    q)"We the people of the United States" ss "the"
    3 17

It also supports some pattern matching capabilities of the function `like`:

    q)s:"toronto ontario"
    q)s ss "ont"
    3 8
    q)s ss "[ir]o"
    2 13
    q)s ss "t?r"
    0 10

See also
--------

-   [like](Reference/like "wikilink")
-   [ssr](Reference/ssr "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
