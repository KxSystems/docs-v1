Maximum sizes can be set for the q console and the http console, either in the command line or with session commands.

q console
=========

Set using the `-c` command line parameter, or `/c` session command:

    ~/q$ q -c maxRows maxCols            / start with given size
    ..
    \c maxRows maxCols                   / set size in q session

These settings determine when q elides output with ..

If the environment variables LINES and COLUMNS are defined, they are used as default values. See bash documentation for the `shopt` parameter `checkwinsize` to make sure they are reset as needed.

Otherwise, the usual defaults are 25 x 80. Values are coerced to the range \[10,2000\].

Example
-------

    ~/q$ q -c 0 20
    ..
    q)\c
    10 20                     / height is set to minimum of 10

    q)til each 20+til 10      / output is truncated
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    ..

http console
============

Set using the `-C` command line parameter, or `/C` session command:

    ~/q$ q -C maxRows maxCols            / start with given size
    ..
    \C maxRows maxCols                   / set size in q session

The defaults are 36 x 2000, and values are coerced to the range \[10,2000\].

See also
--------

-   [Gnu Shopt Documentation](http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
