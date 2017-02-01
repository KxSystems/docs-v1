The adverb `each` takes a function on its left, and creates a new function that applies to each item of its argument.

Syntax
------

    q)function each arg

Example
-------

    q)count (1 2 3;"hello")
    2
    q)count each (1 2 3;"hello")
    3 5

Remark
------

`each` is not used with verb arguments - for these use one of `'` (eachboth), `\:` (eachleft) or `/:` (eachright), for example:

    q)"xyz" ,' ("anne";"beth";"cindy")
    "xanne"
    "ybeth"
    "zcindy"

See also
--------

-   [adverbs](Reference/Adverb "wikilink")
-   [peach](Reference/peach "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
