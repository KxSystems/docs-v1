Min
---

Used dyadically, this is the minimum function. The arguments may be of any type except symbol:

    q)3 &amp; til 7
    0 1 2 3 3 3 3
    q)2 3 5 &amp; -1 6 4
    -1 3 4
    q)100 &amp; "cde"
    "cdd"

Note that this is the same as logical [and](Reference/and "wikilink") for boolean arguments:

    q)0011b &amp; 0101b
    0001b

Where
-----

Used monadically, this is the [where](Reference/where "wikilink") function:

    q)(&amp;) 0 1 0 1 1
    1 3 4

See also
--------

-   [and](Reference/and "wikilink")
-   [max/reverse](Reference/Bar "wikilink")
-   [where](Reference/where "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
