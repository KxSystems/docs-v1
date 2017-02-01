.z.o
====

Return the kdb+ operating system version as a symbol.

    q).z.o
    `w32
    q)

current values are `w32,` `w64,` `l32,` `l64,` `s32,` `s64(Solaris),` `v64(Solaris` `on` `Intel)`

note this is the version of the kdb+ executable, NOT the os itself. You may be running both 32bit and 64bit versions of kdb+ on the same machine to support older external interfaces.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
