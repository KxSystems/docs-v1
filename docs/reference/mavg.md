The `mavg` verb returns the N-item moving average of its numeric right argument, with any nulls after the first element replaced by zero. The first N items of the result are the averages of the terms so far, and thereafter the result is the moving average. The result is floating point.

N.B. Infinities (0w) are incompatible with this function.

Syntax
------

    q)r:N mavg L

Example
-------

    q)2 mavg 1 2 3 5 7 10
    1 1.5 2.5 4 6 8.5
    q)5 mavg 1 2 3 5 7 10
    1 1.5 2 2.75 3.6 5.4
    q)5 mavg 0N 2 0N 5 7 0N    / nulls after the first are replaced by 0
    0n 2 2 3.5 4.666667 4.666667

See also
--------

-   [ema](Reference/ema "wikilink")
-   [mcount](Reference/mcount "wikilink")
-   [mdev](Reference/mdev "wikilink")
-   [mmax](Reference/mmax "wikilink")
-   [mmin](Reference/mmin "wikilink")
-   [msum](Reference/msum "wikilink")
-   [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
