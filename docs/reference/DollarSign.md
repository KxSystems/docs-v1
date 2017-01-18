cond
====

Triad $ is cond, a conditional.

`` q)$[0b;`true;`false] ``
`` `false ``
`` q)$[1b;`true;`false] ``
`` `true ``

For brevity, nested triads can be flattened: `$[q;a;$[r;b;c]]` is equivalent to `$[q;a;r;b;c]`. An example of cond in a signum-like function:

`q){$[x>0;1;x<0;-1;0]}'[0 3 -9]`
`0 1 -1`

`$[q;$[r;a;b];c]` is not the same as `$[q;r;a;b;c]`

cond with many arguments can be translated to triads by repeatedly replacing the last three arguments with the triad: `$[q;a;r;b;s;c;d]` is `$[q;a;$[r;b;$[s;c;d]]]`. So cond always has an odd number of arguments.

These two expressions are equivalent:

`q)$[0;a;r;b;c]`
`q)    $[r;b;c]`

Only the first argument is guaranteed to be evaluated.

`` q)$[1b;`true;x:`false] ``
`` `true ``
`q)x`
`'x`

See also [Basic](JB:QforMortals2/execution_control#Basic_Conditional_Evaluation "wikilink") & [Extended](JB:QforMortals2/execution_control#Extended_Conditional_Evaluation "wikilink") cond in "Q for Mortals, 2"

x$y
===

The dyad has multiple uses.

cast
----

When x is a lower case letter, symbol or non-negative short, x$y casts y according to x

Casting to integer

` "i"$10`
`10i`
``  (`int;"i";6h)$10 ``
`10 10 10i`

..to boolean list

`q)1h$1 0 2`
`101b`

Find parts of time

`` q)`hh`uu`ss$03:55:58.11 ``
`3 55 58i`
`` q)`year`dd`mm`hh`uu`ss$2015.10.28D03:55:58 ``
`2015 28 10 3 55 58i`

Identity

` ("*";0h)$10`
`10 10 `

A table of letters and types for cast

    q)flip{(x;.Q.t x;key'[x$\:()])}5h$where" "<>20#.Q.t
    1h  "b" `boolean
    2h  "g" `guid
    4h  "x" `byte
    5h  "h" `short
    6h  "i" `int
    7h  "j" `long
    8h  "e" `real
    9h  "f" `float
    10h "c" `char
    11h "s" `symbol
    12h "p" `timestamp
    13h "m" `month
    14h "d" `date
    15h "z" `datetime
    16h "n" `timespan
    17h "u" `minute
    18h "v" `second
    19h "t" `time

tok
---

When x is an upper case letter or non positive short, x$ interprets a string as a value according to x. \`$x is shorthand for "S"$x.

`q)"S"$"hello"`
`` `hello ``
`` q)`$"hello" ``
`` `hello ``
`q)"E"$"3.14"`
`3.14e`
`q)-8h$"3.14"`
`3.14e `
`q)"D"$"2000-12-12"`
`2000.12.12`
`q)"U"$"12:13:14"`
`12:13`
`q)"T"$"123456789"`
`12:34:56.789`
`q)"P"$"2015-10-28D03:55:58.6542"`
`2015.10.28D03:55:58.654200000`
`q)"I"$"192.168.1.34" /an IP address as an int`
`-1062731486i`

`Parsing unix timestamps (from seconds since unix epoch), string with 9..11 digits `
`q)"P"$"10129708800"`
`2290.12.31D00:00:00.000000000`
`q)"P"$"00000000000"`
`1970.01.01D00:00:00.000000000`
`continuing with unix timestamps, if these digits are followed by a .  it will parse the rhs of . as parts of second, e.g. `
`q)"P"$"10129708800.123456789"`
`2290.12.31D00:00:00.123456789`
`q)"P"$"00000000000.123456789"`
`1970.01.01D00:00:00.123456789`

`"D"$` will tok dates with varied formats:

` [yy]yymmdd   `
` ddMMM[yy]yy    `
` yyyy/[mm|MMM]/dd `
` [mm|MMM]/dd/[yy]yy  / \z 0  see `[`\z` `(date` `format)`](JB:QforMortals2/commands_and_system_variables#Date_Format_(-z) "wikilink")
` dd/[mm|MMM]/[yy]yy  / \z 1`

Identity

`q)("*";0h)$\:"2012-02-02"`
`"2012-02-02"`
`"2012-02-02"`

A table of x values for tok

    q)flip{(neg x;upper .Q.t x;key'[x$\:()])}5h$where" "<>20#.Q.t
    -1h  "B" `boolean
    -2h  "G" `guid
    -4h  "X" `byte
    -5h  "H" `short
    -6h  "I" `int
    -7h  "J" `long
    -8h  "E" `real
    -9h  "F" `float
    -10h "C" `char
    -11h "S" `symbol
    -12h "P" `timestamp
    -13h "M" `month
    -14h "D" `date
    -15h "Z" `datetime
    -16h "N" `timespan
    -17h "U" `minute
    -18h "V" `second
    -19h "T" `time

Following characters are recognized as boolean true:

    q).Q.an where"B"$'.Q.an
    "txyTXY1"

enum
----

For a long list containing few distinct values, an enumeration can reduce storage requirements

The "manual" way to enum; this is for understanding, not the recommended way to create an enum:

    q)y:`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x:`a`b`c
    q)show e:"i"$x?y;
    0 1 2 1 0 1 2 2 2 2 2 2 2i  /these values are what we store instead of y.
    q)x e                       /get back the symbols any time from x and e.
    `a`b`c`b`a`b`c`c`c`c`c`c`c
    q)`x!e / same result as `x$y 
    `x$`a`b`c`b`a`b`c`c`c`c`c`c`c

Using built in enum:

`` q)show e:`x$y; ``
`` `x$`a`b`c`b`a`b`c`c`c`c`c`c`c ``

Values are stored as indices and so need less space.

`q)"i"$e`
`0 1 2 1 0 1 2 2 2 2 2 2 2i`

One change to a lookup value (in x) has the same effect as changing those values in the enumeration while the indices backing e are unchanged.

`` q)x[0]:`o ``
`q)e`
`` `x$`o`b`c`b`o`b`c`c`c`c`c`c`c ``
`q)"i"$e`
`0 1 2 1 0 1 2 2 2 2 2 2 2i`

To get x and y from e:

`q)(key;value)@\:e`
`` `x ``
`` `o`b`c`b`o`b`c`c`c`c`c`c`c ``

Note that when creating an enum using cast ($), the domain of the enum must already exist, otherwise a 'cast error will be thrown.

    q)y:`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x:`a`b
    q)`x$y
    'cast

to expand the domain, use ? instead of $.

    q)`x?y
    `x$`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x
    `a`b`c

Note that ? retains the attr of the rhs but $ does not.

    q)`x?`g#y
    `g#`x$`g#`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)`x$`g#y
    `x$`a`b`c`b`a`b`c`c`c`c`c`c`c

see [Q for Mortals: Enumerations](JB:QforMortals/casting_and_enumerations#Enumerations "wikilink")

pad
---

When x is a long, $ pads a string

`q)10$"foo"`
`"foo       "`
`q)-10$"foo"`
`"       foo"`

product
-------

When x and y are lists of floats

Dot product

`q)1 2 3f$4 5 6f`
`32f`

Matrix multiply

`q)(1 2 3f;4 5 6f)$(7 8f;9 10f;11 12f)`
`58  64`
`139 154`

this is the same as the [mmu](Reference/mmu "wikilink") function.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
