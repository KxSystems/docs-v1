The vector from scalar verb performs different functions depending on its arguments. Typically, it returns an list (vector) from each atom (scalar) in its argument, or may return a list of lists from a list.

Syntax
------

    q)r:X vs Y

If `Y` is a string, and `X` is a character or string, it cuts `Y` using `X` as the delimiter, returning a list of strings:

    q)"," vs "one,two,three"
    "one"
    "two"
    "three"
    q)", " vs "spring, summer, autumn, winter"
    "spring"
    "summer"
    "autumn"
    "winter"
    q)"|" vs "red|green||blue"
    "red"
    "green"
    ""
    "blue"

If `X` is `0b` and `Y` is an integer, it returns the bit representation of `Y`:

    q)0b vs 23173h
    0101101010000101b
    q)0b vs 23173
    00000000000000000101101010000101b

If `X` is `0x0` and `Y` is a number, it returns the internal representation of `Y`, with each byte in hex:

    q)0x0 vs 2413h
    0x096d
    q)0x0 vs 2413
    0x0000096d
    q)0x0 vs 2413e
    0x4516d000
    q)0x0 vs 2413f
    0x40a2da0000000000
    q)"."sv string"h"$0x0 vs .z.a / ip address string from .z.a
    "192.168.1.213"

If `X` is the back tick `` ` ``, then it splits symbols on `` `.` ``, breaks file handles into directory & file parts and if `y` is a string it breaks into lines (cross-platform - both UNIX (\\n) and DOS (\\r\\n) end of lines):

    q)` vs `mywork.dat
    `mywork`dat
    q)` vs `:/home/kdb/data/mywork.dat
    `:/home/kdb/data`mywork.dat
    q)` vs "abc\ndef\nghi"
    "abc"
    "def"
    "ghi"
    q)` vs "abc\r\ndef\r\nghi"
    "abc"
    "def"
    "ghi"

Since 3.4t 2015.12.13: For integer types, computes the base representation of Y in the radices X. e.g.

    q)10 vs 1995
    1 9 9 5
    q)2 vs 9
    1 0 0 1
    q)24 60 60 vs 3805
    1 3 25
    q)"." sv string 256 vs .z.a / ip address string from .z.a
    "192.168.1.213"

If the right argument is an integer vector then the result of x vs y is a matrix with count\[x\] items whose ith column (x vs y)\[;i\] is identical to x vs y\[i\]. More generally, the right argument y can be any list of integers, and each item of the result is identical to y in structure. e.g.

    q)a:10 vs 1995 1996 1997
    q)a
    1 1 1
    9 9 9
    9 9 9
    5 6 7
    q)a[;0]
    1 9 9 5
    q)10 vs(1995;1996 1997)
    1 1 1
    9 9 9
    9 9 9
    5 6 7

See also
--------

-   [sv](Reference/sv "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
