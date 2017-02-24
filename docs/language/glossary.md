Ambivalent function
: A _binary_ _derivative_ that, when _applied_ as a _unary_ function, _projects_ its _identity element_.
: <i class="fa fa-hand-o-right"></i> [Derivatives](adverbs/#derivatives), [each-prior](adverbs/#each-prior), [over](adverbs/#over) 

Adverb
: A primitive higher-order function that returns a _derivative_ (derived function)
<i class="fa fa-hand-o-right"></i> [Adverbs](adverbs)

Apply
: As in _apply a function to its arguments_:  pass to a function the value of its _arguments_ for evaluation. A function is applied to an argument list, e.g. `{x+y*z}[3;4;5]`. A _unary_ function can be applied by juxtaposition, e.g. `count 3 4 5`. An _operator_ can also be applied by _infix_, e.g. `2+3`, `2 rotate 3 4 5`. <i class="fa fa-hand-o-right"></i> [Apply](FIXME)

Argument, argument list
: A value passed to a function. In `3+4` the arguments are 3 and 4, respectively the left- and right-arguments. In `{x+y*z}[3;4;5]` the three arguments are separated by semicolons and bracketed: `[3;4;5]` is an argument list. 

Atom
: A single instance of a [datatype](datatypes), eg `42`, `"a"`, `1b`, `2012.09.15`

Binary function 
: A function with _rank_ 2, i.e. that takes 2 arguments, e.g. `+`, `rotate`

Conform
: Nouns conform if they are all either atoms or lists of the same _count_

Control word
: Control words interrupt the usual evaluation rules, e.g. by omitting expressions, signalling an error, defining a result and terminating evaluation 

Count 
: The number of items in a _list_, keys in a _dictionary_ or rows in a _table_

Derivative
: The derived function returned by an _adverb_.
<i class="fa fa-hand-o-right"></i> [Derivatives](adverbs/#derivatives)

Dictionary
: A map of a list of keys to a list of values

Higher-order function
: A function that returns a function as its result

Identity element
: For function `f` the value `x` such that `y~f[x;y]` for any `y` 
: <i class="fa fa-hand-o-right"></i> [Ambivalent functions](FIXME)

Infix
: _Applying_ an operator to its _arguments_ by writing it between them, e.g.  
`2+3`  applies `+` to 2 and 3

Juxtaposition
: Literally, ‘putting beside’. Juxtaposing a list with a list or atom indexes the former with the latter, e.g. `"abcde"1 4 3`. Juxtaposing a _unary_ function and a noun applies the former to the latter, e.g. `til 5`.

Lambda
: A function defined in the _lambda notation_

Lambda notation
: The notation in which functions are defined: an optional _signature_ followed by a list of expressions, separated by semicolons, and all embraced by curly braces, e.g. `{[a;b](a*a)+(b*b)+2*a*b}`. 

List
: Zero, one, or more _items_ separated by semicolons and enclosed by parentheses, e.g. ``("abc";`John;2012.09.15)`` and `()`. Parentheses and semicolons may be omitted in writing a _vector_

List item
: A member of a _list_: a _noun_, function or _adverb_

Matrix
: A _list_ in which all items are lists of the same _count_

Namespace
: A context in which a name has either one reference or none

Noun
: An _atom_, _list_, _dictionary_, _table_ or _lambda_. To test for a noun, use `{101>abs type x}`

Noun syntax
: Functions and _adverbs_ are not nouns, but parenthesised or as _list items)_ have the syntactic class of nouns and may be treated as such, e.g. `count(+;rotate;/)`

Operator
: A _primitive_ _binary_ function that may be applied _infix_ as well as _prefix_, e.g. `+`, `rotate`

Postfix
: _Applying_ an _adverb_ to its _argument_ by writing it to the right, e.g. `+/` applies `/` to `+`

Prefix
: _Applying_ a function to its _argument/s_ by writing it to the left of them, e.g. `+[2;3]` applies `+` to `[2;3]`

Primitive
: Defined in the q language, not by the programmer

Project, projection
: A function passed fewer _arguments_ than its _rank_ projects those arguments and returns a projection: a function of the unspecified argument/s. <i class="fa fa-hand-o-right"></i> [Projection](FIXME)

Rank
: The number of _arguments_ a function takes. For a _lambda_, the _count_ of arguments in its _signature_, or, where the signature is omitted, by the here highest-numbered of the three default argument names `x` (1), `y` (2) and `z` (3) used in the function definition, e.g. `{x+z}` has rank 3.

Signature
: The list of up to 8 _argument_ names that (optionally) begins a _lambda_, e.g. in `{[a;b](a*a)+(b*b)+2*a*b}`, the argument list `[a;b]` is the signature

Table
: A map of a _list_ of keys to a list of values, which are all lists of the same _count_

Unary function
: A function with _rank_ 2, i.e. that takes 1 _argument_, e.g. `count`

Unsigned function
: A _lambda_ without a _signature_, eg `{x*x}`

Vector
: A _list_ in which all the items have the same [datatype](datatypes). May be written without parentheses and semicolons. <i class="fa fa-hand-o-right"></i> [Nouns](elements/#nouns)

x
: Default name of the first or only _argument_ of an _unsigned_ function

y
: Default name of the second _argument_ of an _unsigned_ function, or right-argument to an _operator_

z
: Default name of the third _argument_ of an _unsigned_ function
