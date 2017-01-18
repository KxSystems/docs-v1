Function `desc` sorts a list in descending order:

-   on a simple list `desc` acts as expected, and sets the `` `s# `` attribute indicating that the list is sorted.

<!-- -->

-   on a mixed list it sorts within datatype.

<!-- -->

-   when applied to a dictionary or table, it sets the `` `s# `` attribute on the first key value or column respectively (if possible), and then sorts by that key or column.

The sort is stable, i.e. it preserves order among equals.

Syntax
------

    q)r:desc A

Example
-------

    q)desc 2 1 3 4 2 1 2
    4 3 2 2 2 1 1

The next example sorts a mixed list:

    q)desc (1;1b;"b";2009.01.01;"a";0)
    2009.01.01
    "b"
    "a"
    1
    0
    1b

Example of sorting a table:

    q)t:([]a:3 4 1;b:`a`d`s)
    q)desc t
    a b
    ---
    4 d
    3 a
    1 s

See also
--------

-   [asc](Reference/asc "wikilink")
-   [idesc](Reference/idesc "wikilink")
-   [iasc](Reference/iasc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
