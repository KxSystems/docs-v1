, (join)
========

The join of two data objects a and b is denoted by `a,b`. Any two atoms or lists can be joined (concatenated). For example,

    q)1 2 3,4
    1 2 3 4
    q)1 2,3 4
    1 2 3 4
    q)(0;1 2.5;01b),(`a;"abc")
    (0;1.00 2.50;01b;`a;"abc")

When two simple lists are joined, or an atom and a simple list, the result is a general list unless the types of the two operands are the same. For example,

    q)1 2.4 5,-7.9 10
    1.00 2.40 5.00 -7.90 10.00     / both operands are simple float lists
    q)1 2.4 5,-7.9
    1.00 2.40 5.00 -7.90           / one is a simple float list, the other a float atom
    q)1 2.4 5, -7.9 10e
    (1.00;2.40;5.00;-7.90e;10.00e) / one is float, the other real.

As when replacing items in a simple list, there may be situations in which more latitude is required. For example, if the left argument is a simple short list then a right argument of type int, boolean or byte may also be acceptable.

    q)v:1 2.34 -567.1 20e
    q)v,(type v)$789                / cast an int to a real
    1.00 2.34 -567.1 20.00 789e
    q)v,(type v)$1b                 / cast a boolean to a real
    1.00 2.34 -567.1 20 1e
    q)v,(type v)$0xab
    1.00 2.34 -567.1 20.00 171e

Tables can be joined.

    q)t:([]a:1 2 3;b:`a`b`c)
    q)s:([]a:10 11;b:`d`e)
    q)show t,s
    a  b
    ----
    1  a
    2  b
    3  c
    10 d
    11 e

Tables can be joined sideways, i.e. each record to each record.

    q)r:([]c:10 20 30;d:1.2 3.4 5.6)
    q)show t,'r
    q)show t,'r
    a b c  d
    ----------
    1 a 10 1.2
    2 b 20 3.4
    3 c 30 5.6

Join for key tables is strict; both the key and data columns must match in names and data types.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").

<Category:Joins>
