`q` `-b` block client write access

Syntax
------

    ~/q$ q -b

Example
-------

    ~/q$ q -b
    ..
    q)aa:([]bb:til 4)
    q)\p 5001
    q)

and in another task

    q)h:hopen 5001
    q)h"count aa"
    4
    q)h"aa:10#aa"
    'noupdate
    q)

Use `\_` to check if client write access is blocked:

    ~/q$ q -b
    ..
    q)\_
    1

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
