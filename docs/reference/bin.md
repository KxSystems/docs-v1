`bin` gives the index of the last element in `x` which is `<=y`. The result is `-1` for y less than the first element of `x`.
`binr` `(bin` `right)`, introduced in kdb+3.0 2012.07.26, gives the index of the first element in `x` which is `>=y`.

It uses a binary search algorithm, which is generally more efficient on large data than the linear search algorithm used by `?`.

The items of the left argument should be sorted ascending although bin does not verify that; if the items are not sorted ascending, the result is undefined. The right argument can be either an atom or simple list of the same type as the left argument.

Syntax
------

    q)r:x bin y

The result r can be interpreted as follows: for an atom `y`, `r` is an integer atom whose value is either a valid index of `x` or `-1`. In general:

    r[i]=-1            iff y[i]<x[0]
    r[i]=i             iff x[i]<=y[i]<x[i+1]

and

    r[j]=x bin y[j]    for all j in index of y

Essentially `bin` gives a half-open interval on the left. `bin` is an atomic function of its right argument, i.e. the result has the same shape as the right argument.

Bin also operates on tuples and table columns and is the verb used in the functions `aj` and `lj`.

`bin` and `?` on 3 columns find all equijoins on the first 2 cols and then do `bin` or `?` respectively on the 3rd column. `bin` assumes the 3rd column is sorted within the equivalence classes of the first two column pairs (but need not be sorted overall).

Example
-------

    q)0 2 4 6 8 10 bin 5
    2
    q)0 2 4 6 8 10 bin -10 0 4 5 6 20
    -1 0 2 2 3 5

If the left argument is not unique the result is not the same as would be obtained with `?`:

    q)1 2 3 3 4 bin 2 3
    1 3
    q)1 2 3 3 4 ? 2 3
    1 2

See also
--------

-   [?](Reference/QuestionSymbol "wikilink")
-   [joins](Reference/joins "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
