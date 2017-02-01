`system”f”` or `\f` // list all function names in current locale

`system”f` `XXX”` or `\f` `XXX` // list all function names in locale XXX

Syntax
------

    q)\f

or with a locale

    q)\f .nn

Example
-------

    q)\f
    `symbol$()
    q)\f .h
    `cd`code`data`eb`ec`ed`es`estr`fram`ha`hb`hc`he`hn`hp`hr`ht`hta`htac`htc`html`http`hu`hug`hy`jx`nbr`pre`td`text`uh`xd`xmp`xs`xt
    q){x where x like"ht??"}system"f .h"
    `htac`html`http
    q)

See also
--------

-   [\\a](Reference/Sysa "wikilink")
-   [\\b](Reference/Sysb "wikilink")
-   [\\v](Reference/Sysv "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
