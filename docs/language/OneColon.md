1:
==

The `1:` dyadic function is used to read fixed length data from a file or byte/char sequence. The left argument is a list of types and their widths to read, and the right argument is the file handle or byte/char sequence. The left argument 2 element list dictates whether the data will be parsed as little endian or big endian. e.g.

    q)(enlist 4;enlist"i")1:0x01000000 / big endian
    16777216
    q)(enlist"i";enlist 4)1:0x01000000 / little endian
    1
    q)(enlist"f";enlist 8)1:0x7fbdc282fb210940 / pi as little endian 64bit float
    3.141593

Optionally, it can also take a three-item list as its second argument, containing the file handle, an offset at which to begin reading, and a length to read.

Example
-------

Here we read two records containing an integer, a character and a short from a byte sequence. Note that the integer is read with a 4 byte width, the character with 1 byte and the short with 2 bytes. When reading byte sequences it is helpful to recall that a byte is 2 hex digits.

    q)("ich";4 1 2)1:0x00000000410000FF00000042FFFF
    (0 255;"AB";0 -1h)

    q)("ich";4 1 2)1:"arthur!"
    (,1752461921;,"u";,8562h)

With offset and length:

    q)d:raze{("ii";4 4)1:(`:/tmp/data;x;100000)}each 100000*til 5 / load 500000 records, 100000 at a time

Save Binary
-----------

x 1: y writes bytes y to file x, thus:

`` `:hello 1: 0x68656c6c6f776f726c64 ``

writes a binary string to the file.

See also
--------

-   [0:](Reference/ZeroColon "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
