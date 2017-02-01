\\ ([abort](#abort "wikilink")/[scan](#scan "wikilink")/[iterate](#iterate "wikilink")/[system](#system "wikilink")/[escape](#escape "wikilink"))
=================================================================================================================================================

abort
-----

Type `\` at the debugger (`q))`) prompt to return to the interactive session.

    q)f:{g[]}
    q)g:{'`xyz}
    q)f[]
    {g[]}
    'xyz
    @
    {'`xyz}
    ::
    q))\
    q)

toggle q/k
----------

In the interactive session `\` toggles between q and k prompts:

    q)\
      \
    q)

end of multi-line comment
-------------------------

A multi-line comment starts with a `/` and ends with a `\`.

For example:

    /
    There was an Old Man of Nantucket
    Who kept all his cash in a bucket.
    \

end of script
-------------

In q scripts, `\` on a line by itself marks the end of the q program. The remaining text in the file is ignored. Note that unlike `\\`, `\` does not cause q to terminate after executing the script.

scan
----

If f is a **dyadic** function, f\\ applied to a list x<sub>1</sub>, x<sub>2</sub>, .. x<sub>n</sub> returns x<sub>1</sub>, f(x<sub>1</sub>,x<sub>2</sub>), f(f(x<sub>1</sub>,x<sub>2</sub>),x<sub>3</sub>), ..,f(..,x<sub>n</sub>). For example,

    q)(+\)til 10
    0 1 3 6 10 15 21 28 36 45
    q)+\[til 10]   / alternate syntax
    0 1 3 6 10 15 21 28 36 45

When `f\` is used as a dyad, the first argument is used as the initial value:

    q)1+\1 2 3
    2 4 7
    q)+\[1;1 2 3]   / alternate syntax
    2 4 7

The alternate syntax generalizes to functions of 3 or more arguments where the first argument is used as the initial value and the arguments are corresponding elements from the lists:

    q){(x;y;z)}\[0;1 2 3;4 5 6]
    0           1 4
    0 1 4       2 5
    (0 1 4;2;5) 3 6

As of kdb+3.1 2013.07.07, scan has a built in function for the following

    q){{z+y*x}\[x;y;z]}
    {{z+y*x}\[x;y;z]}
    q){x y\z}    / alternate syntax that uses built in function

Note that for the built in version it is for floats.

iterate
-------

If f is a **monadic** function, f\\ calls f on its argument repeatedly until a value matching the argument or the last seen is produced. The result is the argument followed by all the results except the last. For example:

    q)(neg\)1
    1 -1
    q)(rotate[1]\)"abcd"
    ("abcd";"bcda";"cdab";"dabc")
    q)({x*x}\)0.1
    0.1 0.01 0.0001 1e-08 1e-16 1e-32 1e-64 1e-128 1e-256 0
    q){x*x}\[0.1]   / alternate syntax
    0.1 0.01 0.0001 1e-08 1e-16 1e-32 1e-64 1e-128 1e-256 0

When f\\ is called with two arguments, the first argument can be either an integer number of iterations or a "while" condition, which return an int or boolean, that can be applied to the result of f:

    q)f:1+
    q)f\[3;100]
    100 101 102 103
    q)f\[105>;100]
    100 101 102 103 104 105
    q)f\[105>sum@;84 20]
    84 20
    85 21

Dyadic form of f\\ can also be specified using infix notation:

    q)3 f\100
    100 101 102 103

system
------

`\` followed by a system command results in the command being executed in a subshell and the result returned to q as a list of strings. For example,

    q)\printf hello\\nworld
    "hello"
    "world"

### See also

-   [system](Reference/system "wikilink")

escape
------

When `\` is used inside character or string displays, it serves as an escape character.

|       |                                           |
|-------|-------------------------------------------|
| \\"   | double quote                              |
| \\NNN | character with octal value NNN (3 digits) |
| \\\\  | backslash                                 |
| \\n   | new line                                  |
| \\r   | carriage return                           |
| \\t   | horizontal tab                            |

commands
--------

See [System Commands](Reference/SystemCommands "wikilink").

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
