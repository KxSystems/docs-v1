`system”a”` or `\a` // list all table names in current locale

`system”a` `XXX”` or `\a` `XXX` // list all table names in locale XXX

Syntax
------

    q)\a

or with a locale

    q)\a .nn

Example
-------

    q)\a
    `symbol$()
    q)aa:bb:23
    q)\a
    `symbol$()
    q)tt:([]dd:12 34)
    q)\a
    ,`tt
    q).nn.vv:([]uu:12 45)
    q)\a
    ,`tt
    q)\a .n
    '.n
    q)\a .nn
    ,`vv
    q)\d .nn
    q.nn)\a
    ,`vv
    q.nn)vv
    uu
    --
    12
    45
    q.nn)

See also
--------

-   [tables](Reference/tables "wikilink")
-   [\\b](Reference/Sysb "wikilink")
-   [\\f](Reference/Sysf "wikilink")
-   [\\v](Reference/Sysv "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
