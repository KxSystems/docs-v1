trap (. and @)
==============

See also [signal(')](Reference/Apostrophe#signal "wikilink")

Triadic @ and . are trap when x is a function. trap is similar to other languages' try..catch.

When there is no signal, @ behaves like dyadic @:

`` q)@[string;42;`err] ``
`"42"`

In this example, trap evaluates `{'x}@"signal` `this"` which signals and so the result of the expression is the third argument.

`` q)@[{'x};"signal this";`err] ``
`` `err ``

If the third argument is a function, it is called with the value of the signal.

`` q)@[{'x};"signal this";(`e;)] ``
`` `e ``
`"signal this"`

This can be used to return a result unambiguously indicating whether the function succeeded. Here, the first element of the pair indicates success or failure, while the second element is either the result or the error. This is useful when the function being called might return arbitrary results (i.e. when `0` or `()` might be valid results).

`q)@[(1b;){1+x}@;0;(0b;)]`
`1b`
`1`
`` q)@[(1b;){1+x}@;`a;(0b;)] ``
`0b`
`"type"`
`q)`

`@[f;x;t]` is equivalent to `.[f;enlist` `x;t]`. "dot" trap is used for polyadic f.

`` q).[*;(42;42);`err] ``
`1764`

Examples

`` q)@[parse;"1b1";`err] ``
`` `err ``
`q)@[parse;"22 1b1 44";::]`
`"1b1"`

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
