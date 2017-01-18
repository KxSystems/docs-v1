Closes a file or process handle.

Example
-------

    q)h:hopen `::5001
    q)h"til 5"
    0 1 2 3 4
    q)hclose h
    q)h"til 5"
    ': Bad file descriptor

See also
--------

-   [hopen](Reference/hopen "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
