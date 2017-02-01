The `eval` function is the dual to [parse](Reference/parse "wikilink") and can be used to evaluate a [parse tree](Reference/parse_tree "wikilink") as returned by that function (as well as manually constructed parse trees).

Example
-------

Evaluating the result of a parse:

    q)parse "2+3"
    +
    2
    3
    q)eval parse "2+3"
    5

Evaluating a manually constructed parse tree:

    q)eval (+;2;3)
    5

See also
--------

-   [parse](Reference/parse "wikilink")
-   [parse tree](Reference/parse_tree "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
