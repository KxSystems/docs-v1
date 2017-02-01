! (dict/key)
============

dict
----

! is a dyadic function that takes two lists of the same length and returns a dictionary

    q)`a`b`c!1 2 3
    a| 1
    b| 2
    c| 3

Because tables are collections of like dictionaries, ! applied to each member of a list will return a table of that list. For example:

    q)(`a`b`c!)each(0 0 0;1 2 3;2 4 6)
    a b c
    -----
    0 0 0
    1 2 3
    2 4 6

The same result may be achieved with a pair of flips:

    q)flip`a`b`c!flip(0 0 0;1 2 3;2 4 6)
    a b c
    -----
    0 0 0
    1 2 3
    2 4 6

key
---

With a positive integer on the left hand side converts a simple table to a keyed table with the given number of key columns:

    q)t:([]a:1 2 3;b:10 20 30;c:`x`y`z)
    q)2!t
    a b | c
    ----| -
    1 10| x
    2 20| y
    3 30| z

With a 0 on the left hand side, converts a keyed table to a simple one:

    q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
    q)0!t
    a b  c
    ------
    1 10 x
    2 20 y
    3 30 z

Note that if given a table-name instead of a table it amends the table

    q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
    q)0!`t
    `t
    q)t
    a b  c
    ------
    1 10 x
    2 20 y
    3 30 z

enumeration
-----------

With a symbol on the left hand side, converts an integer list to an enumerated symbol list

    q)x:`a`b`c`d
    q)`x!1 2 3
    `x$`b`c`d

functional update/delete
------------------------

See [Functional update](JB:QforMortals2/queries_q_sql#Functional_update "wikilink") and [Functional delete](JB:QforMortals2/queries_q_sql#Functional_delete "wikilink").

0N!x
----

With a 0N on the left hand side, returns the right hand side after printing its unformatted text representation to console. This is useful for debugging, or avoiding formatting which may obscure the data's structure.

    q)2+0N!3
    3
    5

other
-----

With a negative integer on the left-hand side, calls an internal function; for gory details, see [internal functions](Reference/BangSymbolInternalFunction "wikilink").

With a symbol list on the left-hand side and an hsym symbol atom on the right-hand side, creates the flip of a splayed table. With a symbol list on the left-hand side and a non-hsym symbol atom on the right-hand side, creates the flip of a partitioned table. In either case, once the resulting object is flipped, the symbol list from the left-hand side becomes the columns of the table.

See also
--------

-   [lsq](Reference/lsq "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
