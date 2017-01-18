The function `type` returns the type of its argument as a short integer. Negative numbers are for atoms, positive numbers are for lists, and zero is a general K list. The type codes are as follows:

| |native | name                                  | for [$](Reference/DollarSign "wikilink") and [0:](Reference/ZeroColon "wikilink") | size |
|---------|---------------------------------------|-----------------------------------------------------------------------------------|------|
| 0h      | list                                  | -                                                                                 |
| 1       | boolean                               | b                                                                                 | 1    |
| 2       | guid (since v3.0)                     | g                                                                                 | 16   |
| 4       | byte                                  | x                                                                                 | 1    |
| 5       | short                                 | h                                                                                 | 2    |
| 6       | int                                   | i                                                                                 | 4    |
| 7       | long                                  | j                                                                                 | 8    |
| 8       | real                                  | e                                                                                 | 4    |
| 9       | float                                 | f                                                                                 | 8    |
| 10      | char                                  | c                                                                                 | 1    |
| 11      | symbol                                | S                                                                                 | .    |
| 12      | timestamp                             | p                                                                                 | 8    |
| 13      | month                                 | m                                                                                 | 4    |
| 14      | date                                  | d                                                                                 | 4    |
| 15      | datetime (deprecated, use timestamp)  | z                                                                                 | 8    |
| 16      | timespan                              | n                                                                                 | 4    |
| 17      | minute                                | u                                                                                 | 4    |
| 18      | second                                | v                                                                                 | 4    |
| 19      | time                                  | t                                                                                 | 4    |
| 20-76   | enums                                 |
| 77      | unused                                |
| 78-96   | 77+t - mapped list of lists of type t |
| 97      | nested sym enum                       |
| 98      | table                                 |
| 99      | dictionary                            |
| 100     | lambda                                |
| 101     | unary primitive                       |
| 102     | binary primitive                      |
| 103     | ternary(operator)                     |
| 104     | projection                            |
| 105     | composition                           |
| 106     | f'                                    |
| 107     | f/                                    |
| 108     | f\\                                   |
| 109     | f':                                   |
| 110     | f/:                                   |
| 111     | f\\:                                  |
| 112     | dynamic load                          |

lookup
------

    q)20#.Q.t
    " bg xhijefcspmdznuvt"
    q){key x$()}'[.Q.t where " "<>20#.Q.t]
    `boolean`guid`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time
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

See also
========

-   [cast](Reference/DollarSign#cast "wikilink")
-   [tok](Reference/DollarSign#tok "wikilink")
-   [key](Reference/key "wikilink")
-   [Reference/Datatypes](Reference/Datatypes "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
