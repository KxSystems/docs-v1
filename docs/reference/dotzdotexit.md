.z.exit
-------

When `.z.exit` is defined it is called with the exit parameter as the argument just before exiting the kdb+ session.

the exit parameter is the argument to the [exit](Reference/exit "wikilink") function, or 0 if manual exit with [\\\\ (quit)](Reference/BackSlashBackSlash "wikilink")

`.z.exit` can be unset with `\x` `.z.exit`, which restores the default behavior.

The default behavior is equivalent to setting `.z.exit` to `{}` (i.e. do nothing)

    q).z.exit
    '.z.exit
    q).z.exit:{0N!x}
    q)\\
    0
    os>..

    q).z.exit:{0N!x}
    q)exit 42
    42
    os>..

    q).z.exit:{0N!x}
    q)exit 0
    0
    os>..

if the exit behaviour has an error (disk full for example if exit tries to save the current state) the session is suspended and exits after completion or manual exit from the suspension:

    q).z.exit:{`thiswontwork+x}
    q)\\
    {`thiswontwork+x}
    'type
    +
    `thiswontwork
    0
    q))x
    0

    q))'`up
    'up
    os>..

See also
--------

-   [.z.pc](Reference/dotzdotpc "wikilink")
-   [exit](Reference/exit "wikilink")
-   [\\\\ (quit)](Reference/BackSlashBackSlash "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
