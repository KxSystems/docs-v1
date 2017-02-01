`system”b”` or `\b` // list all view names in current locale

`system”b` `XXX”` or `\b` `XXX` // list all view names in locale XXX

Syntax
------

    q)\b

or with a locale

    q)\b .nn

Example
-------

    q)a:12
    q)b::a+10
    q)\b
    ,`b
    q)views`.
    ,`b
    q)

See also
--------

-   [views](Reference/views "wikilink")
-   [\\a](Reference/Sysa "wikilink")
-   [\\f](Reference/Sysf "wikilink")
-   [\\v](Reference/Sysv "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
