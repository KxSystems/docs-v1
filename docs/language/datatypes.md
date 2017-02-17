The _datatype_ of an object is given as a short int: positive for a vector, negative for an atom. A mixed list has type `0h`. 
```q
q)type 5                      / integer atom
-6h
q)type 2 3 5                  / integer list
6h
q)type (2;3 5f;"hello")       / mixed list
0h
q)type each (2;3 5f;"hello")
-6 9 10h
```

## Primitive types

Primitive datatypes are in the range ± `1h` to `19h`. 

<div markdown="1" class="kx-compact">
| char | size | num | literal              | null         | name      | sql       | java      | .net                 |
|------|------|-----|----------------------|--------------|-----------|-----------|-----------|----------------------|
| b    | 1    | 1   | `0b`                 |              | boolean   |           | Boolean   | boolean              |
| g    | 16   | 2   |                      | `0Ng`        | guid      |           | UUID      | GUID                 |
| x    | 1    | 4   | `0x00`               |              | byte      |           | Byte      | byte                 |
| h    | 2    | 5   | `0h`                 | `0Nh`        | short     | smallint  | Short     | int16                |
| i    | 4    | 6   | `0i`                 | `0Ni`        | int       | int       | Integer   | int32                |
| j    | 8    | 7   | `0j` / `0`           | `0Nj` / `0N` | long      | bigint    | Long      | int64                |
| e    | 4    | 8   | `0e`                 | `0Ne`        | real      | real      | Float     | single               |
| f    | 8    | 9   | `0.0` or `0f`        | `0n`         | float     | float     | Double    | double               |
| c    | 1    | 10  | `" "`                | `" "`        | char      |           | Character | char                 |
| s    | .    | 11  | `` ` ``              | `` ` ``      | symbol    | varchar   | String    | string               |
| p    | 8    | 12  | dateDtimespan        | `0Np`        | timestamp |           | Timestamp | DateTime (r/w)       |
| m    | 4    | 13  | `2000.01m`           | `0Nm`        | month     |           |           |                      |
| d    | 4    | 14  | `2000.01.01`         | `0Nd`        | date      | date      | Date      |                      |
| z    | 8    | 15  | dateTtime            | `0Nz`        | datetime  | timestamp | Timestamp | DateTime (read only) |
| n    | 8    | 16  | `00:00:00.000000000` | `0Nn`        | timespan  |           | Timespan  | TimeSpan             |
| u    | 4    | 17  | `00:00`              | `0Nu`        | minute    |           |           |                      |
| v    | 4    | 18  | `00:00:00`           | `0Nv`        | second    |           |           |                      |
| t    | 4    | 19  | `00:00:00.000`       | `0Nt`        | time      | time      | Time      | TimeSpan             |
</div>

!!! note "Strings"
    There is no _string_ datatype. The nearest equivalent to a string is a symbol, or a char vector. A reference to a _string_ should be understood as referring to a char vector.

Filepaths are a special form of symbol. 
```q
q)count read0 `:path/to/myfile.txt  / count lines in myfile.txt
```

<i class="fa fa-hand-o-right"></i> [Casting between types](casting)


Infinities
----------

Note that arithmetic for integer infinities (`0Wh`,`0Wi`,`0Wj`) is undefined, and does not retain the concept when cast.

    q)0Wi+5
    2147483652
    q)0Wi+5i
    -2147483644i
    q)`float$0Wj
    9.223372e+18
    q)`float$0Wi
    2.147484e+09

Arithmetic for float infinities (`0we`,`0w`) behaves as expected.

    q)0we + 5
    0we
    q)0w + 5
    0w


Enumerated types
----------------

Enumerated types are numbered from `20h` up to `76h`. For example, in a new session with no enumerations defined:

    q)type `sym$10?sym:`AAPL`AIG`GOOG`IBM
    20h
    q)type `city$10?city:`london`paris`rome
    21h

(Starting with v3.0, type `20h` is reserved for \`sym$.)


Nested types
------------

These types are used for mapped lists of lists of the same type. The numbering is 77 + primitive type (e.g. 78 is boolean, 96 is time and 97 is `` `sym$`` enumeration.) For example:
```q
q)`:t1.dat set 2 3#til 6
`:t1.dat
q)a:get `:t1.dat
q)type a            / integer nested type
83h
q)a
0 1 2
3 4 5
```


Dictionary and table
--------------------

Dictionary is `99h` and table is `98h`:

    q)type d:`a`b`c!(1 2;3 5;7 11)     / dict
    99h
    q)type flip d                      / table
    98h


Function
--------

| num     | type/example           |
|---------|------------------------|
| 100     | lambda                 |
| 101     | unary primitive        |
| 102     | binary primitive       |
| 103     | higher-order primitive |
| 104     | projection             |
| 105     | composition            |
| 106     | `f'`                   |
| 107     | `f/`                   |
| 108     | `f\`                   |
| 109     | `f':`                  |
| 110     | `f/:`                  |
| 111     | `f\:`                  |
| 112     | dynamic load           |

For example:

    q)type each({x+y};neg;-;\;+[;1];<>;,';+/;+\;prev;+/:;+\:;`f 2:`f,1)
    100 101 102 103 104 105 106 107 108 109 110 111 112h


Guid
----

The kdb+ guid type  (from v3.0) is a 16-byte type, and can be used for storing arbitrary 16-byte values, typically transaction IDs.

**Generation** Use [_deal_](FIXME) to generate a guid (global unique: uses `.z.a .z.i .z.p`). e.g.

```q
q)-2?0Ng
337714f8-3d76-f283-cdc1-33ca89be59e9 0a369037-75d3-b24d-6721-5a1d44d4bed5
```
If necessary, users can manipulate the bytes to make the uuid a [Version-4 'standard' uuid](http://en.wikipedia.org/wiki/Universally_unique_identifier#Version_4_.28random.29).

Guids can also be created from strings or byte vectors, using `sv` or `"G"$`, e.g.
```q
q)0x0 sv 16?0xff
8c680a01-5a49-5aab-5a65-d4bfddb6a661
q)"G"$"8c680a01-5a49-5aab-5a65-d4bfddb6a661"
8c680a01-5a49-5aab-5a65-d4bfddb6a661
```

`0Ng` is null guid. e.g.
```q
q)0Ng
00000000-0000-0000-0000-000000000000
q)null 0Ng
1b
```
There is no literal entry for a guid, it has no conversions, and the only scalar primitives are `=`, `<` and `>` (similar to sym). In general, since v3.0, there should be no need for char vectors for IDs. IDs should be int, sym or guid. Guids are faster (much faster for `=`) than the 16-byte char vecs and take 2.5 times less storage (16 per instead of 40 per).


