.Q.fs
=====

Loops over a file and grabs convenient sized lumps of complete records ("\\n" delimited) and allows you to apply a function to each record. This enables you to implement a streaming algorithm to convert a large CSV file into an on-disk Kdb+ database without holding the data in memory all at once.

For example, assume that the **potamus.csv** file contains the following:

    Take, a,   hippo, to,   lunch, today,        -1, 1941-12-07
    A,    man, a,     plan, a,     hippopotamus, 42, 1952-02-23

If you call `.Q.fs` on this file with the function `0N!`, you get the following list of rows:

    q).Q.fs[0N!]`:potamus.csv
    ("Take, a,   hippo, to,   lunch, today,        -1, 1941-12-07";"A,    man, a,     plan, a,     hippopotamus, 42, 1952-02-23")
    120j

`.Q.fs` can also be used to read the contents of the file into a list of columns:

    q).Q.fs[{0N!("SSSSSSID";",")0:x}]`:potamus.csv
    (`Take`A;`a`man;`hippo`a;`to`plan;`lunch`a;`today`hippopotamus;-1 42;1941.12.07 1952.02.23)
    120j

See also
--------

[Cookbook: Loading large csv files](Cookbook/LoadingFromLargeFiles "wikilink")
