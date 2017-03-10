The command line for invoking q has the form:
```bash
    q [f] [-b] [-c r c] [-C r c] [-e 0|1] [-g 0|1] [-l] [-L][-o N] [-p N] 
        [-P N] [-q] [-r :H:P] [-s N] [-t N] [-T N] [-u|U F] [-w N] [-W N] 
        [-z 0|1]
```

## `f`
  
This is either the script to load (\*.q, \*.k, \*.s), or a file or directory


## `-b`
  
Block client write-access to a kdb+ database. 
```bash
~/q$ q -b
```
```q
q)aa:([]bb:til 4)
q)\p 5001
q)
```
and in another task
```q
q)h:hopen 5001
q)h"count aa"
4
q)h"aa:10#aa"
'noupdate
q)
```
Use `\_` to check if client write-access is blocked:
```q
~/q$ q -b
..
q)\_
1
```


## `-c r c`
  
Console maxRows maxCols, default 25 80.

These settings determine when q elides output with `..`

You usually don’t need to set this, if the environment variables LINES and COLUMNS are found they’ll be taken as the default value. See bash documentation for `shopt` parameter `checkwinsize` to make sure they are reset as needed.
```bash
..$ q -c 10 20
```
```q
q)til each 20+til 10
0 1 2 3 4 5 6 7 8..
0 1 2 3 4 5 6 7 8..
0 1 2 3 4 5 6 7 8..
0 1 2 3 4 5 6 7 8..
0 1 2 3 4 5 6 7 8..
0 1 2 3 4 5 6 7 8..
0 1 2 3 4 5 6 7 8..
..
```
<i class="fa fa-hand-o-right"></i> [`\c`](Reference/Syscmdc "wikilink"), <i class="fa fa-external-link-square"></i> <a target="_blank" href="http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html">Gnu Shopt documentation</a>


## `-C r c`
  
HTTP display maxRows maxCols, default 36 2000

The defaults are 36&times;2000, and values are coerced to the range \[10,2000\].

<i class="fa fa-hand-o-right"></i> [`\C`](Reference/Syscmdc "wikilink"), <i class="fa fa-external-link-square"></i> <a target="_blank" href="http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html">Gnu Shopt documentation</a>



## `-e B`
  
Enable client error trapping


## `-g B`
  
Allows switching of garbage collect to immediate(1) mode instead of deferred(0).

- Immediate mode will return (certain types of) memory to the OS as soon as no longer referenced and has an associated overhead.
- Deferred mode will return memory to the OS when either .Q.gc\[\] is called or an allocation fails, hence deferred mode has a performance advantage, but can be more difficult to dimension/manage memory requirements.

Immediate mode is the 2.5/2.6 default, deferred is the 2.7 default.
To use immediate mode, invoke as `q -g 1`. (Since V2.7 2011.02.04.)


## `-l`
  
Log updates to filesystem, see [Cookbook/Logging](Cookbook/Logging "wikilink")


## `-L`
  
As `-l`, but sync logging, see [Cookbook/Logging](Cookbook/Logging "wikilink")


## `-o N`
  
Offset hours from GMT, or minutes if `abs[N]&gt;23` (Affects `.z.Z`)


## `-p N`
  
Port on which kdb+ server listens. Use for [client/server](Cookbook/ClientServer "wikilink"), e.g. kdbc(/jdbc/odbc), HTTP(HTML XML txt CSV).


## `-p -N`
  
Port for [multithreaded input mode](Cookbook/MultithreadedInputMode "wikilink").


## `-P N`
  
Display precision for floating point numbers, where `N` is the _display_ precision for floats and reals, i.e. `N` is the number of significant digits shown in output.
The default value is 7 and possible values are in the range \[0,17\]. A precision of 0 means use maximum precision. 
This is used when exporting to CSV files.
```bash
..$ q
```
```q
q)\P                       / default
7i
q)reciprocal 7             / 7 digits shown
0.1428571
q)123456789                / integers shown in full
123456789
q)123456789f               / floats shown to 7 significant digits
1.234568e+08
q)\\
```
```bash
..$ q -P 3
```
```q
q)1%3
0.333
q)\\
```
```bash
..$ q -P 10
```
```q
q)1%3
0.3333333333
q)\\
```

!!! tip "`.Q.fmt` and `.q.f`"
    Use `.Q.fmt` to format numbers to given width and precision.
    ```q
    q).Q.fmt[8;6]a            / format to width 8, 6 decimal places
    "0.142857"
    ```
    Use `.Q.f` to format numbers to given precision after the decimal.
    ```q
    q).Q.f[2;]each 9.996 34.3445 7817047037.90  / format to 2 decimal places
    "10.00"
    "34.34"
    "7817047037.90"
    ```

<i class="fa fa-hand-o-right"></i> [`\P`](Reference/SyscmdP "wikilink"), [.Q.f](DotQ/DotQDotf "wikilink"), [.Q.fmt](DotQ/DotQDotfmt "wikilink"), [Comparison Tolerance](Cookbook/ComparisonTolerance "wikilink"), [Float Precision and Equality](Cookbook/FloatPrecision "wikilink")

<i class="fa fa-external-link-square"></i> <a target="_blank" href="http://docs.sun.com/source/806-3568/ncg_goldberg.html">What Every Computer Scientist Should Know About Floating-Point Arithmetic</a>


## `-q`
  
Quiet, i.e. no startup banner text or session prompts. Typically used where no console is required.
```bash
~/q$ q
```
```q
KDB+ 2.6 2010.01.14 Copyright (C) 1993-2010 Kx Systems
..
q)2+2
4
q)
```
and with `-q`
```bash
~/q$ q -q
```
```q
2+2
4
```


## `-r :H:P[:user[:password]]`
  
Replicate from :host:port


## `-s N`
  
Start `N` slaves for parallel execution


## `-t N`
  
Timer in milliseconds between timer ticks. Default is 0, for no timer.


## `-T N`
  
Timeout in seconds for client queries, i.e. maximum time a client call will execute. Default is 0, for no timeout.


## `-u 1`
  
Disables system commands from a remote (signals `'access`). As such, this includes disabling exit via `"\\"` from a remote.


## `-u F`
  
Sets usr:pwd file, no access above start directory


## `-U F`
  
As `-u`, but no access restrictions


## `-w N`
  
Workspace MB limit (default: 2&times;RAM)


## `-W N`
  
Start of week as an offset from Saturday. Default is 2, meaning that Monday is the start of week.


## `-z B`
  
Format used for `"D"$` date parsing. 0 is MM/DD/YYYY (default) and 1 is DD/MM/YYYY.

![](../img/xkcd.tar.png)
