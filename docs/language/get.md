`get` reads or memory maps a q data file. A type error is thrown if the file is not a q data file.

`get` is used to map columns of databases in and out of memory when querying splayed databases, and can be used to read q log files etc.

Syntax
------

    q)r:get X

Example
-------

    q)\l trade.q
    q)`:NewTrade set trade                  / save trade data to file
    `:NewTrade
    q)t:get`:NewTrade                       / t is a copy of the table
    q)`:SNewTrade/ set .Q.en[`:.;trade]     / save splayed table
    `:SNewTrade/
    q)s:get`:SNewTrade/                     / s has columns mapped on demand

Remark
------

`get` has several other uses. However, the function `value` is the same as `get` and by convention is used in other circumstances. The two are interchangeable, for example, evaluate a character string:

    q)value "2+3"
    5
    q)get "2+3"
    5

See also
--------

-   [set](Reference/set "wikilink")
-   [load](Reference/load "wikilink")
-   [save](Reference/save "wikilink")
-   [value](Reference/value "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
