The function `ssr` does search and replace on a string.

Syntax
------

    q)r:ssr[X;Y;Z]

This searches for string `Y` in string `X` and replaces it with `Z`. The replacement `Z` may be a string, or a function that is evaluated on the matched substring, and returns the replacement string.

The search is done using function `ss`, and this supports some pattern matching capabilities of the function `like`.

Example
-------

    q)s:"toronto ontario"
    q)ssr[s;"ont";"x"]      / replace "ont" by "x"
    "torxo xario"
    q)ssr[s;"t?r";upper]    / replace matches by their uppercase
    "TORonto onTARio"

See also
--------

-   [like](Reference/like "wikilink")
-   [ss](Reference/ss "wikilink")
-   [Regex Cookbook](Cookbook/regex "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
