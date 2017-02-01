The `mdev` verb returns the N-item moving deviation of its numeric right argument, with any nulls after the first element replaced by zero. The first N items of the result are the deviations of the terms so far, and thereafter the result is the moving deviation. The result is floating point.

Syntax
------

    q)r:N mdev L

Example
-------

    q)2 mdev 1 2 3 5 7 10
    0 0.5 0.5 1 1 1.5
    q)5 mdev 1 2 3 5 7 10
    0 0.5 0.8164966 1.47902 2.154066 2.87054
    q)5 mdev 0N 2 0N 5 7 0N    / nulls after the first are replaced by 0
    0n 0 0 1.5 2.054805 2.054805

See also
--------

-   [mavg](Reference/mavg "wikilink")
-   [mcount](Reference/mcount "wikilink")
-   [mmax](Reference/mmax "wikilink")
-   [mmin](Reference/mmin "wikilink")
-   [msum](Reference/msum "wikilink")
-   [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
