The `txf` function does indexed lookup on a keyed table. The function is deprecated since 2.4, and removed completely since 3.0, in favor of straightforward indexing as shown below.

Syntax
------

    r:txf[table;indices;columns]

Here, table is a keyed table. The indices are the key values to lookup. The columns are those to be read.

Example
-------

    q)s:`a`s`d`f
    q)c:2 3 5 7
    q)p:1 2 3 4
    q)r:10 20 30 40
    q)t:([s;c];p;r)
    q)txf[t;(s;c);`p`r]
    1 10
    2 20
    3 30
    4 40
    q)t[([]s;c);`p`r]             / equivalent without txf
    1 10
    2 20
    3 30
    4 40
    q)
    q)txf[t;(`d`a;5 2);`p`r]
    3 30
    1 10
    q)t[([]s:`d`a;c:5 2);`p`r]    / equivalent without txf
    3 30
    1 10

`txf` was used in select expressions to join tables with no foreign key relationship, for example:

    q)q:([]s:`d`f`s;c:5 7 3;k:"DFS")
    q)select s,k,txf[t;(s;c);`p] from q
    s k x
    -----
    d D 3
    f F 4
    s S 2
    q)select s,k,t[([]s;c);`p] from q    / equivalent without txf
    s k x
    -----
    d D 3
    f F 4
    s S 2

See also
--------

-   [Joins](Reference/joins "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
