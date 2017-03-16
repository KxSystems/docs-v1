> Ontology asks, _What exists?_,  
> to which the answer is _Everything_.  
> — W.V.O. Quine, _Word and Object_


## Comments

Line comment
```q
q)/Oh what a lovely day
```
Trailing comment
```q
q)2+2  /I know this one
4
```
Multiline comment
```q
/
    Oh what a beautiful morning
    Oh what a wonderful day
\
a:42
\
ignore this and what follows
the restroom at the end of the universe
```


## Nouns

<div class="kx-compact" markdown="1">

| noun                 | examples                                                             |
|----------------------|----------------------------------------------------------------------|
| atom                 | `42`; `"a"`; `1b`; `2012.08.04`; `` `ibm``                           |
| vector               | `(43;44;45)`; `"abc"`; `0101b`; `` `ibm`goo``; `2012.09.15 2012.07.05` |
| list                 | `(43;"44";45)`; `("abc";0101b;)`;``(("abc";1 2 3); `ibm`abc)``       |
| dictionary           | `` `a`b`c!42 43 44``; `` `name`age!(`john`carol`ted;42 43)``      |
| table                | ``([]name:`john`carol`ted; age:42 43 44)``                           | 
| keyed table          | ``([name:`john`carol`ted] age:42 43 44)``                            | 

</div>

Lists are zero or more items, separated by semicolons, and enclosed in parentheses. An item can be any noun. 

A _vector_ is a list in which all items are of the same datatype. It can be represented without parentheses. Numeric, boolean, char and symbol vectors have their own forms.
<div class="kx-compact" markdown="1">

| type    | example                 |
|---------|-------------------------|
| numeric | `42 43 44`              |
| date    | `2012.09.15 2012.07.05` |
| char    | `"abc"`                 |
| boolean | `0101b`                 |
| symbol  | `` `ibm`att`ora``       |

</div>

The syntactic class of nouns includes all data structures. Operators, functions and adverbs can be given noun syntax by listing or parenthesising them. 
```q
q)count(+)
1
q)count(+;within;\)
3
```

### Attributes

==FIXME==

## Names and namespaces

Names consist of upper- and lower-case alphabetics. They may contain, but not begin with, underscores and numbers. For example: `a`, `foo`, `foo2_bar`. 

> What in the world is a namespace?  
> — Kenneth E. Iverson

A [namespace](https://en.wikipedia.org/wiki/Namespace) is a container or context within which a name resolves to a unique value. Namespaces are children of the _root namespace_ (usually just _root_) and are designated by a dot prefix. Names in the root have no prefix. The root namespace of a q session is parent to multiple namespaces, e.g. `h`, `Q` and `z`. (Namespaces with 1-character names – of either case – are reserved for use by Kx.) 
```q
q).z.p                         / GMT timestamp
2017.02.01D14:58:38.579614000
```

<a class="fa fa-hand-o-right"></a> [Names in context](FIXME)


## Functions

Functions are:

1. operators and primitive functions, eg `+`, `count`
2. as defined in the [lambda notation](#definition), eg `{x+2*y}`
3. as derived from (1) and (2) by [adverbs](adverbs), eg `+/`, `count'`
4. q-SQL functions, e.g. `select`

Functions are first-class objects and can be passed as arguments to other functions. Functions that take other functions as arguments are known as _higher-order functions_.


## Operators

Operators are primitive binary functions that may be applied infix. 
```q
q)|[2;3]                 / maximum, prefix form
3
q)2|3                    / maximum, infix form
3
q)rotate[2;0 1 2 3 4 5]  / prefix form
2 3 4 5 0 1
q)2 rotate 0 1 2 3 4 5   / infix form
2 3 4 5 0 1
```
Operators are denoted by glyphs or [reserved words](#reserved-words) or both. 
They cannot be defined using the [lambda notation](#definition). 

<div class="kx-compact" markdown="1">

| glyph | operator  | glyph | operator           | glyph | operator       | glyph | operator              |
|-------|-----------|-------|--------------------|-------|----------------|-------|-----------------------|
| `=`   | equal     | `<>`  | not equal          | `~`   | match          |
| `<`   | less than | `<=`  | less than or equal | `>`   | greater than   | `>=`  | greater than or equal |
| `+`   | plus      | `-`   | minus              | `*`   | times          | `%`   | divided by            |
| `&`   | minimum   | `|`   | maximum            |
| `#`   | take      | `,`   | join               | `^`   | fill; coalesce | `_`   | drop; cut             |
| `!`   | dict; key; enum; update; delete | 

</div>

!!! note "Minimum and maximum"
    The _minimum_ operator is denoted by both the `&` glyph and the reserved word `and`. The _maximum_ operator is denoted by both the `|` glyph and the reserved word `or`. 


## Reserved words

The following reserved words denote operators.

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`and`](reference/logic/#and "minimum"), [`asof`](reference/joins/#asof "as-of verb")</td></tr>
<tr><td>B</td><td>[`bin`](reference/searchfunctions/#bin-binr "binary search"), [`binr`](reference/searchfunctions/#bin-binr "binary search right")</td></tr>
<tr><td>C</td><td>[`cor`](reference/stats-aggregates/#cor "correlation"), [`cov`](reference/trigonometry/#cov "statistical covariance"), [`cross`](reference/listfunctions/#cross "cross product"), [`cut`](reference/listfunctions/#cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`div`](reference/arithmetic-integer/#div "integer division"), [`dsave`](reference/filewords/#dsave "save global tables to disk")</td></tr>
<tr><td>E</td><td>[`each`](reference/evaluationcontrol/#each "apply to each element"), [`ema`](reference/stats-moving/#ema "exponentially-weighted moving average"), [`except`](reference/selectionfunctions/#except "left argument without elements in right argument")</td></tr>
<tr><td>F</td><td>[`fby`](reference/qsqlfunctions/#fby "filter-by")</td></tr>
<tr><td>I</td><td>[`ij`](reference/joins/#ij "inner join"), [`in`](reference/searchfunctions/#in "membership"), [`insert`](reference/qsqlfunctions/#insert "append records to a table"), [`inter`](reference/selectionfunctions/#inter "elements common to both arguments")</td></tr>
<tr><td>L</td><td>[`like`](reference/textfunctions/#like "pattern matching"), [`lj`](reference/joins/#lj "left join"), [`ljf`](reference/joins/#lj "left join"), [`lsq`](reference/matrixes/#lsq "least squares – matrix divide")</td></tr>
<tr><td>M</td><td>[`mavg`](reference/stats-moving/#mavg "moving average"), [`mcount`](reference/stats-moving/#mcount "moving count"), [`mdev`](reference/stats-moving/#mdev "moving deviation"), [`mmax`](reference/stats-moving/#mmax "moving maxima"), [`mmin`](reference/stats-moving/#mmin "moving minima"), [`mmu`](reference/matrixes/#mmu "matrix multiplication"), [`mod`](reference/arithmetic-integer/#mod "remainder"), [`msum`](reference/stats-moving/#msum "moving sum")</td></tr>
<tr><td>O</td><td>[`or`](reference/logic/#or "maximum"), [`over`](reference/evaluationcontrol/#over "reduce an array with a function")</td></tr>
<tr><td>P</td><td>[`peach`](reference/evaluationcontrol/#peach "parallel each"), [`pj`](reference/joins/#pj "plus join"), [`prior`](reference/selectionfunctions/#prior "apply function between each element and its predecessor")</td></tr>
<tr><td>S</td><td>[`scan`](reference/evaluationcontrol/#scan "apply function to successive elements"), [`scov`](reference/stats-aggregates/#scov "statistical covariance"), [`set`](reference/filewords/#set "asign a value to a name"), [`setenv`](reference/os/#setenv "set an environment variable")[`ss`](reference/textfunctions/#ss "string search"), [`sublist`](reference/selectionfunctions/#sublist "sublist of a list"), [`sv` consolidate](reference/listfunctions/#sv "consolidate")</td></tr>
<tr><td>U</td><td>[`uj`](reference/joins/#uj "union join"), [`union`](reference/listfunctions/#union "distinct elements of combination of two lists"), [`upsert`](reference/qsqlfunctions/#upsert "add table records")</td></tr>
<tr><td>V</td><td>[`vs` encode](reference/casting/#vs "encode"), [`vs` split](reference/listfunctions/#vs "split")</td></tr>
<tr><td>W</td><td>[`wavg`](reference/stats-aggregates/#wavg "weighted average"), [`within`](reference/searchfunctions/#within "flag elements within range"), [`wsum`](reference/stats-aggregates/#wsum "weighted sum")</td></tr>
<tr><td>X</td><td>[`xasc`](reference/sortfunctions/#xasc "table sorted ascending by columns"), [`xbar`](reference/arithmetic-integer/#xbar "interval bar"), [`xcol`](reference/dictionariesandtables/#xcol "rename table columns"), [`xcols`](reference/dictionariesandtables/#xcols "re-order table columns"), [`xdesc`](reference/sortfunctions/#xdesc "table sorted decending by columns"), [`xexp`](reference/arithmetic-float/#xexp "raised to a power"), [`xgroup`](reference/dictionariesandtables/#xgroup "table grouped by keys"), [`xkey`](reference/dictionariesandtables/#xkey "set primary keys of a table"), [`xlog`](reference/arithmetic-float/#xlog "base-x logarithm"), [`xprev`](reference/selectionfunctions/#xprev "previous elements"), [`xrank`](reference/sortfunctions/#xrank "items assigned to buckets")</td></tr>
</table>


## Adverbs 

[Adverbs](adverbs) are primitive higher-order functions: they return _derivatives_ (derived functions). They are denoted by six overloaded glyphs: `'`, `/`, `\`, `':`, `/:` and `\:`. 
```q
q)+/[2 3 4]  / reduce 2 3 4 with +
9
q)*/[2 3 4]  / reduce 2 3 4 with *
24
```
<i class="fa fa-hand-o-right"></i> [adverb syntax](syntax/#adverbs)


## Control words

The control words `do`, `if` and `while` [govern evaluation](evaluationcontrol).


## System commands

Expressions beginning with `\` are [system commands](system-commands) or multiline comments (see above). 
```q
q)/ load the script in file my_app.q
q)\l my_app.q
```


## Scripts

A script is a text file; its lines a list of expressions and/or system commands, to be executed in sequence. By convention, script files have the extension `q`.

Within a script 

- function definitions may extend over multiple lines
- an empty comment begins a _multiline comment_. 

