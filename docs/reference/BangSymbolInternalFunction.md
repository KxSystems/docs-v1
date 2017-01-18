! internal function
===================

! with a negative integer on the left hand side, calls a k internal function.

![Neal Stephenson thinks it's cute to name his labels 'dengo'](goto.png "Neal Stephenson thinks it's cute to name his labels 'dengo'")

these should rarely, if ever, be used, but since it is useful to be able to recognise them when seen in the wild, here is a partial list:

−1!x
----

see/use [hsym](Reference/hsym "wikilink")

-2!x
----

see/use [attr](Reference/attr "wikilink")

−3!x
----

returns the string representation of x.

strictly this is .Q.s1, but it's better to use [.Q.s](DotQ/DotQDots "wikilink")

−4!x
----

returns the list of q tokens found in string x (note the q parsing of names with embedded underscores)

    q)-4!"select this from that"
    "select"
    ," "
    "this"
    ," "
    "from"
    ," "
    "that"

    q)-5!"select this from that" / compare with −5!
    ?
    `that
    ()
    0b
    (,`this)!,`this

    q)-4!"a variable named aa_bb"
    ,"a"
    ," "
    "variable"
    ," "
    "named"
    ," "
    "aa_bb"
    q)

−5!x
----

see/use [parse](Reference/parse "wikilink")

-6!x
----

see/use [eval](Reference/eval "wikilink")

−7!x
----

see/use [hcount](Reference/hcount "wikilink")

-8!x
----

return the IPC byte representation of x

    q)-8!1 2 3
    0x010000001a000000060003000000010000000200000003000000

-9!x
----

create data from IPC byte representation x

    q)-9!-8!1 2 3
    1 2 3

−10!x
-----

resolve a type number to an enum vector and check if it's available

    q)-10!20h
    1b
    q)ee:`a`b`c
    q)vv:`ee$`a`a`b
    q)type vv
    20h
    q)-10!20h
    0b

−11!x
-----

streaming execute over file x, used for example in kdb+tick to replay logfiles in a memory efficient manner.

A logfile is just a list of lists, and each list is read in turn and executed (see [value](Reference/value "wikilink")) either via value or .z.ps if it is defined.

Here, for demonstration purposes, we manually create a logfile, and play it back through -11. This is functionally equivalent to doing "value each get\`:logfile" but using far less memory.

    q)`:logfile.2013.12.03 set () / create a new,empty log file
    `:logfile.2013.12.03
    q)h:hopen `:logfile.2013.12.03 / open it
    q)h enlist(`f;`a;10) / append a record
    3i
    q)h enlist(`f;`b;20) / append a record
    3i
    q)hclose h / close the file
    q)f:{0N!(x;y)} / define the function that is referenced in those records
    q)-11!`:logfile.2013.12.03 / playback the logfile
    (`a;10)
    (`b;20)
    2
    q)value each get `:logfile.2013.12.03 / DO NOT DO THIS ON LARGE LOGFILES!!!! This is the whole purpose of -11!x.
    (`a;10)
    (`b;20)
    `a 10
    `b 20

If successful the number of chunks executed is returned. If the end of the file is corrupt a 'badtail error is signalled. In the event that the log file references an undefined function, the function name is thrown as an error. This can be confusing if the missing function name is upd, as it does not reflect the same situation as the license expiry 'upd error. e.g.

    / Continuing the above example
    q)delete f from `.
    `.
    q)-11!`:logfile.2013.12.03 / function f no longer defined, so it throws an error
    'f

see the utilities in [rescuelog.q](https://github.com/simongarland/tickrecover/rescuelog.q) for examples of usage.

−11!(-1;x)
----------

same as −11!x

−11!(n;x)
---------

streaming execute the first n chunks of logfile x, return the number of chunks if successful.

It's possible to leverage the above to playback n records from record M onwards. e.g.

Firstly create a sample log file, which contains 1000 records as ((\`f;0);(\`f;1);(\`f;2);..;(\`f;999)).

    q)`:log set();h:hopen`:log;i:0;do[1000;h enlist(`f;i);i+:1];hclose h;

then define function f to just print its arg, skip the first M records. If .z.ps is defined, -11!x calls .z.ps for each record.

    q)m:0;M:750;f:0N!;.z.ps:{m+:1;if[m>M;value x;];};-11!(M+5-1;`:log)
    750
    751
    752
    753
    754

-11!(-2;x)
----------

given a valid logfile, return the number of chunks.

given an invalid logfile, return the number of valid chunks and length of the valid part.

    q)logfile:`:good.log / a non-corrupted logfile
    q)-11!(-2;logfile)
    26
    q)logfile:`:broken.log / a manually corrupted logfile
    q)upd:{[x;y]} / define a dummy upd file as components are of the form (`upd;data)
    q)-11!logfile
    'badtail
    q)-11!(-1;logfile)
    'badtail
    q)hcount logfile
    39623j
    q)-11!(-2;logfile)
    26
    35634j
    q)/ 26 valid chunks until position 35634 (out of 39623)
    q)-11!(26;logfile)
    26

