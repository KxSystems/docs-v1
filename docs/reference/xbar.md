The `xbar` verb rounds its right argument down to the nearest multiple of the integer left argument. The right argument can be any numeric or temporal type.

Example
-------

    q)3 xbar til 16
    0 0 0 3 3 3 6 6 6 9 9 9 12 12 12 15
    q)5 xbar 11:00 + 0 2 3 5 7 11 13
    11:00 11:00 11:00 11:05 11:05 11:10 11:10

Interval bars are useful in aggregation queries. For example, to get last price and total size in 10 minute bars:

    q)select last price, sum size by 10 xbar time.minute from trade where sym=`IBM
    minute| price size
    ------| -----------
    09:30 | 55.32 90094
    09:40 | 54.99 48726
    09:50 | 54.93 36511
    10:00 | 55.23 35768
    ...

To group symbols by closing price:

    q)select sym by 5 xbar close from daily where date=last date
    close| sym
    -----| ----------------------
    25   | `sym$`AIG`DOW`GOOG`PEP,...
    30   | `sym$,`AAPL,...
    45   | `sym$`HPQ`ORCL,...
    ...

If you would like to group according to irregular intervals, one solution is to use bin, e.g.

    q)x:`s#10:00+00:00 00:08 00:13 00:27 00:30 00:36 00:39 00:50
    q)select count i by x x bin time.minute from ([]time:`s#10:00:00+asc 100?3600)
    minute| x 
    ------| --
    10:00 | 8 
    10:08 | 13
    10:13 | 24
    10:27 | 4 
    10:30 | 9 
    10:36 | 3 
    10:39 | 19
    10:50 | 20

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
