\[\] (block/arguments)
======================

block
-----

Some expressions, such as the [if-else](Reference/DollarSign "wikilink"), use single expressions as parameters. However, it is possible to use multiple expressions in the place of one by placing several expressions, separated by semicolons, inside \[\] brackets:

    q)$[1b;b:"tr";b,"ue";"false"]   / invalid
    'rank
    q)$[1b;[b:"tr";b,"ue"];"false"]
    "true"

arguments
---------

The arguments of a function can be included within brackets, separated by semicolons. This syntax is sometimes necessary, and always allowed.

    q)$[`int;0xff]      / equivalent to `int$0xff, note order of arguments
    255
    q)+/[1 2 3]         / cannot write +/1 2 3 directly
    6
    q){x+y+z}[1;2;3]
    6
    q)f:+[3;]           / leave out an argument to create a projected function
    q)f 4
    7

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
