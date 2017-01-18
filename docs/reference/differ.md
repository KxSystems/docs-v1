The uniform function `differ` returns a boolean list indicating whether consecutive pairs differ. It applies to all data types.

Syntax
------

    q)r:differ A

The first item of the result is always `1b`:

    r[i]=1b                 for i=0
    r[i]=not A[i]~A[i-1]    otherwise

Example
-------

    q)differ`IBM`IBM`MSFT`CSCO`CSCO
    10110b
    q)differ 1 3 3 4 5 6 6
    1101110b

For example, split a table with multiple dates into a list of tables with distinct dates:

    q)d:2009.10.01+asc 100?30
    q)s:100?`IBM`MSFT`CSCO
    q)t:([]date:d;sym:s;price:100?100f;size:100?1000)
    q)i:where differ t[`date]    / indices where dates differ
    q)tlist:i _ t                / list of tables with one date per table
    q)tlist 0
    date       sym  price    size
    -----------------------------
    2009.10.01 IBM  37.95179 710
    2009.10.01 CSCO 52.908   594
    2009.10.01 MSFT 32.87258 250
    2009.10.01 CSCO 75.15704 592
    q)tlist 1
    date       sym  price   size
    ----------------------------
    2009.10.02 MSFT 18.9035 26
    2009.10.02 CSCO 12.7531 760

See also
--------

-   [deltas](Reference/deltas "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
