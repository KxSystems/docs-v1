.z.Z
====

Returns local time as a datetime scalar

    q).z.Z
    2006.11.13T21:16:14.601

the offset from UTC is fetched from the OS, kdb+ does not have its own time offset database

which avoids problems like [this](http://it.slashdot.org/article.pl?sid=07/02/25/2038217)

See also
--------

[.z.z](Reference/dotzdotz "wikilink") [.z.p](Reference/dotzdotp "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
