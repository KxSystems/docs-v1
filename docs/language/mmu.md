`mmu` computes the matrix multiplication of floating point matrices. The arguments must be floating point and must conform in the usual way, i.e. the columns of `x` must equal the rows of `y`.

Syntax
------

    q)r:x mmu y

Example
-------

    q)a:2 4#2 4 8 3 5 6 0 7f
    q)b:4 3#"f"$til 12
    q)a mmu b
    87 104 121
    81 99  117
    q)c:3 3#2 4 8 3 5 6 0 7 1f
    q)1=c mmu inv c
    100b
    010b
    001b

This can use slave threads via peach

    q)mmu[;b]peach a
    87 104 121
    81 99  117

See also
--------

-   [lsq](Reference/lsq "wikilink")
-   [inv](Reference/inv "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
