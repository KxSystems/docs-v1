A *function* takes its argument on the right.

Syntax
------

The canonical form of the right argument is a semicolon-delimited list of parameters given in brackets:

  
  
f\[a<sub>1</sub>;a<sub>2</sub>;...;a<sub>n</sub>\]

Note that the expression in brackets gives n parameters to the function, but is not itself a q list, i.e. it is *not* the same as:

  
  
(a<sub>1</sub>;a<sub>2</sub>;...;a<sub>n</sub>)

Where a function takes only a single parameter, the brackets are not needed, so the following are the same:

  
  
f\[a1\]

f a1

Where a function takes no parameter, it can be called with empty brackets, or given an argument which is ignored:

  
  
f\[\]

f a1 / a1 is ignored

Action on Lists
---------------

Functions can be atomic, aggregate or uniform (or none of these):

-   an *atomic* function returns an atom for each atom in its argument
-   an *aggregate* function returns an atom from a list
-   a *uniform* function returns a list from a list

For example:

    q)signum 0 2 -3 5           / atomic
    0 1 -1 1
    q)sum 2 3 5 7               / aggregate
    17
    q)sums 2 3 5 7              / uniform
    2 5 10 17
    q)distinct 2 3 5 7 2 5      / none of the above
    2 3 5 7

Definition
----------

A function is created by assignment, in one of two ways:

-   as an explicit definition, given as a list of statements in matching braces
-   using q functional forms: adverbs and function projection

Explicit Definition
-------------------

An explicit definition has a list of statements, separated by semi-colons, and enclosed in matching braces, `{` `}`. The arguments to the definition can optionally be named, as a list in square brackets, `[` `]`. If the arguments are not so named, then names `x`, `y` and `z` refer to the first three arguments. The format is:

  
  
f:{\[p<sub>1</sub>;...;p<sub>m</sub>\]e<sub>1</sub>;...;e<sub>n</sub>}

where the optional \[p<sub>1</sub>;...;p<sub>m</sub>\] are named arguments, and e<sub>1</sub>;...;e<sub>n</sub> is a sequence of expressions to be evaluated.

A function can be defined and used without giving it a name, for example:

    q){10+3*x} 1 2 3 13
    13 16 19 49

The result of the function is the result of the last statement evaluated. If the last statement is empty, the result is the generic null (which is not displayed):

    q)f:{2*x;}      / last statement is empty
    q)f 10          / no result shown
    q)(::)~f 10     / matches generic null
    1b

### Return and Signal

Return and signal end execution early:

-   *return* ends successfully
-   *signal* aborts execution (after an error)

To terminate and return a value, use assignment `:` with no name to the left.

    q)f:{a:3*x;:a;a+10}            / the final a+10 is never executed
    q)f 1
    3

To abort function execution, use signal `'` with an error message to its right:

    q)f:{a:3*x;'"end here";a+10}   / the final a+10 is never executed
    q)f 1
    'end here
    10

### Local and Global

Names assigned with `:` are local to the definition, and names assigned with `::` are global:

    q)a:b:0                      / set (global) a and b to 0
    q)f:{a:10+3*x;b::100+a;}     / f defines local a, global b
    q)f 1 2 3                    / run f
    q)a                          / global a is unchanged
    0
    q)b                          / global b is updated
    113 116 119

A local variable exists only from the time it is first assigned. A name referenced that is not a local variable, is searched for globally:

    q)a:100                     / assign global a
    q)f:{a+x}                   / f references a
    q)f 1 2 3
    101 102 103

### Conditional Evaluation

Functions `$` and `?` allow conditional evaluation, see:

-   [Reference/DollarSign](Reference/DollarSign "wikilink")
-   [Reference/QuestionSymbol](Reference/QuestionSymbol "wikilink")

### Control Words

Functions `if`, `do` and `while` control the order of execution, see:

-   [Reference/if](Reference/if "wikilink")
-   [Reference/do](Reference/do "wikilink")
-   [Reference/while](Reference/while "wikilink")

Functional Forms
----------------

A function can also be defined from one of two functional forms: adverbs and function projection.

For *adverbs*, see [adverbs](Reference/Adverb "wikilink").

Function *projection* occurs when a function or verb is given only a subset of its arguments - this results in a new function whose arguments are those not yet given. For example, this is useful when a function is to be called repeatedly with some of its arguments unchanged:

    q)f:{x + 2 * y - z}       / f takes 3 arguments
    q)f[100;10;2 3 5]
    116 114 110

    q)g:f[100]                / g is projection of f on first argument
    q)g[10;2 3 5]             / g takes 2 arguments
    116 114 110

    q)g:f[100;;2 3 5]         / project on first and third arguments
    q)g 10                    / g now takes 1 argument
    116 114 110
