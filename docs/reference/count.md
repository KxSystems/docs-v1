`count` applies to atoms, lists, dictionaries and tables, and returns the number of elements in its argument (rows for a table and entries for dictionary). Use with `each` to count the number of elements at each level of a list or dictionary.

Syntax
------

    q)r:count x

Example
-------

    q)count 42
    1
    q)count 1 2 3
    3
    q)RaggedArray:(1 2 3;4 5;6 7 8 9;0)
    q)count RaggedArray
    4
    q)count each RaggedArray
    3 2 4 1
    q)RaggedDict:`a`b`c!(1 2;3 4 5;"hello")
    q)count RaggedDict
    3
    q)count each RaggedDict
    a| 2
    b| 3
    c| 5
    q)\l sp.q
    q)count sp
    12

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
