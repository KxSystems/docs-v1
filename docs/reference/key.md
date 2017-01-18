`key` performs various functions depending on its argument.

Syntax
------

    q)r:key x

Returns the keys of a *dictionary* or the symbol name of a dictionary:

    q)D:`q`w`e!(1 2;3 4;5 6)
    q)key D
    `q`w`e
    q)key `D
    `q`w`e

Since a context is a dictionary, this will get the names in a context:

    q)key `.
    `D`daily`depth`mas`sym`date`nbbo...
    q)key `.q
    ``neg`not`null`string`reciprocal`floor...

Similarly, the contexts can be listed as:

    q)key `
    `q`Q`h`o`util`rx

Given a *symbol atom*, returns the original symbol if a variable of that name exists (and is not a dictionary), otherwise returns an empty list. The name is interpreted relative to the current context if not fully qualified:

    q)()~key`a
    1b
    q)a:1
    q)key`a
    `a
    q)\d .foo
    q.foo)key`a
    q.foo)a:1 2!3 4
    q.foo)key`a
    1 2
    q.foo)key`.foo.a
    1 2
    q.foo)key`..a
    `..a
    q.foo)\d .
    q)key`a
    `a
    q)key`.foo.a
    1 2
    q)key`..a
    `..a

Returns the key columns of a *keyed table*:

    q)K:([s:`q`w`e]g:1 2 3;h:4 5 6)
    q)key K
    s
    -
    q
    w
    e

Given a *directory handle*, returns a list of objects in the directory:

    q)key`:c:/q
    `c`profile.q`sp.q`trade.q`w32

To select particular files, use `like`:

    q)f:key`:c:/q
    q)f where f like "*.q"
    `profile.q`sp.q`trade.q

Given a *file descriptor*, returns the descriptor if the file exists, otherwise returns an empty list:

    q)key`:c:/q/sp.q
    `:c:/q/sp.q
    q)key`:c:/q/notfound.q
    ()

Note that an empty directory returns an empty symbol vector, while a non-existent directory returns an empty *general* list:

    q)\ls foo
    ls: cannot access foo: No such file or directory
    'os
    q)()~key`:foo
    1b
    q)\mkdir foo
    q)key`:foo
    `symbol$()

Given a *foreign key column*, returns the name of the foreign key table:

    q)f:([f:1 2 3]v:`a`b`c)
    q)x:`f$3 2
    q)key x
    `f

Given a *simple list*, returns the name of the type as a symbol:

    q)key each ("abc";101b;1 2 3h;1 2 3;1 2 3j;1 2 3f)
    `char`boolean`short`int`long`float

Given an *enumerated list*, it returns the name of the enumerating list:

    q)ids:`a`b`c
    q)x:`ids$`a`c
    q)key x
    `ids

Given a *positive integer*, it acts like [til](Reference/til "wikilink"):

    q)key 10
    0 1 2 3 4 5 6 7 8 9

Given a *simple list* it returns a symbol showing the list's [type](Reference/type "wikilink")

    q)key 0#5
    `long
    q){key x$()}'[.Q.t where " "<>.Q.t]
    `boolean`guid`byte`short`int`long`real`float`char`symbol`timestamp`month`date`datetime`timespan`minute`second`time

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
