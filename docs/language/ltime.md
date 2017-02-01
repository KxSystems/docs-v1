The `ltime` function returns the local datetime/timestamp for a given UTC datetime/timestamp. Recall that the UTC and local datetime/timestamps are available as `.z.z`/`.z.p` and `.z.Z`/`.z.P` respectively.

Example
-------

    q).z.P
    2009.11.05D15:21:10.040666000
    q)ltime .z.p                  / same timezone as .z.P
    2009.11.05D15:21:10.043235000

See also
--------

-   [gtime](Reference/gtime "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
