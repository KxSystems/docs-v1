Adverb
: A primitive higher-order function that returns a _derived function_
<i class="fa fa-hand-o-right"></i> [Adverbs](adverbs)

Apply
: As in _apply a function to its arguments_:  pass to a function the value of its arguments for evaluation. A function is applied to an argument list, e.g. `{x+y*z}[3;4;5]`. A unary function can be applied by juxtaposition, e.g. `count 3 4 5`. An operator is a primitive binary function that can also be applied by infix, e.g. `2+3`, `2 rotate 3 4 5`. <i class="fa fa-hand-o-right"></i> [Apply](FIXME)

Argument, argument list
: A value passed to a function. In `3+4` the arguments are 3 and 4, respectively the left- and right-arguments. In `{x+y*z}[3;4;5]` the three arguments are separated by semicolons and bracketed: `[3;4;5]` is an argument list. 

Atom
: A single instance of a [datatype](datatypes)

Binary function 
: A function with _rank_ 2, i.e. that takes 2 arguments, e.g. `+`

Control word
: Control words interrupt the usual evaluation rules, e.g. by omitting expressions, signalling an error, defining a result and terminating evaluation 

Derivative, derived function
: The function returned by an _adverb_.
<i class="fa fa-hand-o-right"></i> [Derivatives](adverbs/#derivatives)

Dictionary
: A map of a list of keys to a list of values

Higher-order function
: A function that returns a function as its result

Infix
: _Applying_ an operator to its _arguments_ by writing it between them, e.g.  
`2+3`   
`2 cut 3 4 5 6 7`

Lambda, lambda notation
: The notation in which a function is defined: an optional _signature_ followed by a list of expressions, separated by semicolons, e.g.  
`{[a;b](a*a)+(b*b)+2*a*b}`. A lambda is a function defined in the lambda notation. 

List
: Zero, one, or more items separated by semicolons and enclosed by parentheses, e.g. ``("abc";`John;2012.09.15)`` and `()`. A list item may an atom or itself a list. <i class="fa fa-hand-o-right"></i> _Vector_

Matrix
: A list in which all items are lists of the same count

Noun
: A noun is an atom, list, dictionary, table or a lambda. To test for a noun, use `{101>abs type x}`

Operator
: A _primitive_ _binary_ function that may be applied _infix_ as well as _prefix_, e.g. `+`, `rotate`

Postfix
: _Applying_ an _adverb_ to its _argument_ by writing it to the right, e.g. `+/` 

Prefix
: _Applying_ a function to its _argument/s_ by writing it to the left of them, e.g. `+[2;3]` 

Primitive
: Defined in the q language, not by the programmer

Rank
: The number of _arguments_ a function takes, given by the count of arguments in its _signature_, or, where the signature is omitted, by the highest-numbered of the three default argument names `x` (1), `y` (2) and `z` (3) used in the function definition, e.g. `{x+z}` has rank 3.

Signature
: The list of up to 8 _argument_ names that (optionally) begins a function definition in the _lambda notation_, e.g. in `{[a;b](a*a)+(b*b)+2*a*b}`, the argument list `[a;b]` is the signature

Table
: A map of a list of keys to a list of values, which are all lists of the same count

Unary function
: A function with rank 2, i.e. that takes 1 argument, e.g. `count`

Unsigned function
: A function defined in the _lambda notation_ without a _signature_

Vector
: A _list_ in which all the items have the same [datatype](datatypes). May be written without parentheses and semicolons. <i class="fa fa-hand-o-right"></i> [Nouns](elements/#nouns)

x
: Default name of the first or only _argument_ of an _unsigned_ function

y
: Default name of the second _argument_ of an _unsigned_ function, or right-argument to an _operator_

z
: Default name of the third _argument_ of an _unsigned_ function
