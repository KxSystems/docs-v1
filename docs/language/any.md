Function `any` returns a boolean atom `1b` if any value in its argument is non-zero, and otherwise `0b`.

It applies to all data types except symbol, first converting the type to boolean if necessary.

Syntax
------

    q)r:any X

Example
-------

    q)any 1 2 3=10 20 4
    0b
    q)any 1 2 3=1 20 30
    1b
    q)if[any x in y;....]   / use in control structure

Remark
------

`any` is defined as `max` after converting to boolean, i.e. the following are the same:

    q)any x
    q)max "b"$x

See also
--------

-   [all](Reference/all "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
