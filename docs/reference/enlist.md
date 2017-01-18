`enlist` returns its arguments in a list. Where the argument is a dictionary, the result is the corresponding table.

Q distinguishes an atom from a one-element list. `enlist` and `first` will convert between the two.

Syntax
------

    L:enlist A

Example
-------

    q)a:10
    q)b:enlist a
    q)c:enlist b
    q)type each (a;b;c)
    -6 6 0h
    q)a~b
    0b
    q)a~first b
    1b
    q)b~c
    0b
    q)b~first c
    1b

With several arguments:

    q)show a:enlist[til 5;`ibm`goog;"hello"]
    0 1 2 3 4
    `ibm`goog
    "hello"
    q)count a
    3

Create a table from a dictionary:

    q)enlist `a`b`c!1 3 4
    a b c
    -----
    1 3 4

See also
--------

-   [plist](Reference/plist "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
