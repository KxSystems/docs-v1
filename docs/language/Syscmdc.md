`system"c` `maxRows` `maxCols"` or `\c` `maxRows` `maxCols` // set console maxRows and maxCols for output

Syntax
------

    \c maxRows maxCols

or to display existing values

    \c

these settings determine when q elides output with ..

note that you usually don't need to set this, if the environment variables LINES and COLUMNS are found they'll be taken as the default value. See bash documentation for `shopt` parameter `checkwinsize` to make sure they're reset as needed.

Example
-------

    q)\c
    45 160
    q)\c 5 5
    q)\c
    10 10
    q)til each 20+til 10
    0 1 2 3..
    0 1 2 3..
    0 1 2 3..
    0 1 2 3..
    0 1 2 3..
    0 1 2 3..
    0 1 2 3..
    ..
    q)

See also
--------

-   [-c](Reference/Cmdlinec "wikilink")
-   [Gnu Shopt Documentation](http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
