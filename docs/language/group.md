Groups the distinct elements of its argument, and returns a dictionary whose keys are the distinct elements, and whose values are the indices where the distinct elements occur. The order of the keys is the order in which they are encountered in the argument.

Syntax
------

    D:group L

Example
-------

    q)group "mississippi"
    m| ,0
    i| 1 4 7 10
    s| 2 3 5 6
    p| 8 9

To count the number of occurrences of each distinct element:

    q)count each group "mississippi"
    m| 1
    i| 4
    s| 4
    p| 2

To get the index of the first occurrence of each distinct element:

    q)first each group "mississippi"
    m| 0
    i| 1
    s| 2
    p| 8

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
