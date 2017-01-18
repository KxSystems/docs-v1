The function `signum` returns -1, 0 or 1 if the argument is negative, zero or positive respectively. Applies item-wise to lists, dictionaries and tables, and to all data types except symbol.

Syntax
------

    q)r:signum X

Example
-------

    q)signum -2 0 1 3
    -1 0 1 1

`signum` return -1 for nulls

    q)signum (0n;0N;0Nt;0Nd;0Nz;0Nu;0Nv;0Nm;0Nh;0Nj;0Ne)
    -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1

Used to find counts of price movements by direction:

    q)select count i by signum deltas price from trade

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
