.z.pw
-----

called AFTER the -u/-U checks, and BEFORE .z.po when opening a new connection to a kdb+ session.

the parameters are the userid (as a symbol) and password (as text) to be verified, the result is a boolean ok/not ok.

as .z.pw is simply a function it can be used to run functions like "..ordinary users can only signon between 0800 and 1800 on weekdays.." or can go out to external resources like an LDAP directory.

if .z.pw returns 0b the task attempting to establish the connection will get an `'access` error

the default definition is `{[user;pswd]1b}`

See also
--------

-   [.z.po](Reference/dotzdotpo "wikilink")
-   [Changes in 2.4](Releases/ChangesIn2.4#.z.pw "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
