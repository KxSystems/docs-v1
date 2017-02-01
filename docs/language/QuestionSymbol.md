? (find/rand)
=============

find
----

The dyadic find function takes a list as its first argument and any data object as its second. The result is the lowest index for which the right argument matches an item of the left argument (the so-called "first occurrence"). If there is no match the result is the count of the left argument. Comparisons are exact, and so do not use comparison tolerance. For example:

    q)w:10 -8 3 5 -1 2 3
    q)w?-8
    1
    q)w[1]
    -8
    q)w?3 / the first occurrence of 3
    2
    q)w?17 / not found
    7
    q)w[7]
    0N
    q)"abcde"?"d"
    3

Find is type-specific relative to the left argument. In the case of a simple list left argument, the right argument can also be a list whose atoms are all the same type as the left argument. The result corresponds to the left argument item-by-item. For example,

    q)rt:(10 5 -1;-8;3 17)
    q)i:w?rt
    q)i
    (0 3 4;1;2 7)
    q)w[i]
    (10 5 -1;-8;3 0N)

If the left argument is a list of lists and the right argument is simple list, then items of the left argument are matched with the entire right argument. For example,

    q)u:("abcde";10 2 -6;(2 3;`ab))
    q)u?10 2 -6
    1
    q)u?"abcde"
    0

However, if the right argument is a general list then items of the left argument are matched with items of the right argument. For example,

    q)u?(2 3;`ab)
    3 3

In this case Find matches items of the left argument with `2` `3` and `` `ab `` , not `(2` `` 3;`ab) ``.

? is rank sensitive; x?y can't deal with mixed rank x. If rank x is n then x?y looks for objects of rank n-1. e.g.

    2 3?2 3#til 6  / looks for rank 0 objects
    (0 1 2;4 5)?2 3#til 6 / looks for rank 1 objects

A solution to find `(2` `` 3;`ab) `` is

    q)f:{where x~\:y}
    q)f[u;(2 3;`ab)]
    ,2

If the left argument is a table then right argument must be a compatible record (dictionary or list) or table. That is, each column of the left argument, paired with the corresponding item of the right argument, must be valid arguments of Find. For example,

    q)\l sp.q
    q)sp?(`s1;`p4;200)
    3
    q)sp?`s`p`qty!(`s2;`p5;450)
    12

rand
----

rand produces random sequences of ints and floats. For example, the expression `20?5` produces an int vector of length 20 whose items are random ints between 0 and 4, as follows

    q)20?5
    4 3 3 4 1 2 2 0 1 3 1 4 0 2 2 1 4 4 2 4

If the right argument is a float, say 4.5, then the result is a simple float list whose items are random floats between 0.0 and 4.5. For example,

    q)10?4.5
    3.13239 1.699364 2.898484 1.334554 3.085937 2.437705 2.540967 3.445748 1.838425 0.6240313

If the right argument is a list, then values will be selected at random from that list. For example,

    q)10?`Arthur`Steve`Dennis
    `Arthur`Arthur`Steve`Dennis`Arthur`Arthur`Arthur`Dennis`Arthur`Dennis

If the left hand argument is negative, the random values generated are unique, **on condition that the right hand argument is a vector of unique values, or a scalar default int type**. The left hand argument must have a smaller or equal magnitude than the length of the right hand argument. For example,

    q)-20?20
    10 18 4 6 0 5 1 11 3 16 13 17 15 14 19 8 9 2 7 12
    q)-3?`Arthur`Steve`Dennis
    `Steve`Arthur`Dennis
    q)-4?`Arthur`Steve`Dennis
    'length

There is a shorthand special case for generating short symbols (length between 1 and 8).

    q)10?`3
    `bon`dec`nei`jem`pgm`kei`lpn`bjh`flj`npo

Please note that rand function uses a constant seed on q invocation. You can see and change the value of the seed by using system command ["\\S"](Reference/SystemCommands#.5CS_.5Bn.5D_-_random_seed "wikilink").

`?` deals out [GUIDs](Reference/Datatypes#Guid_(from_kdb.v3.0) "wikilink"):

`q)-1?0Ng`
`,fd2db048-decb-0008-0176-01714e5eeced`

To use GUIDs as identifiers, give a negative left hand side. If you use a positive value, you will get duplicates, given the same seed:

`$ q`
`q)1?0Ng`
`,8c6b8b64-6815-6084-0a3e-178401251b68`
`q)\\`
`$ q `
`q)1?0Ng`
`,8c6b8b64-6815-6084-0a3e-178401251b68`

vector conditional
------------------

Triadic question forms a new list by replacing elements of y with the elements of z when x is false. X must be a boolean list, Y and Z must be of the same type and all lists must have the same count. All arguments -- x, y, and z -- are evaluated.

    q)?[11001b;1 2 3 4 5;10 20 30 40 50]
    1 2 30 40 5

If y or z are atomic, they repeated.

    q)?[11001b;1;10 20 30 40 50]
    1 1 30 40 1
    q)?[11001b;1 2 3 4 5;99]
    1 2 99 99 5

NB: In kdb+ 2.4t 2006.10.30 there is a bug that allows y and z to be non-conforming. This is broken behavior and will be fixed in a future release. Since kdb+2.7 2010.10.07, ?\[x;y;z\] works for atoms too.

It can be useful to have more than just a true/false selection, e.g. match1/match2/match3/others mapping to result1/result2/result3/default. This can be achieved with find, e.g.

    q)input:10?`m1`m2`m3`other`yetanother
    q)input
    `yetanother`m1`m3`m2`m3`m2`m3`other`m3`yetanother
    q)`r1`r2`r3`default `m1`m2`m3?input
    `default`r1`r3`r2`r3`r2`r3`default`r3`default

This avoids nesting vector conditional and hence scales better.

`` `:sym? ``
------------

using `` `:sym? `` tells kdb+ to base sym on the file `` `:sym `` - so you can share it and simultaneously update with other tasks. After using the ? operator, the file that is updated will be reloaded into the workspace as the variable based on the filename.

functional select & exec
------------------------

See [Functional select](JB:QforMortals2/queries_q_sql#Functional_select "wikilink") and [Functional exec](JB:QforMortals2/queries_q_sql#Functional_exec "wikilink").

three-argument functional exec
------------------------------

`?[t;i;x]`, where `t` is a (non-partitioned) table, `i` is a list of indices, and `x` is a [parse tree](Reference/parse_tree "wikilink"), is another form of [exec](Reference/exec "wikilink"):

    q)t:([]a:1 2 3;b:4 5 6;c:7 9 0)
    q)t
    a b c
    -----
    1 4 7
    2 5 9
    3 6 0
    q)?[t;0 1 2;`a]
    1 2 3
    q)?[t;0 1 2;`b]
    4 5 6
    q)?[t;0 1 2;(last;`a)]
    3
    q)?[t;0 1;(last;`a)]
    2
    q)?[t;0 1 2;(plist;`a;`b)]
    1 2 3
    4 5 6
    q)?[t;0 1 2;(*;(min;`a);(avg;`c))]
    5.333333

See also
--------

-   [enum](Reference/DollarSign#enum "wikilink")
-   [rand](Reference/rand "wikilink")
-   [q-ist: functional Query Functions](http://www.q-ist.com/2012/10/functional-query-functions.html)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
