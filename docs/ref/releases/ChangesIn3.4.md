Below is a summary of changes from v3.3. Commercially licensed users may obtain the detailed change list / release notes from <http://downloads.kx.com>


## Production release date

2016.05.31


## New

-   IPC message size limit raised from 2GB to 1TB.
-   supports IPC via [Unix domain sockets](http://code.kx.com/wiki/Reference/hopen#unix_domain_sockets "wikilink") for lower latency, higher throughput local IPC connections.
-   can use both incoming and outgoing encrypted connections using [Secure Sockets Layer(SSL)/Transport Layer Security(TLS)](http://code.kx.com/wiki/Cookbook/SSL "wikilink").
-   can read directly from [NamedPipes](http://code.kx.com/wiki/Cookbook/NamedPipes "wikilink") (e.g. avoid unzipping a CSV to disk, can pipe it directly into kdb+).
-   `varchar~\:x` and `x~/:varchar` are now ~10x faster.
-   improved performance by ~10x for `like` on nested char vectors on disk.
-   can utilize the [snappy](http://google.github.io/snappy) compression algorithm as algo \#3 for [File Compression](http://code.kx.com/wiki/Cookbook/FileCompression "wikilink").
-   certain vector types can now be [updated efficiently](http://code.kx.com/wiki/Reference/AtSymbol#.40_.28index.2Fapply.29 "wikilink"), directly on disk, rather than having to rewrite the whole file on change.
-   added async broadcast as [`-25!`(handles;msg)](http://code.kx.com/wiki/Reference/BangSymbolInternalFunction#.E2.88.9225.21x "wikilink") which serializes the msg once, queuing it as async msg to each handle.
-   [`parse`](http://code.kx.com/wiki/Reference/parse "wikilink") can now handle k in addition to q code.
-   `.Q.en` can now handle lists of sym vectors: [Enumerating nested varchar columns](http://code.kx.com/wiki/Cookbook/SplayedTables#Enumerating_nested_varchar_columns_in_a_table "wikilink")

## Not upwardly compatible

-   [`ema`](http://code.kx.com/wiki/Reference/ema) is now a reserved word.

