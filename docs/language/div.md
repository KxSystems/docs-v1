Verb `div` performs integer division, i.e. X div Y returns the floor of X%Y.

Syntax
------

    q)r:X div Y

Examples
--------

    q)7 div 3
    2

Note that it preserves (except for char, byte and short) the type of the first argument

    q)7f div 2
    3f
    q)6i div 4
    1i
    q)2014.10.13 div 365
    2000.01.15

the exceptions are as usual char/byte/short which get converted to ints:

    q)7h div 3
    2i
    q)0x80 div 16
    8i
    q)"\023" div 8
    2i

</pre>

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
