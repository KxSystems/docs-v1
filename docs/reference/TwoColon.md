2:
==

The `2:` function is a dyadic function used to dynamically load C functions into Kdb+. Its left argument is a symbol representing the name of the dynamic library from which to load the function. Its right argument is a list of a symbol which is the function name and an integer which is the number of arguments the function to be loaded takes.

Many more details and examples are in the [Extending Kdb+ with C](Cookbook/ExtendingWithC "wikilink") cookbook recipe.

Example
-------

Let us assume we have a C function in cpu.so with the prototype:

    K q_read_cycles_of_this_cpu(K x);

Then to make this available in a kdb+ session, we use `2:` to dynamically load the function as follows:

    read_cycles:`cpu 2:(`q_read_cycles_of_this_cpu;1)

See also
--------

-   [Extending Kdb+ with C](Cookbook/ExtendingWithC "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
