`system”v”` or `\v` // list all variable names in current locale

`system”v` `XXX”` or `\v` `XXX` // list all variable names in locale XXX

Syntax
------

    q)\v

or with a locale

    q)\v .nn

Example
-------

    q)\v
    `symbol$()
    q)\v .h
    `HOME`br`c0`c1`logo`sa`sb`sc`tx`ty
    q){x where x like"????"}system"v .h"
    `HOME`logo
    q)

See also
--------

-   [\\a](Reference/Sysa "wikilink")
-   [\\b](Reference/Sysb "wikilink")
-   [\\f](Reference/Sysf "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
