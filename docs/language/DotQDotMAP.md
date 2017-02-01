.Q.MAP
======

Added in v3.1, keeps partitions mapped to avoid the overhead of repeated file system calls during a select.

For use with partitioned hdbs, used in tandem with \\l dir

    q)\l .
    q).Q.MAP[]

When using .Q.MAP\[\] you can't access the date column outside of the usual: select .. \[by date,..\] from .. where \[date ..\]

NOT recommended for use with compressed files, as the decompressed maps will be retained, using physical memory|swap.

N.B. you may need to increase the number of available file handles, and also the number of available file maps. For linux see vm.max\_map\_count.
