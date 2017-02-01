^ (fill/coalesce)
=================

fill
----

The dyadic function ^ (fill) is scalar atomic and replaces `null` values in the right argument with the left argument.

    q)0^1 2 3 0N
    1 2 3 0
    q)100^1 2 -5 0N 10 0N
    1 2 -5 100 10 100
    q)1.0^1.2 -4.5 0n 0n 15
    1.2 -4.5 1 1 15
    q)`nobody^`tom`dick``harry
    `tom`dick`nobody`harry
    q)1 2 3 4 5^6 0N 8 9 0N
    6 2 8 9 5

Integer left arguments are promoted when the right argument is float or real.

    q)a:11.0 2.1 3.1 0n 4.5 0n
    q)type a
    9h
    q)10^a
    11 2.1 3.1 10 4.5 10
    q)type 10^a
    9h

When the arguments are dictionaries, both null and missing values in the right argument are filled with those from the left argument:

    q)(`a`b`c!1 2 3)^`b`c!0N 30
    a| 1
    b| 2
    c| 30

coalesce
--------

until coalesce is defined in the reference, see <http://code.kx.com/wiki/JB:QforMortals2/tables#Coalesce_.28.5E.29>

See also
--------

-   [fills](Reference/fills "wikilink")
-   [null](Reference/null "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
