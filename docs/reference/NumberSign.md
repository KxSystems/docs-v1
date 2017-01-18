\# (take)
=========

The dyadic take function creates lists. The left argument specifies the count and shape and the right argument provides the data.

It is useful for selecting from the front or end of a list.

    q)5#0 1 2 3 4 5 6 7 8      / take the first 5 items
    0 1 2 3 4
    q)-5#0 1 2 3 4 5 6 7 8     / take the last 5 elements
    4 5 6 7 8

If the number of elements to take is longer than the list specified, it acts as if the list was circular.

    q)5#`Arthur`Steve`Dennis
    `Arthur`Steve`Dennis`Arthur`Steve
    q)-5#`Arthur`Steve`Dennis
    `Steve`Dennis`Arthur`Steve`Dennis

If the second argument is a scalar it will be converted into a list of the length given by the first argument:

    q)3#9
    9 9 9
    q)2#`a
    `a`a
    q)2 5#"!"
    "!!!!!"
    "!!!!!"

If the number of elements to take is 0, an empty list is returned.

    q)trade:([]time:();sym:();price:();size:())          / columns can hold anything
    q)trade
    +`time`sym`price`size!(();();();())
    q)trade:([]time:0#0Nt;sym:0#`;price:0#0n;size:0#0N)  / idiomatic way to initialise columns to appropriate types
    q)trade
    +`time`sym`price`size!(`time$();`symbol$();`float$();`int$())

Reshape: A list of length 2 specifies the "shape" of the resulting two dimensional matrix (KDB+ 2.3 and above).

    q)2 3#til 6
    (0 1 2;3 4 5)
    q)2 4#`Arthur`Steve`Dennis   / generate a 2*4 matrix taken (with "wrap around") from the list `Arthur`Steve`Dennis
    (`Arthur`Steve`Dennis`Arthur;`Steve`Dennis`Arthur`Steve)

From kdb+v3.4, if the lhs is a list of length 1, it reshapes to a single dimension. e.g.

`q)enlist[2]#til 10`
`0 1`

From kdb+3.4, reshape can accept a lhs of &gt;2 dimensions, with the condition lhs must not contain nulls. e.g.

`q)(2 2 3#til 5)~((0 1 2;3 4 0);(1 2 3;4 0 1))`
`q)(enlist("";""))~1 2 0#"a"`
`` q)all`domain=@[;1 2;{`$x}]each(#)@'(1 0 2;2 3 0N;0N 2 1;-1 2 3) ``

Using a null integer for either part of the "shape" will cause that dimension to be maximal:

`q)0N 3#til 10`
`(0 1 2;3 4 5;6 7 8;,9)`

Reshape behavior for (x;0N)\#y changed in v3.3, as below

Prior to v3.3

    q)3 0N # til 10
    (0 1 2 3;4 5 6 7;8 9)
    q)(10 0N)#(),10
    10
    q)4 0N#til 9
    0 1 2
    3 4 5
    6 7 8

kdb+v3.3 onwards:

    q)3 0N#til 10
    (0 1 2;3 4 5;6 7 8 9)
    q)2 0N#0#0
    (`long$();`long$())
    q)(10 0N)#(),10
    (`long$();`long$();`long$();`long$();`long$();`long$();`long$();`long$();`long$();,10)
    q)4 0N#til 9
    0 1
    2 3
    4 5
    6 7 8

Take also applies to tables: as a number of rows;

    q)\l sp.q
    q)5#sp
    +`s`p`qty!(`s$`s1`s1`s1`s1`s4;`p$`p1`p2`p3`p4`p5;300 200 400 200 100)

or as a number of columns;

    q)`p`qty#sp
    +`p`qty!(`p$`p1`p2`p3`p4`p5;300 200 400 200 100)
    q)columns:`p`qty
    q)columns#sp
    +`p`qty!(`p$`p1`p2`p3`p4`p5;300 200 400 200 100)

If the first argument is a table, take returns the matching rows, together with the respective keys. This is similar to retrieving multiple records through the square brackets syntax, except take also returns the keys. See <JB:QforMortals2/tables#Retrieving_Multiple_Records>

    q)([]s:`s1`s2)#s
    s | name  status city  
    --| -------------------
    s1| smith 20     london
    s2| jones 10     paris 

Take also applies to dictionaries: as a number of mappings;

    q)d:`a`b`c!1 2 3
    q)2#d
    a| 1
    b| 2

or as a subset of columns;

    q)`a`b#d
    a| 1
    b| 2

set/unset an attribute
----------------------

    q)`s#1 2 3
    `s#1 2 3
    q)`#`s#1 2 3
    1 2 3

Setting/unsetting an attribute other than s, i.e. upg, causes a copy of the object to be made. Setting/unsetting the s attribute on a list which is already sorted will not cause a copy to be made, and hence will affect the original list in-place. Setting the s attr on a dictionary or table, where the key is already in sorted order, in order to obtain a step-function, causes the s attribute to be set in-place for the key but copies the outer object. e.g.

    q)t:([1 2 4]y:7 8 9);`s#t;attr each (t;key t)
    ``s

See also
--------

-   [\_](Reference/Underscore "wikilink") (drop/cut)
-   [asc](Reference/asc "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
