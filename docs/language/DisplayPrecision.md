Display precision can be set with the `-P` command line parameter, or the `\P` system command.

Syntax
------

    ~/q$ q -P N
    ..
    \P N

where N is the *display* precision for floats and reals, i.e. N is the number of significant digits shown in output.

The default value is 7 and possible values are in the range \[0,17\]. A precision of 0 means use maximum precision.

This setting only affects the output display - not calculations - and only the display of floating point numbers, see references below.

Note that this is used when exporting to CSV files.

Example
-------

    ~/q$ q
    ..
    q)\P                       / default
    7
    q)reciprocal 7             / 7 digits shown
    0.1428571
    q)123456789                / integers shown in full
    123456789
    q)123456789f               / floats shown to 7 significant digits
    1.234568e+08

    ~/q$ q -P 10              / set on command line
    ..
    q)a:reciprocal 7
    q)a
    0.1428571429              / 10 digits shown
    q)\P 17
    q)a
    0.14285714285714285       / 17 digits shown
    q)\P 0
    q)a
    0.14285714285714285       / same as \P 17

Use `.Q.fmt` to format numbers to given width and precision, for example:

    q).Q.fmt[8;6]a            / format to width 8, 6 decimal places
    "0.142857"

Use `.Q.f` to format numbers to given precision after the decimal, for example:

    q).Q.f[2;]each 9.996 34.3445 7817047037.90  / format to 2 decimal places
    "10.00"
    "34.34"
    "7817047037.90"

See also
--------

-   [.Q.fmt](DotQ/DotQDotfmt "wikilink")
-   [.Q.f](DotQ/DotQDotf "wikilink")
-   [Comparison Tolerance](Cookbook/ComparisonTolerance "wikilink")
-   [Float Precision and Equality](Cookbook/FloatPrecision "wikilink")
-   [What Every Computer Scientist Should Know About Floating-Point Arithmetic](http://download.oracle.com/docs/cd/E19957-01/806-3568/ncg_goldberg.html)

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
