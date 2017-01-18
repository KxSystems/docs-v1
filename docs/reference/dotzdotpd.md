.z.pd (peach handles)
=====================

When kdb+ is invoked with command line option -s -N

e.g.

    $q -s -4

indicating that N worker processes should be used for executing the function supplied to peach, kdb+ gets the handles to those worker processes by calling .z.pd\[\]. Hence .z.pd can be either a list of (or a function that returns a list of) handles to those worker processes. These handles must not be used for other messaging; peach will close them if it receives anything other than a response msg.

e.g.

    q).z.pd:`u#hopen each 20000+til 4 / open connections to 4 processes on the localhost 

The int vector returned MUST have the \`u attribute set.

A more comprehensive setup may be

    q).z.pd:{n:abs system"s";$[n=count handles;handles;[hclose each handles;:handles::`u#hopen each 20000+til n]]}
    q).z.pc:{handles::`u#handles except x;}
    q)handles:`u#`int$();

Note that the worker processes are not started automatically by kdb+.

For an example of starting the worker processes in q, see [Cookbook/LoadBalancing](Cookbook/LoadBalancing "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
