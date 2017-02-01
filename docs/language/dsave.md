The `dsave` function saves **global** tables to disk as splayed, enumerated, indexed kdb+ tables. It is available since Kdb+ v3.2 2014.05.07.

The left argument is the save path as a symbol or symbol vector, the right argument is a list of table names, and the result is the list of table names. The first column of each table saved has the `` `p `` attribute applied to it. If the path is a vector, the first element is the hdb root (where the sym file, if any, will be stored), while the remaining elements are a path within the hdb (e.g. a partition).

`dsave` provides roughly the same functionality as the combination of [`.Q.en`](Cookbook/SplayedTables#Enumerating_varchar_columns_in_a_table "wikilink") and [`set`](Reference/set "wikilink") or [`.Q.dpft`](DotQ/DotQDotdpft "wikilink"), but in a simpler form.

Example 1
---------

    q)t:flip`sym`price`size!100?'(-10?`3;1.0;10)
    q)q:flip`sym`bid`ask`bsize`asize!900?'(distinct t`sym;1.0;1.0;10;10)
    q)meta t
    c    | t f a
    -----| -----
    sym  | s    
    price| f    
    size | j    
    q)meta q    
    c    | t f a
    -----| -----
    sym  | s    
    bid  | f    
    ask  | f    
    bsize| j    
    asize| j    
    q)type each flip t
    sym  | 11
    price| 9
    size | 7
    q)type each flip q
    sym  | 11
    bid  | 9
    ask  | 9
    bsize| 7
    asize| 7
    q)`:/tmp/db1 dsave`sym xasc'`t`q
    `t`q
    q)\l /tmp/db1
    q)meta t
    c    | t f a
    -----| -----
    sym  | s   p
    price| f    
    size | j    
    q)meta q
    c    | t f a
    -----| -----
    sym  | s   p
    bid  | f    
    ask  | f    
    bsize| j    
    asize| j    
    q)type each flip t
    sym  | 20
    price| 9
    size | 7
    q)type each flip q
    sym  | 20
    bid  | 9
    ask  | 9
    bsize| 7
    asize| 7
    q)

Example 2
---------

In this example, the left argument is a vector, where the second element is a partition name.

    q)t:flip`sym`price`size!100?'(-10?`3;1.0;10)
    q)q:flip`sym`bid`ask`bsize`asize!900?'(distinct t`sym;1.0;1.0;10;10)
    q)meta t
    c    | t f a
    -----| -----
    sym  | s    
    price| f    
    size | j    
    q)meta q
    c    | t f a
    -----| -----
    sym  | s    
    bid  | f    
    ask  | f    
    bsize| j    
    asize| j    
    q)type each flip t
    sym  | 11
    price| 9
    size | 7
    q)type each flip q
    sym  | 11
    bid  | 9
    ask  | 9
    bsize| 7
    asize| 7
    q)`:/tmp/db2`2015.01.01 dsave`sym xasc'`t`q
    `t`q
    q)\l /tmp/db2
    q)meta t
    c    | t f a
    -----| -----
    date | d    
    sym  | s   p
    price| f    
    size | j    
    q)meta q
    c    | t f a
    -----| -----
    date | d    
    sym  | s   p
    bid  | f    
    ask  | f    
    bsize| j    
    asize| j    
    q)

See also
--------

-   [set](Reference/set "wikilink")
-   [.Q.en](Cookbook/SplayedTables#Enumerating_varchar_columns_in_a_table "wikilink")
-   [.Q.dpft](DotQ/DotQDotdpft "wikilink")
-   [.Q.hdpf](DotQ/DotQDotdpft "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
