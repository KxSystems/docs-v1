Max
---

Used dyadically, this is the maximum function. The arguments may be of any type except symbol:

    q)3 | til 7
    3 3 3 3 4 5 6
    q)2 3 5 | -1 6 4
    2 6 5
    q)100 | "cde"
    "dde"

Note that this is the same as logical [or](Reference/or "wikilink") for boolean arguments:

    q)0011b | 0101b
    0111b

Reverse
-------

Used monadically, this is the [reverse](Reference/reverse "wikilink") function:

    q)(|) 1 2 3
    3 2 1

See also
--------

-   [min/where](Reference/Ampersand "wikilink")
-   [or](Reference/or "wikilink")
-   [reverse](Reference/reverse "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
