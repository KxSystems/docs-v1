.z.pg (port get)
----------------

When `.z.pg` is set, it is called with the object that is passed to this kdb+ session via a synchronous request. The return value, if any, is returned to the calling task.

`.z.pg` can be unset with `\x` `.z.pg`, which restores the default behavior.

The default behavior is equivalent to setting `.z.pg` to [value](Reference/value "wikilink") and executes in the root context.

See also
--------

-   [.z.ps](Reference/dotzdotps "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
