fby is designed to collapse a cascaded *select ... from select ... by ... from t* expressions into one *select ... by ... from ... where ... fby ....*. Think of fby when you find yourself trying to apply a filter to the aggregated column of a table produced by *select ... by ...*.

Syntax
------

    q)(aggr;data) fby group

`fby` takes three arguments, a function and two vectors which must be of equal length. The function passed in must take a list argument and return an atomic value as its result (aggregation function). `fby` is defined as a infix operator that requires a two-element list on the left and a vector on the right (group by vector). The first element of the list on the left is the aggregation function, the second is the data vector.

    q)dat: 0 1 2 3 4 5 6 7 8 9
    q)grp:`a`b`a`b`c`d`c`d`d`a
    q)(sum;dat) fby grp

When invoked, `fby` will collect the elements of the data vector into sub lists as given by the distinct elements of the group vector:

    0 2 9  (`a)
    1 3    (`b)
    4 6    (`c)
    5 7 8  (`d)

To each sublist of `dat` it applies the aggregation function:

    sum 0 2 9 -> 11
    sum 1 3   -> 4
    sum 4 6   -> 10
    sum 5 7 8 -> 20

As a last step, the results of the aggregation function are 'unrolled' to create a list of the same length as the vectors that were passed into `fby`. The unrolled vector is created by replacing each element in the group-by vector with the result of applying the aggregation function to the corresponding elements in the data vector, giving the result returned by `fby`:

    q)(sum;dat) fby grp
    11 4 11 4 10 20 10 20 20 11
    q)(sum each dat group grp)grp / w/o fby
    11 4 11 4 10 20 10 20 20 11

When used in a select, usually a comparison function is applied to the results of `fby`:

    q)select from t where 10 < (sum;d) fby a

Examples
--------

    q)dat:2 5 4 1 7             / data
    q)grp:"abbac"               / group by
    q)(sum;dat) fby grp         / apply sum to the groups
    3 9 9 3 7
    q)(first;dat) fby grp       / apply first to the groups
    2 5 5 2 7

The following examples show `fby` used in select statements:

    q)\l sp.q
    q)show sp                                       / for reference
    s  p  qty
    ---------
    s1 p1 300
    s1 p2 200
    s1 p3 400
    s1 p4 200
    s4 p5 100
    s1 p6 100
    s2 p1 300
    s2 p2 400
    s3 p2 200
    s4 p2 200
    s4 p4 300
    s1 p5 400

sales where quantity &gt; average quantity by part:

    q)select from sp where qty > (avg;qty) fby p
    s  p  qty
    ---------
    s2 p2 400
    s4 p4 300
    s1 p5 400

sales where quantity = maximum quantity by part:

    q)select from sp where qty = (max;qty) fby p
    s  p  qty
    ---------
    s1 p1 300
    s1 p3 400
    s1 p6 100
    s2 p1 300
    s2 p2 400
    s4 p4 300
    s1 p5 400

Notes
-----

On older versions of kdb+ (2.6 and below), fby's behaviour is undefined if the aggregation function returns a list; it usually throws an exception from the k definition of fby. However, if the concatenation of all list results from the aggregation function results (raze) has the same length as the original vectors, a list of some form is returned, but the order of its elements is not clearly defined.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
