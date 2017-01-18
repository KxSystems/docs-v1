The verb `inter` returns all elements common to both arguments. When applied to dictionaries, it returns any common values (not keys); and when applied to tables, returns the common rows.

The verb uses the result of `x` `in` `y` to select items from `x`.

Syntax
------

    q)R:X inter Y

Example
-------

    q)1 3 4 2 inter 2 3 5 7 11
    3 2

`inter` on dictionaries returns common values:

    q)show x:(`a`b)!(1 2 3;`x`y`z)
    a| 1 2 3
    b| x y z
    q)show y:(`a`b`c)!(1 2 3;2 3 5;`x`y`z)
    a| 1 2 3
    b| 2 3 5
    c| x y z
    q)
    q)x inter y
    1 2 3
    x y z
    q)

`inter` on tables returns common rows. The tables may not be keyed:

    q)show x:([]a:`x`y`z`t;b:10 20 30 40)
    a b
    ----
    x 10
    y 20
    z 30
    t 40
    q)show y:([]a:`y`t`x;b:50 40 10)
    a b
    ----
    y 50
    t 40
    x 10
    q)x inter y
    a b
    ----
    x 10
    t 40

See also
--------

-   [except](Reference/except "wikilink")
-   [in](Reference/in "wikilink")
-   [union](Reference/union "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
