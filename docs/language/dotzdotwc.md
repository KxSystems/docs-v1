.z.wc
-----

Since v3.3t 2014.11.26

websocket port close -- called **AFTER** a websocket connection has been closed

as the connection has been closed by the time .z.wc is called there are strictly no remote values that can be put into .z.a, .z.u or .z.w so the local values are returned.

to allow you to cleanup things like tables of users keyed by handle the handle that **WAS** being used is passed as a parameter to .z.wc

See also
--------

-   [.z.wc](Reference/dotzdotpc "wikilink")
-   [.z.po](Reference/dotzdotpc "wikilink")
-   [.z.pc](Reference/dotzdotpc "wikilink")
-   [.z.pw](Reference/dotzdotpw "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
