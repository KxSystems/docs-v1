The `mcount` verb returns the N-item moving count of the non-null items of its numeric right argument. The first N items of the result are the counts so far, and thereafter the result is the moving count.

Syntax
------

    q)r:N mcount L

Example
-------

    q)3 mcount 0 1 2 3 4 5
    1 2 3 3 3 3
    q)3 mcount 0N 1 2 3 0N 5
    0 1 2 3 2 2

See also
--------

-   [mavg](Reference/mavg "wikilink")
-   [mdev](Reference/mdev "wikilink")
-   [mmax](Reference/mmax "wikilink")
-   [mmin](Reference/mmin "wikilink")
-   [msum](Reference/msum "wikilink")
-   [sliding window](Cookbook/ProgrammingIdioms#How_do_I_apply_a_function_to_a_sequence_sliding_window.3F "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
