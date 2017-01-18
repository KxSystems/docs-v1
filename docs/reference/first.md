Monadic aggregation function which applies to atoms, lists, dictionaries and tables. It returns the first element in its argument (row in the case of a table and entry associated with the first key in the case of a dictionary). It is often used with `each` to get the first element of each level of a list, or for each key in a dictionary.

`first` returns an atom from a simple list, and otherwise reduces the level of nesting of a list.

Syntax
------

    q)r:first X

Example
-------

    q)first 1 2 3 4 5
    1
    q)first 42
    42
    q)RaggedArray:(1 2 3;4 5;6 7 8 9;0)
    q)first each RaggedArray
    1 4 6 0
    q)RaggedDict:`a`b`c!(1 2;3 4 5;"hello")
    q)first each RaggedDict
    q)first each RaggedDict
    a| 1
    b| 3
    c| "h"

`first` on a table returns the first row:

    q)\l sp.q
    q)first sp
    s  | `s$`s1
    p  | `p$`p1
    qty| 300

`first` is the dual to `enlist`:

    q)a:10
    q)a~first enlist 10
    1b
    q)a~first first enlist enlist 10
    1b

See also
--------

-   [enlist](Reference/enlist "wikilink")
-   [last](Reference/last "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
