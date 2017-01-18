Function `asc` sorts a list.

-   on a simple list `asc` acts as expected, and sets the `` `s# `` attribute indicating that the list is sorted.
-   on a mixed list, it sorts within datatype.
-   on a dictionary, it sorts by the values and applies the `` `s# `` attribute.
-   on a table, it sorts by the first non-key column and applies the `` `s# `` attribute.

The sort is stable, i.e. it preserves order among equals.

Syntax
------

    q)r:asc A

Examples
--------

    q)asc 2 1 3 4 2 1 2
    `s#1 1 2 2 2 3 4

The next example sorts a mixed list. Note that the boolean is returned first, then the sorted integers, the sorted characters, and then the date:

    q)asc (1;1b;"b";2009.01.01;"a";0)
    1b
    0
    1
    "a"
    "b"
    2009.01.01

Another mixed list example, note how the type numbers are used:

    q)asc(2f;3j;4i;5h)
    5h
    4i
    3
    2f
    q){(asc;x iasc abs t)fby t:type each x}(2f;3j;4i;5h)  / kind of what asc does
    5h
    4i
    3
    2f

Example of sorting a table:

    q)t:([]a:3 4 1;b:`a`d`s)
    q)asc t
    a b
    ---
    1 s
    3 a
    4 d

    q)a:0 1
    q)b:a
    q)asc b
    `s#0 1
    q)a
    `s#0 1

See also
--------

-   [desc](Reference/desc "wikilink")
-   [iasc](Reference/iasc "wikilink")
-   [idesc](Reference/idesc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
