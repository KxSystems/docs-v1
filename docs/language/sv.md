The scalar from vector verb performs different functions depending on its arguments, but in each case will return an atom (scalar) from a list (vector).

### Syntax

    q)r:X sv Y

### Join strings

If `Y` is a list of strings, and `X` is a character or string, it joins the strings in `Y`, separated by `X`:

    q)"," sv ("one";"two";"three")    / comma separated
    "one,two,three"
    q)"\t" sv ("one";"two";"three")   / tab separated
    "one\ttwo\tthree"
    q)", " sv ("one";"two";"three")   / left argument may be a string
    "one, two, three"
    q)"." sv string 192 168 1 23      / form ip address
    "192.168.1.23"

If `X` is the back tick `` ` ``, then if `Y` is a list of strings, it joins the strings in `Y`, separated by the host line separator (\\n on unix, \\r\\n on windows):

    q)` sv ("one";"two";"three")      / add host line separator
    "one\ntwo\nthree\n"

### Join path components

If `Y` is a symbol list where the first element is a file handle, it returns a file handle where the items of the list are joined, separated by slashes. This is useful when building file paths:

    q)` sv `:/home/kdb/q`data`2010.03.22`trade
    `:/home/kdb/q/data/2010.03.22/trade

If `Y` is a symbol list where the first element is not a file handle, it returns a symbol where the elements are joined, separated by `.` (dot). This is useful for building filenames with a given extension:

    q)` sv `mywork`dat
    `mywork.dat

### Base conversion

If `X` and `Y` are numeric, it evaluates `Y` to base `X`.

    q)10 sv 2 3 5 7
    2357
    q)100 sv 2010 3 17
    20100317

X may be a list. For example, to convert days, hours, minutes, seconds to seconds:

    q)0 24 60 60 sv 2 3 5 7   / 2 days, 3 hours, 5 minutes, 7 seconds
    183907

Note that when `X` is a list, the first number is not used. The calculation is done as:

    q)baseval:{y wsum reverse prds 1,reverse 1_x}
    q)baseval[0 24 60 60;2 3 5 7]
    183907f

### Bytes to integer conversion

If `X` is `0x0` and `Y` is a list of bytes of length 2, 4 or 8, it converts `Y` to the corresponding integer:

    q)0x0 sv "x" $0 255           / short
    255h
    q)0x0 sv "x" $128 255
    -32513h
    q)0x0 sv "x" $0 64 128 255    / int
    4227327
    q)0x0 sv "x" $til 8           / long
    283686952306183j
    q)256j sv til 8               / same calculation
    283686952306183j

To convert non integers, use [1:](Reference/OneColon "wikilink") - eg:

    q)show a:0x0 vs 3.1415
    0x400921cac083126f
    q)(enlist 8;enlist "f")1: a   /float
    3.1415

### Bits to integer conversion

If `X` is `0b` and `Y` is a list of booleans of length 8, 16, 32, or 64 it converts `Y` to the corresponding integer or — in the case of 8 bits — a byte value:

    q)0b sv 64#1b
    -1
    q)0b sv 32#1b
    -1i
    q)0b sv 16#1b
    -1h
    q)0b sv 8#1b
    0xff

See also
--------

-   [vs](Reference/vs "wikilink")
-   [1:](Reference/OneColon "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
