## .Q.MAP

Syntax: `.Q.MAP[]`

Added in V3.1, keeps partitions mapped to avoid the overhead of repeated file system calls during a `select`.

For use with partitioned HDBS, used in tandem with `\l dir`
```q
q)\l .
q).Q.MAP[]
```
When using `.Q.MAP[]` you can't access the date column outside of the usual: 
```q
select … [by date,…] from … where [date …]
```
NOT recommended for use with compressed files, as the decompressed maps will be retained, using physical memory|swap.

!!! note "File handles and maps" 
    You may need to increase the number of available file handles, and also the number of available file maps. For Linux see vm.max_map_count.


## `.Q.qp`

Syntax: `.Q.qp x`

Where `x` 

- is a partitioned table, returns `1b`
- a splayed table, returns `0b` 
- anything else, returns 0

```q
q)\
  B
+`time`sym`price`size!`B
  C
+`sym`name!`:C/
  \
q).Q.qp B
1b
q).Q.qp select from B
0
q).Q.qp C
0b
```

## `.Q.view`

Set a subview

`.Q.view 2#date`
