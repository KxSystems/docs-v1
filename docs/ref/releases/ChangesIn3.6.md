# Changes in 3.6



Below is a summary of changes from V3.5. Commercially licensed users may obtain the detailed change list / release notes from <http://downloads.kx.com>

## Production release date

2018.05.18


## Deferred response

More efficient gateways!

## 64-bit enumerations

Saving an unmappable compound object with >2 billion elements as a single file is now supported.
```q
q)`:f set t:([](1+prd 31#2)#"x"$til 256)
q)t~get`:f
1b
```

## Anymap

Introduced a new mappable format for nested data storage, a.k.a _map anything_, _anymap_ or _type 77_. e.g.:
```q
q)t:([]`sym?`p#asc 10?3?`3;price:10?100.;str:10 10#.Q.a)
q)a:get`:a set (1 2 3;`time`price`vol!(.z.p;1.;100i);t)
q)77h~type a
1b
```
The principal type is 77h ‘mapped list’. Its constituents are either copied into memory on access (similar to the mapped nested types we had before) or stay mapped.

Elements of lists saved by `set` are copied, while `1:` results in mapped data, e.g.
```q
q)x:(("ab";"cd");("ef";"gh"))
q)a:get`:a set x
q)b:get`:b 1: x
q)77 0~(type a;type a 0)
1b
q)77 77~(type b;type b 0)
1b
```

All symbol vectors/atoms within file are automatically enumerated against file## and deenumerated (and therefore always copied) on access.

The underlying storage (file#) stays mapped as long as there exists a reference to any mapped object within.

Care should be taken when working with compressed data, as anything ever decompressed in a file would stay in memory until the last reference is gone.
At the moment, the format supports all types/attributes except types>99h (lambda, composition, parse tree, etc.).

All attribute data, including that of type 77 lists, stays mapped. Small vectors and atoms have an unmappable compact representation. 


## NUCs – not upwardly compatible

We have tried to make the process of upgrading seamless, however please pay attention to the following NUCs to consider whether they impact your particular installation.

Improved the GUID hashing:

-   It now considers all bits of the guid.
-   Uses a new file format for guids with `u`, `p` or `g` attribute. This format is unreadable by previous versions.
-   Guid files from previous versions are still readable.

Modified the new enum file format introduced in 3.6t 2018.02.07, since appending to compressed enum files was problematic.

Enums, and linked columns, now use 64-bit indexes:

- 64-bit enums are type 20 regardless of their domain
- There is no practical limit to the number of 64-bit enum domains
- 64-bit enums save to a new file format which is not readable by previous versions
- 32-bit enums files from previous versions are still readable, use type space 21 thru 76 and all ops cast them to 64-bit
- saving nested enums to disk is currently NYI; to be fixed in the near future

Added `ajf` and `ajf0`, to behave as V2.8 `aj` and `aj0`, i.e. they fill from LHS if RHS is null. e.g.
```q
q)a:([]time:2#00:00:01;sym:`a`b;p:1 1;n:`r`s)
q)b:([]time:2#00:00:01;sym:`a`b;p:0 1)
q)c:([]time:2#00:00:00;sym:`a`b;p:1 0N;n:`r`s)
q)a~ajf[`sym`time;b;c]
1b
```


## Suggested upgrade process

Even though we have run a wide range of tests on V3.5, and various customers have been kind enough to repeatedly run their own tests during the last few months of development, customers who wish to upgrade to V3.5 should run their own tests on their own data and code/queries before promoting to production usage. In the event that you do discover a suspected bug, please email tech@kx.com


## Detailed change list

There are also a number of smaller enhancements and fixes; please see the detailed change list (README.txt) on downloads.kx.com – ask your company support representative to download this for you.