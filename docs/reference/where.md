The `where` function takes a non-negative integer list and returns a new integer list.

Syntax
------

    q)r:where X

The result is built up as `X[i]` copies of `i`, for each index `i`. For example:

    q)where 2 3 0 1
    0 0 1 1 1 3
    q)raze x #' til count x:2 3 0 1
    0 0 1 1 1 3

Where the argument is a boolean list, this returns the indices of the 1's. Thus `where` is often used after a logical test:

    q)where 0 1 1 0 1
    1 2 4
    q)x:1 5 6 8 11 17 20 21
    q)where 0 = x mod 2        / indices of even numbers
    2 3 6
    q)x where 0 = x mod 2      / select even numbers from list
    6 8 20

Where the argument is a dictionary whose values are non-negative integers, the result is a list with keys repeated as many times as the corresponding value. Note that if a list is viewed as a mapping from indices to entries, than the definition for the integer list above is a special case.

    q)d:`amr`ibm`msft!2 3 1
    q)where d
    `amr`amr`ibm`ibm`ibm`msft
    q)where 2 3 0 1               / usual operation on integer list
    0 0 1 1 1 3
    q)where 0 1 2 3 ! 2 3 0 1     / same on dictionary with indices as keys
    0 0 1 1 1 3

where in queries
----------------

`where` can be used in the contraints of a select/update/delete query, finding the indices where the constraint is true. Several constraints can be given, separated by commas. For example:

    q)select from trade where sym=`IBM,price>90.3,size<100

Unlike other q expressions, the `where` of a query is evaluated left to right. In this case the constraints are:

    sym=`IBM;price>90.3;size<100

The evaluation starts from the leftmost constraint, and finds the indexes where sym=`` `IBM ``

    q)where sym=`IBM
    0 1 2 3 6 7

The next constraint `price>90.3` is applied to the price column where the previous constraint was true, i.e.

    q)0 1 2 3 6 7 where price[0 1 2 3 6 7]>90.3
    2 6 7

The last constraint is applied to size as:

    q)2 6 7 where size[2 6 7]<100
    2 7

When querying a database, the first constraint should be the one that eliminates the most data, and so on. For a partitioned database, the partition variable must be the first element of the constraints list.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
