/ (comment/over)
================

comment
-------

When / is following a space (or a right parenthesis, bracket, or brace), it is ignored with the rest of the line. For example,

    q)1+2 / add one and two
    3

A line which has / as its first character and contains at least one other non-whitespace character is a whole-line comment and is ignored entirely.

A / on a line by itself begins a multiline comment which is terminated by the next \\ on a line by itself.

A \\ on a line by itself with no preceding matching / will comment to end of file.

If a / is not matched by a \\, the multiline comment is unterminated and continues to end of file.

The / and \\ must be the first char on the line, but may be followed by any amount of whitespace.

N.B.: / cannot be used to make an end-of-line comment to a [\\ command](Reference/BackSlash#system "wikilink"), such as setting the timer interval. Use [system](Reference/system "wikilink") instead.

    q)\t 1000 / set timer
    0
    q)\t
    0
    q)system"t 1000" / set timer
    q)\t
    1000

over
----

When / follows a dyadic function, it modifies a function resulting in a function that folds the original over its argument. So for a dyadic function `f`, `f/[y]` is equivalent to f\[f\[..f\[f\[y<sub>0</sub>;y<sub>1</sub>\];y<sub>2</sub>\];..y<sub>n-1</sub>\];y<sub>n</sub>\]; `f/[x;y]` is equivalent to f\[f\[..f\[f\[x;y<sub>0</sub>\];y<sub>1</sub>\];..y<sub>n-1</sub>\];y<sub>n</sub>\]

    q)+/[1 2 3]
    6
    q)+/[10;1 2 3]
    16

When / is following a multivalent function f/\[x;y;z\]~f\[f\[..f\[f\[x;y<sub>0</sub>;z<sub>0</sub>\];y<sub>1</sub>;z<sub>1</sub>\];..y<sub>n-1</sub>;z<sub>n-1</sub>\];y<sub>n</sub>;z<sub>n</sub>\]

    q){x+y+z}/[1 5 6;2 22;3 33]
    61 65 66

When / is following a monadic function f/\[n;x\] is equivalent to f\[f\[..f\[f\[x\]\]..\] where f is called n times

    /first n+2 numbers of fibonacci sequence
    q) fibonacci:{{x,sum -2#x}/[x;0 1]}
    q) fibonacci[10]
    0 1 1 2 3 5 8 13 21 34 55 89

The iteration form of / terminates when either: (1) two successive results agree within comparison tolerance or (2) the result matches the initial input. The latter will save you from some infinite cycles but not all:

    q)(not/) 1b
    0b
    q)(not/) 42
    [never returns]

Also, the related form with \\ can be useful to see the intermediate results. Set \\P to 0 in order to see the convergence of your original computation.

converge
--------

Like [iterate](Reference/BackSlash "wikilink") but only the final result is returned.

    q)({x*x}/)0.1
    0f
    q){x*x}/[0.1]   / alternate syntax
    0f

When / is following a monadic function f/\[g;x\] will apply f to x until g returns 0b

    q){x<1000}{x*x}/2
    65536
    q){x*x}/[{x<1000};2]   / alternate syntax
    65536

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
