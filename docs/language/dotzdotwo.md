.z.wo (websocket open)
----------------------

Since v3.3t 2014.11.26

Called when a websocket connection to a kdb+ session has been initialized, i.e. after it's been validated against any -u/-U file and .z.pw checks.

The right argument is the handle and is typically used to build a dictionary of handles to session information like the value of .z.a, .z.u

See also
--------

-   [.z.wc](Reference/dotzdotpc "wikilink")
-   [.z.po](Reference/dotzdotpo "wikilink")
-   [.z.pc](Reference/dotzdotpc "wikilink")
-   [.z.pw](Reference/dotzdotpw "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
