~ (match)
=========

It often happens that you want to compare two results to determine whether or not they are identical. This is often done in this manual simply by looking at them, but that doesn't always work, e.g. when the console display doesn't contain all the details. Sometimes = (equal) can be used, but not always. The primitive function called Match is the function to use.

    q)(1 2 3+4 5 6)~4 5 6+1 2 3   / the arguments are identical
    1b
    q)(1 2 3-4 5 6)~4 5 6-1 2 3   / these are not identical
    0b
    q)1 2 3 ~`a`b                 / any two data objects can be compared
    0b

Comparison tolerance is used when matching floats.

Match depends on the data type of the arguments, not just the values.

    q)1~1h
    0b
    q)3~3.0
    0b

Note that this means that the same symbols from different enumerations do not match, even when equal:

    q)l1:`a`b`c
    q)l2:`a`b`c
    q)(`l1$`a)~`l2$`a
    0b
    q)(`l1$`a)=`l2$`a
    1b

Match ignores attributes on lists/vectors:

    q)1 2 3~`s#1 2 3
    1b

Thus two tables match even if they differ in attributes:

    q)t1:([]x:1 2 3)
    q)t2:([]x:`s#1 2 3)
    q)meta t1
    c| t f a
    -| -----
    x| i
    q)meta t2
    c| t f a
    -| -----
    x| i   s
    q)t1~t2
    1b

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
