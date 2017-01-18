The `mmax` verb returns the N-item moving maximum of its numeric right argument, with nulls after the first replaced by the preceding maximum. The first N items of the result are the maximums of the terms so far, and thereafter the result is the moving maximum.

Example
-------

    q)3 mmax 2 7 1 3 5 2 8
    2 7 7 7 5 5 8
    q)3 mmax 0N -3 -2 0N 1 0  / initial null returns negative infinity
    -0W -3 -2 -2 1 1          / remaining nulls replaced by preceding max

See also
--------

-   [mavg](Reference/mavg "wikilink")
-   [mcount](Reference/mcount "wikilink")
-   [mdev](Reference/mdev "wikilink")
-   [mmin](Reference/mmin "wikilink")
-   [msum](Reference/msum "wikilink")
-   [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
