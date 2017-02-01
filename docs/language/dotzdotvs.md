.z.vs (value set)
=================

Once `.z.vs` is defined, it is called with two arguments *after* a value is set globally in the root namespace (e.g. a, a.b). The first argument is the symbol of the variable that is being modified and the second is the index. This is not triggered for function local variables, nor globals that are not in the root namespace (e.g. those prefixed with a dot such as .a.b) .

The following example sets `.z.vs` to display the symbol, the index and the value of the variable.

    q).z.vs:{0N!(x;y;value x)}
    q)m:(1 2;3 4)
    (`m;();(1 2;3 4))
    q)m[1;1]:0
    (`m;1 1;(1 2;3 0))

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
