The `within` verb returns a boolean for each atom of the left argument indicating whether it is within the bounds given in the right argument.

Syntax
------

    q)r:X within bounds

The right argument is a pair: `begin`, `end`. The test is on `(X` `>=` `begin)` `&` `X` `<=` `end`

    q)1 3 10 6 4 within 2 6
    01011b

`within` also applies to chars and syms, since they are ordered:

    q)"acyxmpu" within "br"
    0100110b
    q)select sym from ([]sym:`dd`ccc`ccc) where sym within `c`d
    sym
    ---
    ccc
    ccc

The right argument can be a pair of lists of length n, and the left argument an atom or a list of length n:

    q)5 within (1 2 6;3 5 7)
    010b
    q)2 5 6 within (1 2 6;3 5 7)
    111b
    q)(1 3 10 6 4;"acyxmpu") within ((2;"b");(6;"r"))
    01011b
    0100110b

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
