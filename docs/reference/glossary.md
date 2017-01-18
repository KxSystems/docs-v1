#### Adverb

"Adverbs modify the verb" (and the [function](#Function "wikilink")). An adverb is any function where the [x](#x "wikilink") parameter is a function. eg: `filter:{y` `where` `x` `y}`.

The primitive adverbs are `'` `/` `\` `':` `/:` `\:`. For convenience, q defines the adverbs [each](Reference/each "wikilink"), [over](Reference/over "wikilink"), [scan](Reference/scan "wikilink") and [prior](Reference/prior "wikilink") (corresponding to the adverbs `'` `/` `\` `':`).

see [Adverb](Reference/Adverb "wikilink")

#### Apply

Apply evaluates a function (and indexes lists and dictionaries). Usually, a space is apply, as in `neg` `1`. To apply more than one argument to a function, use [dot](Reference/DotSymbol "wikilink") `(+).(1` `2)`. Dyadic `.` and [`@`](Reference/AtSymbol "wikilink") are both known as apply.

#### Argument

An argument is a value passed to a function. In 3+4, the arguments are 3 and 4. 3 is referred to as *x* and 4 as *y*.

#### Control Word

Control words like `if`, `:` (return), `'` (signal) break the usual evaluation rules by

-   not evaluating all arguments
-   causing an expression to result in a value and aborting further evaluation

or

-   aborting evaluation of an expression

#### Function

A function is a catchall term for a lambda, verb, projection, composition, bound adverb or dynamically loaded code. [Apply](#Apply "wikilink") operates on tables, dictionaries and lists and so these types can be used in place of a function.

#### Lambda

A lambda is defined using the syntax of matching braces. eg `{x+y}`. A lambda is syntactically a noun, has type 100h and it is a function.

#### Noun

A noun is an atom, list, dictionary, table or a lambda. To test for a noun, use `{101>abs` `type` `x}`

#### Parameter

`q){x+y}[3;4]              /x and y are parameters`
`q)c:{[a;b]sqrt (a*a)+b*b} /a and b are parameters`

#### Verb

A verb is a primitive [function](#Function "wikilink") like +,-,div,deltas,group. Dyadic verbs permit the x parameter to appear to the left as in `3+4`. Dyadic lambdas must apply their arguments. eg: `{x+y}[3;4]`.

#### x

x is short for "the first argument". x is 3 in `3+4` and in `til` `3`

#### y

y is short for "the second argument". y is 4 in `3+4`.
