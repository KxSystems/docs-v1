The `mmin` verb returns the N-item moving minimum of its numeric right argument, with nulls treated as the minimum value. The first N items of the result are the minimums of the terms so far, and thereafter the result is the moving minimum.

Example
-------

    q)3 mmin 0N -3 -2 1 -0W 0
    0N 0N 0N -3 -0W -0W
    q)3 mmin 0N -3 -2 1 0N -0W    / null is the minimum value
    0N 0N 0N -3 0N 0N

See also
--------

-   [mavg](Reference/mavg "wikilink")
-   [mcount](Reference/mcount "wikilink")
-   [mdev](Reference/mdev "wikilink")
-   [mmax](Reference/mmax "wikilink")
-   [msum](Reference/msum "wikilink")
-   [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
