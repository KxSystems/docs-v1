The `load` function loads binary data from the filesystem.

Syntax
------

    q)r:load x

Example
-------

    q)t:([]x: 1 2 3; y: 10 20 30)
    q)save`t             / save to a binary file (same as `:t set t)
    `:t
    q)delete t from `.   / delete t
    `.
    q)t                  / not found
    't

    q)load`t             / load from a binary file (same as t:get `:t)
    `t
    q)t
    x y
    ----
    1 10
    2 20
    3 30

If the argument to `load` is a directory, a dictionary of that name is created and all data files are loaded into that dictionary, keyed by file name. For example:

    q)\l sp.q
    q)\mkdir -p cb
    q)`:cb/p set p
    `:cb/p
    q)`:cb/s set s
    `:cb/s
    q)`:cb/sp set sp
    `:cb/sp
    q)load `cb
    `cb
    q)key cb
    `p`s`sp
    q)cb `s
    s | name  status city
    --| -------------------
    s1| smith 20     london
    s2| jones 10     paris
    s3| blake 30     paris
    s4| clark 20     london
    s5| adams 30     athens

See also
--------

-   [save](Reference/save "wikilink")
-   [get](Reference/get "wikilink")
-   [set](Reference/set "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