-12!x
-----

see/use [.Q.host](DotQ/DotQDothost "wikilink")

−13!x
-----

see/use [.Q.addr](DotQ/DotQDotaddr "wikilink")

−14!x
-----

handle " escaping in strings (used to prepare data for csv export)

−15!x
-----

see/use [md5](Reference/md5 "wikilink")

−16!x
-----

return the reference count for a variable

    q)-16!a
    1
    q)a:b:c:d:e:1 2 3
    q)-16!a
    5

−17!x
-----

flip endian-ness of kdb+ data file x, see notes in [Changes in kdb+ v2.6](Releases/ChangesIn2.6 "wikilink")

-18!x
-----

returns compressed IPC byte representation of x, see notes about network compression in [Changes in kdb+ v2.6](Releases/ChangesIn2.6 "wikilink")

−19!x
-----

compress a file, see [File Compression](Cookbook/FileCompression "wikilink")

−20!0
-----

see/use [.Q.gc](DotQ/DotQDotgc "wikilink")

−21!x
-----

compression statistics for file x, see [File Compression](Cookbook/FileCompression "wikilink")

−22!x
-----

An optimized shortcut to obtain the length of uncompressed serialized x, i.e. count -8!x

    q)v:til 100000
    q)\t do[5000;-22!v]
    1
    q)\t do[5000;count -8!v]
    226
    q)(-22!v)=count -8!v
    1b

−23!x
-----

since kdb+ 3.1t 2013.03.04

Maps data into memory without copying.

    q)-23!t:select from get`:t/; / previous tricks to force load included .. where i>=0

−24!x
-----

since kdb+ 3.3t 2014.10.07

read only evaluation, underpinning the keyword "reval", similar to eval (-6!), which behaves as if the cmd line option -b were active for the duration of the -24! call.

An example usage is inside the message handler .z.pg, useful for access control, here blocking sync messages from updating -

    q).z.pg:{reval(value;x)} / define on local process listening on port 500
    q)h:hopen 5000 / from another process on localhost
    q)h"a:4"
    'noupdate: `. `a

−25!x
-----

since kdb+ 3.4

Broadcast data as an async msg to specified handles. The advantage of using -25!(handles;msg) over neg\[handles\]@\\:msg is that -25!msg will serialize msg just once - thereby reducing cpu and memory load.

Use as

`q)-25!(handles;msg)`

handles should be a vector of int | longs &gt; 0.

msg will be serialized just once, to the lowest capability of the list of handles. i.e. if handles are connected to a mix of versions of kdb+, it will serialize limited to the types supported by the lowest version. If there is an error, no messages will have been sent, and it will return the handle whose cap caused the error.

Just as with neg\[handles\]@\\:msg, -25!x queues the msg as async on those handles - they don't get sent until the next spin of the main loop, or are flushed with neg\[handles\]@\\:(::).

Possible error scenarios:

1)from trying to serialize data for a handle whose remote end does not support a type, or size of the data. e.g.

`/ connect to 2.8 and 3.4`
`q)h:hopen each 5000 5001`
`q)h`
`5 6i `
`q)(-5) 0Ng / 2.8 does not support guid`
`'type`
`q)(-6) 0Ng / 3.4 does support guid `
`q)-25!(h;0Ng)`
`'type error serializing for handle 5`

2) in case an int is passed which is not a handle

`q)-25!(7 8;0Ng)`
`'7 is not an ipc handle`

−26!x
-----

kdb+ v3.4t 2016.05.12 View TLS settings on a handle or current process -26!handle or -26!()

see/use [SSL](Cookbook/SSL "wikilink")

−29!x
-----

since kdb+ 3.3t 2015.02.17

underpins the json parser, .j.k.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
