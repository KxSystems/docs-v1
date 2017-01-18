The command line has the form:

    q [f] [-b] [-c r c] [-C r c] [-e 0|1] [-g 0|1] [-l] [-L][-o N] [-p N] [-P N] [-q] [-r :H:P]
        [-s N] [-t N] [-T N] [-u|U F] [-w N] [-W N] [-z 0|1]

**f**  
this is either the script to load (\*.q, \*.k, \*.s), or a file or directory

<!-- -->

**-b**  
block client write access to a kdb+ database, see [-b](Reference/Cmdlineb "wikilink")

<!-- -->

**-c r c**  
console maxRows maxCols, default 25 80, see [Console Size](Reference/ConsoleSize "wikilink")

<!-- -->

**-C r c**  
http display maxRows maxCols, default 36 2000, see [Console Size](Reference/ConsoleSize "wikilink")

<!-- -->

**-e B**  
enable client error trapping

<!-- -->

**-g B**  
since 2.7 2011.02.04

allows switching of garbage collect to immediate(1) mode instead of deferred(0).
Immediate mode will return (certain types of) memory to the OS as soon as no longer referenced and has an associated overhead.
Deferred mode will return memory to the OS when either .Q.gc\[\] is called or an allocation fails, hence deferred mode has a performance advantage, but can be more difficult to dimension/manage memory requirements.
Immediate mode is the 2.5/2.6 default, deferred is the 2.7 default.
::e.g. to use immediate mode, invoke as q -g 1

**-l**  
log updates to filesystem, see [Cookbook/Logging](Cookbook/Logging "wikilink")

<!-- -->

**-L**  
as -l, but sync logging, see [Cookbook/Logging](Cookbook/Logging "wikilink")

<!-- -->

**-o N**  
offset hours from GMT, or minutes if abs\[N\]&gt;23 (affects .z.Z)

<!-- -->

**-p N**  
port on which kdb+ server listens. Use for [client/server](Cookbook/ClientServer "wikilink"), e.g. kdbc(/jdbc/odbc), http(html xml txt csv).

<!-- -->

**-p -N**  
port for [multithreaded input mode](Cookbook/MultithreadedInputMode "wikilink").

<!-- -->

**-P N**  
display precision for floating point numbers, see [Display Precision](Reference/DisplayPrecision "wikilink").

<!-- -->

**-q**  
quiet, i.e. no startup banner text or session prompts, see [-q](Reference/Cmdlineq "wikilink").

<!-- -->

**-r :H:P\[:user\[:password\]\]**  
replicate from :host:port

<!-- -->

**-s N**  
start N slaves for parallel execution

<!-- -->

**-t N**  
timer in milliseconds between timer ticks. Default is 0, for no timer.

<!-- -->

**-T N**  
timeout in seconds for client queries, i.e. maximum time a client call will execute. Default is 0, for no timeout.

<!-- -->

**-u 1**  
disables system commands from a remote (throws 'access). As such, this includes disabling exit via "\\\\" from a remote.

<!-- -->

**-u F**  
usr:pwd file, no access above start directory

<!-- -->

**-U F**  
as -u, but no access restrictions

<!-- -->

**-w N**  
workspace MB limit (default: 2\*RAM)

<!-- -->

**-W N**  
start of week as an offset from saturday. Default is 2, meaning that Monday is the start of week.

<!-- -->

**-z B**  
format used for "D"$ date parsing. 0 is mm/dd/yyyy (default) and 1 is dd/mm/yyyy.

![](Xkcd.tar.png "Xkcd.tar.png")
