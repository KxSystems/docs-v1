The function `string` converts each atom in its argument to a character string. It applies to all data types.

Syntax
------

    q)r:string X

Example
-------

    q)string `ibm`goog
    "ibm"
    "goog"
    q)string 2 7 15
    ,"2"
    ,"7"
    "15"
    q)string (2 3;"abc")
    (,"2";,"3")
    (,"a";,"b";,"c")

It applies to the values of a dictionary, and the columns of a table:

    q)string ([]a:1 2 3;b:`ibm`goog`aapl)
    a    b
    -----------
    ,"1" "ibm"
    ,"2" "goog"
    ,"3" "aapl"

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
