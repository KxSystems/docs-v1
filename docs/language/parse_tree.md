A parse tree is a q construct which represents an expression, but which is not immediately evaluated. The advantage of this form is that the expression can be evaluated whenever and in whatever context it is needed. The two main functions dealing with parse trees are [`eval`](Reference/eval "wikilink"), which executes a parse tree to determine its value, and [`parse`](Reference/parse "wikilink"), which turns a string containing a valid q statement into a parse tree.

The simplest parse tree is a single constant expression. Note that, in a parse tree, a variable is represented by a symbol containing its name. To represent a symbol or a list of symbols, you will need to use [`enlist`](Reference/enlist "wikilink") on that expression.

    q)eval 45
    45
    q)x:4
    q)eval `x
    4
    q)eval enlist `x
    `x

Any other parse tree takes a form of a list, where the first element is a function and the remaining elements are the function's arguments. Any of these elements can be parse trees of their own. Parse trees may be arbitrarily deep (up to thousands of layers), so any q expression can be represented. For example:

    q)eval (til;4)
    0 1 2 3
    q)eval (/;+)
    +/
    q)eval ((/;+);(til;(+;2;2)))
    6

See also
--------

-   [eval](Reference/eval "wikilink")
-   [parse](Reference/parse "wikilink")

