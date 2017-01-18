Function `all` returns a boolean atom `1b` if all values in its argument are non-zero, and otherwise `0b`.

It applies to all data types except symbol, first converting the type to boolean if necessary.

Syntax
------

    q)r:all A

Example
-------

    q)all 1 2 3=1 2 4
    q)all 1 2 3=1 2 3
    q)if[all x in y;....]   / use in control structure

Remark
------

`all` is defined as `min` after converting to boolean, i.e. the following are the same:

    q)all x
    q)min "b"$x

See also
--------

-   [any](Reference/any "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
