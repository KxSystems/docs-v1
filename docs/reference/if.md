Syntax
------

The `if` statement has the form:

  
if\[test;exp<sub>1</sub>;...;exp<sub>n</sub>\]

where the *test* expression is evaluated and the result compared with zero. If not zero, the remaining expressions are evaluated in order. The test expression should return an atom.

`if` does not return a result.

Example
-------

    q)a:100
    q)r:""
    q)if[a>10;a:20;r:"true"]
    q)a
    20
    q)r
    "true"

See also
--------

-   [do](Reference/do "wikilink")
-   [if-else](Reference/DollarSign "wikilink")
-   [while](Reference/while "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
