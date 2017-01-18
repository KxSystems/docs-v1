Q has:

-   three object syntaxes: *noun*, *verb* and *adverb*. Note that noun syntax is used by both nouns and functions.

<!-- -->

-   a *template* syntax for SQL-like queries, here known as q-SQL

<!-- -->

-   other syntaxes for assignment, explicit definition, table definition, punctuation and scripts

Object Syntax
-------------

Example:

    q)sales:2 7 1 8          / assign list of numbers

    q)sales 1 3              / noun syntax - argument to the right
    7 8

    q)sum sales              / a function has noun syntax
    18

    q)sales * 10             / verb syntax, arguments to left and right
    20 70 10 80

    q)sales */: 2 10         / adverb syntax, argument to the left
    4  14 2  16
    20 70 10 80

Query Template
--------------

Example:

    q)select from p where weight=17
    p | name  color weight city
    --| ------------------------
    p2| bolt  green 17     paris
    p3| screw blue  17     rome

Other Syntax
------------

    a:5                              / local assignment
    a::5                             / global assignment
    f:{y+2*x}                        / {} explicit definition
    ([]sym:`amd`intel;vol:300 500)   / table definition
    (sales-2) * 10                   / () grouping
    /                                / an isolated / is a comment
    \                                / an isolated \ is exit
    \\                               / exit q

See also
--------

::\* add references here...
