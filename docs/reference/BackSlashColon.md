\\: (each left)
===============

Apply the diadic function f between y and each of the elements of x in turn

Syntax
------

    x f\: y

    f is a diadic function, x is a list, y is an atom or list

Example
-------

    (til 5),\:1
    (0 1;1 1;2 1;3 1;4 1)

    (3 5 4 1 2) {x*y}\:5
    15 25 20 5 10

Combined with each right

    (til 4),\:/: til 4
    ((0 0;1 0;2 0;3 0);(0 1;1 1;2 1;3 1);(0 2;1 2;2 2;3 2);(0 3;1 3;2 3;3 3))

This is similar to the result obtained by cross

    cross[til 4;til 4]
    (0 0;0 1;0 2;0 3;1 0;1 1;1 2;1 3;2 0;2 1;2 2;2 3;3 0;3 1;3 2;3 3)

See also
--------

-   [each-right](Reference/SlashColon#.2F:_.28each_right.29 "wikilink")

Integer to Byte Vector
======================

`0x0\:1234605616436508552`

returns:

`0x1122334455667788`
