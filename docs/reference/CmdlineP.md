`q` `-P` `10` set print precision

Syntax
------

    ..$ q -P N

where N is the DISPLAY precision for floats and reals. The default value is 7.

note that this is used when exporting to CSV files

Example
-------

    ..$ q -P 3
    KDB+ 2.6 2010.01.18 Copyright (C) 1993-2010 Kx Systems
    q)1%3
    0.333
    q)\\

    ..$ q -P 10
    KDB+ 2.6 2010.01.18 Copyright (C) 1993-2010 Kx Systems
    q)1%3
    0.3333333333
    q)\\

See also
--------

-   [\\P](Reference/SyscmdP "wikilink")
-   [What Every Computer Scientist Should Know About Floating-Point Arithmetic](http://docs.sun.com/source/806-3568/ncg_goldberg.html)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
