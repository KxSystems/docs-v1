The `reval` function is similar to eval (-6!), and behaves as if the cmd line option -b were active for the duration of the reval call.

Example
-------

An example usage is inside the message handler .z.pg, useful for access control, here blocking sync messages from updating -

    q).z.pg:{reval(value;x)} / define in process listening on port 5000
    q)h:hopen 5000 / from another process on same host
    q)h"a:4"
    'noupdate: `. `a

Partitioned databases
---------------------

Note that for partitioned databases, kdb+ caches the count for a table, and this count cannot be updated from within a reval expression or from a slave thread. Thus to avoid 'noupdate on queries on partitioned tables you should put 'count table' in your startup script.

See also
--------

-   [eval](Reference/eval "wikilink")
-   [parse](Reference/parse "wikilink")
-   [parse tree](Reference/parse_tree "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
