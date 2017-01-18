The `msum` verb returns the N-item moving sum of its numeric right argument, with nulls replaced by zero. The first N items of the result are the sums of the terms so far, and thereafter the result is the moving sum.

Syntax
------

    q)r:N msum L

Example
-------

    q)3 msum 1 2 3 5 7 11
    1 3 6 10 15 23
    q)3 msum 0N 2 3 5 0N 11     / nulls treated as zero
    0 2 5 10 8 16

See also
--------

-   [mavg](Reference/mavg "wikilink")
-   [mcount](Reference/mcount "wikilink")
-   [mdev](Reference/mdev "wikilink")
-   [mmax](Reference/mmax "wikilink")
-   [mmin](Reference/mmin "wikilink")
-   [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
