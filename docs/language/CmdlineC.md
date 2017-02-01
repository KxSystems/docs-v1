`q` `-c` `maxRows` `maxCols` // set console maxRows and maxCols for output

Syntax
------

    ..$ q -c maxRows maxCols

these settings determine when q elides output with ..

note that you usually don't need to set this, if the environment variables LINES and COLUMNS are found they'll be taken as the default value. See bash documentation for `shopt` parameter `checkwinsize` to make sure they're reset as needed.

Example
-------

    ..$ q -c 10 20

    q)til each 20+til 10
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    0 1 2 3 4 5 6 7 8..
    ..

See also
--------

-   [\\c](Reference/Syscmdc "wikilink")
-   [Gnu Shopt Documentation](http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
