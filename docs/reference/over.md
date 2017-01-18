The `over` adverb takes a function of two arguments on its left, and creates a new atomic function that applies to successive items of its list argument. The result is the result of the last application of the function.

Syntax
------

    q)r:f over x

The result is built up by applying f successively as follows:

  
  
r = x<sub>0</sub>

r = f\[r;x<sub>i</sub>\] for i = 1 ... n

Example
-------

    q){x+2*y} over 2 3 5 7
    32

The successive results may be seen with `scan`. This works the same way as `over` but returns all the intermediate results:

    q){x+2*y} scan 2 3 5 7
    2 8 18 32

A verb may be used as the left argument, and should be enclosed in parens:

    q)(+) over 2 3 5 7    / sum
    17

Remark
------

See also
--------

-   [adverbs](Reference/Adverb "wikilink")
-   [scan](Reference/scan "wikilink")

