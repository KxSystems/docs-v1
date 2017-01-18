The `meta` function returns the meta data of its table argument, passed by value or reference. The result is a table keyed by column name, with columns:

-   c - column name
-   t - data type
-   f - foreign key (enumeration)
-   a - attribute

Syntax
------

    q)K:meta T

Example
-------

    q)\l trade.q
    q)show meta trade
    c    | t f a
    -----| -----
    time | t
    sym  | s
    price| f
    size | i
    q)show meta `trade
    c    | t f a
    -----| -----
    time | t
    sym  | s
    price| f
    size | i
    q)`sym xasc`trade;   / sort by sym thereby setting the `s attribute
    q)show meta trade
    c    | t f a
    -----| -----
    time | t
    sym  | s   s
    price| f
    size | i

The `t` column from a meta result denotes the column type. A lower-case latter indicates atomic entry and an upper-case letter indicates a list. For example:

    q)u:([] code:`F1; vr:(enlist 2.3))
    q)u
    code vr
    --------
    F1   2.3
    q)meta u
    c   | t f a
    ----| -----
    code| s
    vr  | f
    q)v:([] code:`F2; vr:(enlist (5.4; 43.2)))
    q)v
    code vr
    -------------
    F2   5.4 43.2
    q)meta v
    c   | t f a
    ----| -----
    code| s
    vr  | F

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
