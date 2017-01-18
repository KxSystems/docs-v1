The `parse` function parses a string as a k or q expression, and returns the [parse tree](Reference/parse_tree "wikilink").

The string should be a well-formed k or q expression. kdb+v3.4 can accept newlines within the string, previous versions cannot.

The resulting parse tree can be executed with the [eval](Reference/eval "wikilink") function.

Example
-------

    q)parse "1 2 3 + 5"            / the list 1 2 3 is parsed as a single item
    +
    1 2 3
    5

This function can clarify order of execution. Compare:

    q)parse "1 2 3 +/: 5 7"        / adverb /: applies to verb on its left
    (/:;+)
    1 2 3
    5 7
    q)parse "1 2 3 +neg 5 7"       / neg is applied before +
    +
    1 2 3
    (-:;5 7)

K expressions should be prefixed with "k)", e.g.

`q)parse "k)!10"`

Use `eval` to evaluate the parse tree:

    q)eval parse "1 2 3 +/: 5 7"
    6 7 8
    8 9 10

Explicit definitions in .q are shown in full:

    q)foo:{x+2}
    q)parse "foo each til 5"
    k){x'y}
    `foo
    (k){$[-6h=@x;!x;'`type]};5)

Q sql statements are parsed to the corresponding functional form:

    q)\l sp.q
    q)x:parse "select part:p,qty by sup:s from sp where qty>200,p=`p1"
    q)x
    ?
    `sp
    ,((>;`qty;200);(=;`p;,`p1))
    (,`sup)!,`s
    `part`qty!`p`qty
    q)eval x
    sup| part qty
    ---| --------
    s1 | p1   300
    s2 | p1   300

N.B. Views are special in that they are not parsable (sensibly) with -5!x (parse).

    q)eval parse"a::5"
    5
    q)a
    5
    q)views[]
    `symbol$()

See also
--------

-   [eval](Reference/eval "wikilink")
-   [parse tree](Reference/parse_tree "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
