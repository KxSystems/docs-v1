Function `attr` returns the attributes of its argument. It can be applied to all data types. The possible attributes are:

-   `` `s# `` sorted
-   `` `u# `` unique (hash table)
-   `` `p# `` partitioned (grouped)
-   `` `g# `` true index (dynamic attribute): enables constant time update and access for realtime tables

Syntax
------

    q)r:attr L

The result is a symbol atom and is one of `` `s`u`p`g` `` with `` ` `` meaning no attributes are set on the argument.

Example
-------

    q)attr 1 3 4
    `
    q)attr asc 1 3 4
    `s

See also
--------

[Q for Mortals section](JB:QforMortals2/tables#Attributes "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
