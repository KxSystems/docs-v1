/: (each right)
===============

Apply the diadic function f between x and each of the elements of y in turn

Syntax
------

    x f/: y

    f is a diadic function, x is an atom or list, y is a list

Example
-------

    1,/:til 5
    (1 0;1 1;1 2;1 3;1 4)

    5 {x*y}/:3 5 4 1 2
    15 25 20 5 10

See also
--------

-   [each-left](Reference/BackSlashColon#.5C:_.28each_left.29 "wikilink")

