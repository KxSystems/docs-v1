.z.s (self)
===========

Returns the current function

    q){.z.s}[]
    {.z.s}

Can be used to generate recursive function calls, for example:

    q)fact:{$[x<=0;1;x*.z.s x-1]}
    q)fact[5]
    120

Note that this is purely an example; there are other ways to achieve the same result

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
