The verb `and` returns the minimum of its arguments. It applies to all data types except symbol.

Syntax
------

    q)r:X and Y

Example
-------

    q)1100b and 1010b
    1000b
    q)1b and 10b
    10b
    q)1b and 0b
    0b

Remark
------

The name `and` is used because it behaves as logical AND on boolean arguments, but is extended to minimum on other data types:

    q)-2 0 3 7 and 0 1 3 4
    -2 0 3 4

See also
--------

-   [or](Reference/or "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
