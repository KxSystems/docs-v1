The `ema` verb returns the exponentially weighted moving average (EWMA), also known as exponential moving average (EMA) of its right argument, with its left argument as the smoothing parameter.

Syntax
------

    q)r:d ema L

Example
-------

Compute an impulse response with decay of 1%3:

    q)ema[1%3;1,10#0]
    1 0.6666667 0.4444444 0.2962963 0.1975309 0.1316872 0.0877915 0.05852766 0.03901844 0.02601229 0.01734153

Compute 10-day EMA on price, as in <http://stockcharts.com/school/doku.php?id=chart_school:technical_indicators:moving_averages> (smoothing parameter for EMA over N points is defined as `2%1+N`):

    q)p:22.27 22.19 22.08 22.17 22.18 22.13 22.23 22.43 22.24 22.29 22.15 22.39 22.38 22.61 23.36 24.05 23.75 23.83 23.95 23.63 23.82 23.87 23.65 23.19 23.1 23.33 22.68 23.1 22.4 22.17
    q)(2%1+10)ema p
    22.27 22.25545 22.22355 22.21382 22.20767 22.19355 22.20017 22.24196 22.2416 22.2504 22.23215 22.26085 22.28251 22.34206 22.52714 22.80402 22.97602 23.13129 23.28014 23.34375 23.43034 23.51028 23.53568 23.47283 23.40505 23.3914 23.26206 23.23259 23.08121 22.91554

See also
--------

-   [mavg](Reference/mavg "wikilink")
-   [wavg](Reference/wavg "wikilink")

