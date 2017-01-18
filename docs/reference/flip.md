`flip` transposes its argument, which may be a list of lists, a dictionary or a table.

-   in the case of a list of lists, each list must be the same length
-   the flip of a dictionary is a table, and vice versa - see below

Syntax
------

    q)R:flip M

Example
-------

    q)flip (1 2 3;4 5 6)
    1 4
    2 5
    3 6

Dictionaries and Tables
-----------------------

If D is a dictionary where the keys are a list of symbols, and where the values are conformable lists (i.e. have the same length or are atoms), then `flip` applied to D will return a table. The flip of a table is a dictionary.

Example
-------

    q)D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100)
    q)flip D
    sym  price size
    ---------------
    IBM  10.2  100
    MSFT 23.45 100
    q)D~flip flip D
    1b

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
