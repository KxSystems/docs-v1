:: (generic null/global amend/create view/identity function)
============================================================

monadic identity function
-------------------------

  
  
is the monadic identity function--it returns its argument unchanged:

<!-- -->

    q)(::)1
    1

This can be used in statements applying multiple functions to the same data, if one of the operations desired is "do nothing":

    q)(::;avg)@\:1 2 3
    1 2 3
    2f

indexing
--------

Similarly, the identity can also be achieved via indexing, e.g.

    q)1 2 3 ::
    1 2 3

and used in variants thereof for e.g. amends

    q)@[til 10;(::;2 3);2+]
    2 3 6 7 6 7 8 9 10 11

generic null
------------

Unlike previous versions of k, q does not have a dedicated null type. Instead (::) is used to denote a generic null value. For example, functions that return no value, return ::

    q)enlist {1;}[]
    ::

(we use enlist to force q to display a null result, a pure :: is not displayed)

When a monadic function is called with no arguments, :: is passed in:

    q)enlist {x}[]
    ::

Since :: has a type for which no vector variant exists, it is useful to prevent a generic list from being coerced into a vector when all elements happen to be of the same type. This is important when you need to preserve the ability to add non-conforming items later.

    q)x:(1;2;3)
    q)x,:`a
    'type

but

    q)x:(::;1;2)
    q)x,:`a  / ok

[global amend](JB:QforMortals2/functions#Local_and_Global_Variables "wikilink")
-------------------------------------------------------------------------------

When used inside a lambda expression, :: sets a variable in the global scope if the variable is not already defined in local scope, while : sets a variable local to the lambda.

    q)a
    'a
    q){a:1}[]
    1
    q)a
    'a
    q){a::1}[]
    q)a
    1
    q){a:0;a::3;a}[] / :: sets local here as a is already local
    3
    q)a
    1

To set a view from inside a lambda, evaluate its code as a string:

    q)t:([]a:1 2;b:3 4)
    q)v
    'v
    q){get"v::select a from t"}[]
    q)v
    a
    -
    1
    2

[create view](Reference/view "wikilink")
----------------------------------------

dependency::expression

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
