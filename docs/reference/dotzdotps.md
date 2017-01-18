.z.ps (port set)
----------------

When `.z.ps` is set, it is called with the object that is passed to this kdb+ session via an asynchronous request. The return value is discarded.

`.z.ps` can be unset with `\x` `.z.ps`, which restores the default behavior.

The default behavior is equivalent to setting `.z.ps` to [value](Reference/value "wikilink").

Note that .z.ps is used in preference to .z.pg when messages are sent to the local process using handle 0.

To see for yourself:

    q).z.ps:{[x]0N!(`zps;x);value x}
    q).z.pg:{[x]0N!(`zpg;x);value x}
    q)0 "2+2"
    (`zps;"2+2")
    4

See also
--------

-   [.z.pg](Reference/dotzdotpg "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
