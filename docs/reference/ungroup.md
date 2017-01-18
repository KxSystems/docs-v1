The `ungroup` function takes an argument of a table, some of whose columns have entries that are lists. For any row, each list must be of the same length. The result is the flattened table, with one row for each item of the lists.

Example
-------

    q)p:((enlist 2);5 7 11;13 17)
    q)r:((enlist"A");"CDE";"FG")
    q)show t:([]s:`a`b`c;p;q:10 20 30;r)
    s p      q  r
    -----------------
    a ,2     10 ,"A"
    b 5 7 11 20 "CDE"
    c 13 17  30 "FG"
    q)ungroup t             / flatten lists p and r
    s p  q  r
    ---------
    a 2  10 A
    b 5  20 C
    b 7  20 D
    b 11 20 E
    c 13 30 F
    c 17 30 G

This function is typically used on the result of `xgroup` or `select`. For example:

    q)\l sp.q
    q)show t:select p,qty by s from sp where qty>200
    s | p            qty
    --| ------------------------
    s1| `p$`p1`p3`p5 300 400 400
    s2| `p$`p1`p2    300 400
    s4| `p$,`p4      ,300
    q)ungroup t
    s  p  qty
    ---------
    s1 p1 300
    s1 p3 400
    s1 p5 400
    s2 p1 300
    s2 p2 400
    s4 p4 300

See also
--------

-   [select](Reference/select "wikilink")
-   [xgroup](Reference/xgroup "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
