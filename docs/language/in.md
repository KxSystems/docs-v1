For simple lists or general list of atoms, the verb `in` returns a boolean indicating which items of `x` are in `y`. The result has one item for each item of `x`.

For general lists where the first element is a list, the verb `in` returns a boolean atom indicating whether `x` matches any element of `y`.

Syntax
------

    q)r:x in y

Example
-------

`y` is a simple list

    q)1 3 7 6 4 in 5 4 1 6
    10011b

`y` is a general list with the first element being an atom

    q)1 2 in (9;(1 2;3 4))
    00b

`y` is a general list with the first element being a list:

    q)1 2 in (1 2;9)
    1b
    q)1 2 in ((1 2;3 4);9)
    0b
    q)(1 2;3 4) in ((1 2;3 4);9)
    1b

`in` is often used with select:

    q)\l sp.q
    q)select from p where city in `paris`rome
    p | name  color weight city
    --| ------------------------
    p2| bolt  green 17     paris
    p3| screw blue  17     rome
    p5| cam   blue  12     paris

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
