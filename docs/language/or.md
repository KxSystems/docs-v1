The verb `or` returns the maximum of its arguments. It applies to all data types except symbol.

Syntax
------

    q)r:X or Y

Example
-------

    q)1100b or 1010b
    1110b
    q)0b or 10b
    10b

Remark
------

The name `or` is used because it behaves as logical OR on boolean arguments, but is extended to maximum on other data types:

    q)-2 0 3 7 or 0 1 3 4
    0 1 3 7

See also
--------

-   [and](Reference/and "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
