Returns the value of the given environment variable.

Syntax
------

    q)r:getenv X

Example
-------

    q)getenv `SHELL
    "/bin/bash"
    q)getenv `UNKNOWN      / returns empty if variable not defined
    ""

See also
--------

-   [setenv](Reference/setenv "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
