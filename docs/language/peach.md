The `peach` adverb is used for parallel execution of a function over data. For example, this can be useful for computationally expensive functions, or for accessing several drives at once from a single cpu.

In order to execute in parallel, q must be started with multiple slaves (`-s`).

Syntax
------

    q)function peach x       / parallel execute function on x

Example
-------

    q)\t {sum exp x?1.0} each 2#1000000
    132
    q)\t {sum exp x?1.0} peach 2#1000000     / with 2 cpu's
    70

peach-both:

    q)f:{sum y*exp x?1.0}
    q)\ts f'[2#1000000;2 3]
    57 16777856
    q)\ts .[f;]peach flip(2#1000000;2 3)
    32 1744

Threads And Globals
-------------------

The function is executed within the slave threads, unless the list x is a single element list, in which case the function is executed within the main q thread. **Only the main q thread may update global variables**, hence the function executed with peach is restricted to updating local variables only; this explains the following ambiguity

    q){`a set x} peach enlist 0 / works as single element list shortcuts to execute on the main q thread
    q){`a set x} peach 0 1 / fails, throws 'noupdate as it is executed from within slave threads

peach defaults to each in the case that no slave threads are specified on startup, such that it then executes on the only available thread, the main q thread

    q){`a set x} peach 0 1 / works when no slave threads are specified, as peach defaults to each

Results from the peach function are copied (via serialization/deserialization) to the main thread as kdb+ uses thread local heaps. Hence for best performance, peach should crunch large amounts of data in the computationally intense function and return small data sets, as serialization has an overhead. This overhead can be observed with

    \t do[100;-9!-8!object]

where object is the data being passed or returned.

The algorithm for grouping symbols is different for slave threads than the main q thread. The main q thread uses an optimization not available to the slave threads. e.g. kdb+ started with 2 slave threads

    q)s:100000000?`3
    q)\t {group s} peach enlist 0 / defaults to main thread as only single element
    2580
    q)\t {group s} peach 0 1 / group in slave threads, can't use optimized algorithm
    9885

However, grouping integers behave as expected

    q)s:100000000?1000
    q)\t {group s} peach enlist 0
    2308
    q)\t {group s} peach 0 1
    2802

Perfect scaling may not be achieved due to resource clashes.

Number of cores/slave threads
-----------------------------

A vector with n elements peached with function f with s slaves on m cores is distributed such that threads are preassigned which elements they will be responsible for processing, e.g. for 9 jobs over 4 threads, thread \#0 will be assigned elements 0,4,8; if each job takes the same time to complete, then the total execution time of jobs will be quantized according to \#jobs mod \#cores, i.e. with 4 cores, 12 jobs should execute in a similar time as 9 jobs (assuming \#slaves&gt;=\#cores).

Sockets/handles with peach
--------------------------

A handle must not be used concurrently between threads as there is no locking around a socket descriptor, and the bytes being read/written from/to the socket will be garbage (due to message interleaving) and most likely result in a crash. Since v3.0, a socket can be used from the main thread only, or if you use the single shot sync request syntax as

    q)`:localhost:5000 "2+2"

peach forms the basis for a multithreaded hdb, for illustration purposes considering the following query

{select max price by date,sym from trade where date=d} peach date

this would execute a query for each date in parallel. The multithreaded hdb with par.txt hides the complexity of splitting the query up between threads and aggregating the results.

Memory Usage
------------

Each slave thread has its own heap, a minimum of 64MB.

Since kdb 2.7 2011.09.21, .Q.gc\[\] in the main thread executes gc in the slave threads too.

Automatic garbage collection within each thread (triggered by a wsful, or hitting the artificial heap limit as specified with -w on the command line) is only executed for that particular thread, not across all threads.

Symbols are internalized from a single memory area common to all threads.

Peach using multiple processes (Distributed each)
-------------------------------------------------

Since v3.1, peach can use multiple processes instead of threads, configured through the startup cmd line option -s with a negative integer, i.e. -s -N, e.g. -s -4. On startup, kdb+ will then try to connect to N processes on ports 20000 through 20000+N-1, and use of peach with &gt;1 element will use those processes to execute the function given to peach. Unlike multiple threads, the distribution of the workload is not precalculated, and is distributed to the slave processes as soon as they complete their allocated elements. All data required by the peached function must either already exist on all slave processes, or be passed as an argument - however, (size of) args should be minimised due to ipc costs. If any of the slave processes are restarted, the master process must also restart to reconnect. The motivating use case for this mode is multiprocess hdbs, combined with non-compressed data and .Q.MAP\[\].

Slave processes must be started manually and [.z.pd](Reference/dotzdotpd "wikilink") must be set to their connection handles (or a function that returns the handles).

These handles must not be used for other msgs; peach will close them if it receives anything other than a response msg. e.g.

    q).z.pd:{n:abs system"s";$[n=count handles;handles;[hclose each handles;:handles::`u#hopen each 20000+til n]]}
    q).z.pc:{handles::`u#handles except x;}
    q)handles:`u#`int$();

See also
--------

-   [each](Reference/each "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
