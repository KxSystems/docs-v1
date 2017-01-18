The verb `xrank` allocates items to buckets based on value. If the total number of items is evenly divisible by the number of buckets, then each bucket will have the same number of items; otherwise the first buckets have extra items.

Syntax
------

    q)indices:n xrank values

The left argument is an integer `n`, and the corresponding buckets will be numbered `0` `...` `n-1`.

The right argument is the data to be bucketed, and the result is the corresponding bucket indices.

Example
-------

    q)4 xrank til 8          / equal size buckets
    0 0 1 1 2 2 3 3
    q)4 xrank til 9          / first bucket has extra
    0 0 0 1 1 2 2 3 3
    q)
    q)3 xrank 1 37 5 4 0 3   / outlier 37 does not get its own bucket
    0 2 2 1 0 1
    q)3 xrank 1 7 5 4 0 3    / same as above
    0 2 2 1 0 1

Example using stock data:

    q)show t:flip `val`name!((20?20);(20?(`MSFT`ORCL`CSCO)))
    val name
    --------
    17  MSFT
    1   CSCO
    14  CSCO
    13  ORCL
    13  ORCL
    9   ORCL
    ...

    q)select Min:min val,Max:max val,Count:count i by bucket:4 xrank val from t
    bucket| Min Max Count
    ------| -------------
    0     | 0   7   5
    1     | 9   12  5
    2     | 13  15  5
    3     | 15  17  5

See also
--------

-   [Reference/xprev](Reference/xprev "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
