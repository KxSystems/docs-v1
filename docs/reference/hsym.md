Converts its symbol argument into a file name, or valid hostname, ipaddress. Can handle vector of symbols since kdb+ 3.1.

Example
-------

    q)hsym`c:/q/test.txt
    `:c:/q/test.txt
    q)hsym`10.43.23.197
    `:10.43.23.197

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
