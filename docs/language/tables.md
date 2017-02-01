The `tables` function returns a sorted list of the tables in the given namespace, default root namespace:

Syntax
------

    q)r:tables X

Example
-------

    q)\l sp.q
    q)tables `.       / tables in root namespace
    `p`s`sp
    q)tables[]        / default is root namespace
    `p`s`sp
    q).work.tab:sp    / assign table in work namespace
    q)tables `.work   / tables in work
    ,`tab

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
