The `gtime` function returns the UTC datetime/timestamp for a given datetime/timestamp. Recall that the UTC and local datetime/timestamps are available as `.z.z`/`.z.p` and `.z.Z`/`.z.P` respectively.

Example
-------

    q).z.p
    2009.10.20D10:52:17.782138000
    q)gtime .z.P                      / same timezone as .z.p
    2009.10.20D10:52:17.783660000

See also
--------

-   [ltime](Reference/ltime "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
