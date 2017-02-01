.z.pc
-----

port close -- called **AFTER** a connection has been closed

as the connection has been closed by the time .z.pc is called there are strictly no remote values that can be put into .z.a, .z.u or .z.w so the local values are returned.

to allow you to cleanup things like tables of users keyed by handle the handle that **WAS** being used is passed as a parameter to .z.pc

    KDB+ 2.3 2007.03.27 Copyright (C) 1993-2007 Kx Systems
    l64/ 8cpu 16026MB simon ...

    q).z.pc
    '.z.pc
    q).z.pc:{0N!(.z.a;.z.u;.z.w;x);x}
    q)\p 2021
    q)(2130706433;`simon;0;4)

    q).z.a
    2130706433
    q).z.u
    `simon
    q).z.w
    0
    q)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
