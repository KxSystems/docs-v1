The `scan` adverb takes a function of two arguments on its left, and creates a new uniform function that applies to successive items of its list argument. The result is a list of the same length.

Syntax
------

    q)r:f scan x

The result is built up as follows:

  
  
r<sub>0</sub> = x<sub>0</sub>

r<sub>i</sub> = f\[r<sub>i-1</sub>;x<sub>i</sub>\] for i &gt; 0

Example
-------

    q){x+2*y} scan 2 3 5 7
    2 8 18 32

The successive function application may be seen with:

    q){enlist x,y} scan 2 3 5 7
    2
    ,2 3
    ,(2 3;5)
    ,((2 3;5);7)

A verb may be used as the left argument, and should be enclosed in parens:

    q)(+) scan 2 3 5 7    / cumulative sums
    2 5 10 17

Remark
------

The adverb `over` works the same way as `scan` but returns only the last result.

See also
--------

-   [adverbs](Reference/Adverb "wikilink")
-   [over](Reference/over "wikilink")

