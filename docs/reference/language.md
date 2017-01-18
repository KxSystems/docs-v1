#### Syntax

Grammar is E comprising *e*xpression, *n*oun, *f*unction, *t*erm with words *N*oun, *V*erb, *A*dverb

`  E:E;e|e e:nve|te| t:n|v v:tA|V n:t[E]|{E}|(E)|[E]|N    with restrictions`

##### Words

    V: <>|[-+*%=<>~?.@^$#_,!|&amp;:]:?

    A: ('|/|\):?

    N:char|sym|number|time|tspan|year|month|day|stamp|z
     char  : "([\\.]|[^"])*"
     sym   : (`|(`[a-zA-Z0-9][.:_a-zA-Z0-9]*))+
     number: 0x[0-9a-f]+   
             ([^]})0-9a-zA-Z]-)?([0-9]+([.][0-9]*)[hijef]?| *)+
     n     : [0-9]
     minute: <n><n>:<n><n>
     second: <minute>:<n><n>
     time  : <second>.<n>+
     tspan : <n>+D<time>
     year  : <n><n><n><n>
     month : <year>[.]<n><n>m
     day   : <year>[.]<n><n>[.]<n><n>
     stamp : <day>D<time>
         z : <day>T<time>

     name  : [a-zA-Z][a-zA-Z0-9_]*
     commt : (^|[ ]+)/.*$

[Reference/Syntax](Reference/Syntax "wikilink")
-----------------------------------------------

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

[Reference/Grammar](Reference/Grammar "wikilink")
-------------------------------------------------

Q has four object types: noun, function, verb and adverb:

    q)sales:2 7 1 8                 / noun sales

    q)sum sales                     / function sum
    18

    q)sales * 10                    / verb *
    20 70 10 80

    q)sales */: 2 10                / adverb /:
    4  14 2  16
    20 70 10 80

Verbs differ from functions in that they may be called (and typically are called) with arguments to left and right. A verb may also be called with both arguments on the right, as in:

    q)*[sales;10]
    20 70 10 80

*Remark:* in some kdb+/q texts, the terms verb and function are used interchangeably, with qualifiers to indicate whether arguments are on the right, or to the left and right. Instead, this reference distinguishes verb from function.

*Reference/types lists type 100h is "lambda", verbs and lambdas are functions*

*Remark:* q has no ambivalent functions, unlike the underlying k language.

*yes it does - $(cond)*
