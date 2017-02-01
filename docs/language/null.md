The function `null` returns `1b` if its argument is null.

Applies to all data types except enums. Applies item-wise to lists, dict values and table columns.

Syntax
------

    q)r:null X

Example
-------

    q)null 0 0n 0w 1 0n
    01001b

Enums
-----

Enums always show as non-null.

    q)a:``a
    q)`=`a$`            / non-enumerated and enumerated null symbol show as equivalent
    1b
    q)null`             / null symbol behaves as expected
    1b
    q)null`a$`          / enumeration of null symbol does not
    0b

The intention was not to have nulls in the enums. That value is used to indicate "out of range". (Think of them as a way to represent foreign keys.) To test for an enumeration backed by a null symbol, one can use the equality test - but at the cost of CPU cycles:

    q)a:10000000?`8
    q)v:`a$a
    q)\ts null v
    18 16777344
    q)\ts `=v
    66 268435648
    q)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
