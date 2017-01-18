\_ (drop/cut)
=============

drop
----

The `drop` primitive is useful for removing elements from the front or end of a list.

    q)5_0 1 2 3 4 5 6 7 8      / drop the first 5 (leaving the last 4)
    5 6 7 8
    q)-5_0 1 2 3 4 5 6 7 8     / drop the last 5 (leaving the first 4)
    0 1 2 3
    q)0 1 2 3 4 5 6 7 8_5      / drop the 5th item (leaving everything else)
    0 1 2 3 4 6 7 8

It can also remove mappings from a dictionary.

    q)1 _ `a`b`c!1 2 3
    b| 2
    c| 3

It can also remove keys from a dictionary. (Note that when dropping a single key, both orders of arguments work; when dropping multiple keys, the key list must be the left argument.)

    q)`a _`a`b`c!1 2 3
    b| 2
    c| 3
    q)(`a`b`c!1 2 3)_`a
    b| 2
    c| 3
    q)`a`b _`a`b`c!1 2 3
    c| 3
    q)(`a`b`c!1 2 3)_`a`b
    'type

    q)d:100 200!`a`b
    q)1 _ d / drop the first entry
    200| b
    q)d _ 1 / drop where key=1
    100| a
    200| b
    q)d _ 100 / drop where key=100
    200| b
    q)enlist[1] _ d / drop where key=1
    100| a
    200| b
    q)enlist[100] _ d / drop where key=100
    200| b
    q)100 _ d / drop first 100 entries

Regarding dicts where the key is an int type - if the lhs is an integer it drops that number of entries, otherwise it drops where the keys match.

It can also remove columns from a table. (Note that in this case, the key list must be the left argument, and must be a vector.)

    q)t:([]a:1 2 3;b:4 5 6;c:`d`e`f)
    q)`a`b _t
    c
    -
    d
    e
    f
    q)t _`a`b
    'type
    q)`a _t
    'type
    q)t _`a
    'type

It can also remove portions of strings.

    q)b:"apple: banana: cherry"
    q)/find the first ":" and remove the prior portion of the sentence.
    q)(b?":") _ b
    ": banana: cherry"

cut
---

`cut` is an extension of drop. It partitions a list into sublists at the specified indices.

    q)0 3 7_0 1 2 3 4 5 6 7 8  / cut at indices 0, 3 and 7
    (0 1 2;3 4 5 6;7 8)
    q)2 3_0 1 2 3 4 5 6 7 8    / cut at indices 2 and 3 (note: the result starts at index 2)
    (,2;3 4 5 6 7 8)

If the number of elements to cut is larger than the list specified, the empty list is returned. Both `drop` and `cut` can be used with tables.

    q)\l sp.q
    q)count sp
    12
    q)count 1_sp
    11
    q)show 10_sp
    s  p  qty
    ---------
    s4 p4 300
    s1 p5 400
    q)show each 2 5 7_sp
    s  p  qty
    ---------
    s1 p3 400
    s1 p4 200
    s4 p5 100
    s  p  qty
    ---------
    s1 p6 100
    s2 p1 300
    s  p  qty
    ---------
    s2 p2 400
    s3 p2 200
    s4 p2 200
    s4 p4 300
    s1 p5 400
    (::;::;::)

See also
--------

-   [\#](Reference/NumberSign "wikilink") (take)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
