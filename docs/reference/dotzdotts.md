.z.ts
=====

Function which is invoked on intervals of the timer variable (\\t)

    / set the timer to 1000 milliseconds
    \t 1000
    / parameter x is the current timestamp - .z.ts is called once per second and outputs the current timestamp
    .z.ts:{0N!x}
    2010.12.16D17:12:12.849442000
    2010.12.16D17:12:13.849442000
    2010.12.16D17:12:14.849442000
    2010.12.16D17:12:15.849442000
    2010.12.16D17:12:16.849442000

n.b. When kdb+ has completed executing a script passed as a cmd line argument, and if there are no open sockets nor a console, kdb+ will exit. The timer alone is not enough to stop the process exiting - it must have an event source which is a file descriptor (socket, console, or some plugin registering a file descriptor and callback via the c-api sd1 function).

See also
--------

-   [\\t](Reference/SystemCommands#tp-timer "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
