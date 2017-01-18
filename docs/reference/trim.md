`trim` removes any leading and trailing spaces from a string.

    q)trim"   IBM   "
    "IBM"

Note that when converting a string to a symbol, leading and trailing blanks are automatically trimmed:

    `$"   IBM   "
    `IBM

See also
--------

-   [ltrim](Reference/ltrim "wikilink")
-   [rtrim](Reference/rtrim "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
