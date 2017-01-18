`value` performs several functions depending on its argument.

Syntax
------

    q)r:value X

Returns the values of a dictionary:

    q)d:`q`w`e!(1 2;3 4;5 6)
    q)value d
    1 2
    3 4
    5 6

Given a symbol, it returns the value of the symbol name:

    q)a:1 2 3
    q)`a
    `a
    q)value `a
    1 2 3

When the argument is enumerated, it returns the corresponding symbol list:

    q)e:`a`b`c
    q)x:`e$`a`a`c`b
    q)x
    `e$`a`a`c`b
    q)value x
    `a`a`c`b

Given a function, it returns the list

  
  
(bytecode;parameters;locals;(context;globals);constants\[0\];...;constants\[n\];definition)

<!-- -->

    q)f:{[a;b]d::neg c:a*b+5;c+e}
    q)value f
    0xa0794178430316220b048100028276410004
    `a`b
    ,`c
    ``d`e
    5
    "{[a;b]d::neg c:a*b+5;c+e}"
    q)/ Now define in .test context - globals refer to current context of test
    q)\d .test
    q.test)f:{[a;b]d::neg c:a*b+5;c+e}
    q.test)value f
    0xa0794178430316220b048100028276410004
    `a`b
    ,`c
    `test`d`e
    5
    "{[a;b]d::neg c:a*b+5;c+e}"

Given a view object, it returns the list

  
  
(cached value;parse tree;dependencies;definition)

When the view is pending, the cached value is `::`.

    q)a:1
    q)b::a+1
    q)get`. `b
    ::
    (+;`a;1)
    ,`a
    "a+1"
    q)b
    2
    q)get`. `b
    2
    (+;`a;1)
    ,`a
    "a+1"
    q)

Given a projection, it returns a list of the function followed by the given parameters:

    q)value +[2]
    +
    2

Given a composition, it returns the list of composed functions:

    q)value differ
    ~:
    ~':

Given a primitive, it returns the internal code for the primitive:

    q)value each (::;+;-;*;%)
    0 1 2 3 4

When the argument is generated from an adverb, it returns the original verb:

    q)f:+/
    q)f 1 2 3
    6
    q)value f
    +

Given a string, it evaluates it in the working context:

    q)value "enlist a:til 5"
    0 1 2 3 4
    q)value "k)<2 7 3 1"
    3 0 2 1
    q)\d .a
    q.a)value"b:2"
    2
    q.a)b
    2
    q.a)\d .
    q)b
    'b
    q).a.b
    2

Given a list, it applies the first element to the rest. If the first element is a symbol, it is evaluated first:

    q)value(+;1;2)
    3
    q)value(`.q.neg;2)
    -2

Remark
------

The function `value` is the same as `get`. By convention `get` is used for file i/o but the two are interchangeable:

    q)get "2+3"                / same as value
    5
    q)value each (get;value)   / same internal code
    19 19

See also
--------

-   [get](Reference/get "wikilink")

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
