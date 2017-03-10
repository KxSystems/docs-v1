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

The following reserved words denote operators and primitive functions.

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`and`](http://code.kx.com/wiki/Reference/and "minimum"), [`asof`](http://code.kx.com/wiki/Reference/asof "as-of verb")</td></tr>
<tr><td>B</td><td>[`bin`](http://code.kx.com/wiki/Reference/bin "binary search"), [`binr`](http://code.kx.com/wiki/Reference/bin "binary search right")</td></tr>
<tr><td>C</td><td>[`cor`](http://code.kx.com/wiki/Reference/cor "correlation"), [`cov`](http://code.kx.com/wiki/Reference/cov "statistical covariance"), [`cross`](http://code.kx.com/wiki/Reference/cross "cross product"), [`cut`](http://code.kx.com/wiki/Reference/cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`div`](http://code.kx.com/wiki/Reference/div "integer division"), [dsave](files/#dsave "save global tables") </td></tr>
<tr><td>E</td><td>[`each`](FIXME)</td></tr>
<tr><td>F</td><td>[`fby`](http://code.kx.com/wiki/Reference/fby "filter by")</td></tr>
<tr><td>E</td><td>[`ej`](http://code.kx.com/wiki/Reference/ej "equijoin"), [`ema`](http://code.kx.com/wiki/Reference/ema "exponentially-weighted moving average"), [`except`](http://code.kx.com/wiki/Reference/except "left argument without elements in rigt argument")</td></tr>
<tr><td>I</td><td>[`ij`](http://code.kx.com/wiki/Reference/ij "inner join"), [`in`](http://code.kx.com/wiki/Reference/in "membership"), [`insert`](http://code.kx.com/wiki/Reference/insert "append records to a table"), [`inter`](http://code.kx.com/wiki/Reference/inter "elements common to both arguments")</td></tr>
<tr><td>L</td><td>[`like`](textfunctions/#like "pattern matching"), [`lj`](http://code.kx.com/wiki/Reference/lj "left join"), [`ljf`](http://code.kx.com/wiki/Reference/lj "left join"), [`lsq`](http://code.kx.com/wiki/Reference/lsq "least squares -- matrix divide")</td></tr>
<tr><td>M</td><td>[`mavg`](http://code.kx.com/wiki/Reference/mavg "moving average"), [`mcount`](http://code.kx.com/wiki/Reference/mcount "moving count"), [`mdev`](http://code.kx.com/wiki/Reference/mdev "moving deviation"), [`mmax`](http://code.kx.com/wiki/Reference/mmax "moving maxima"), [`mmin`](http://code.kx.com/wiki/Reference/mmin "moving minima"), [`mmu`](http://code.kx.com/wiki/Reference/mmu "matrix multiplication"), [`mod`](http://code.kx.com/wiki/Reference/mod "remainder"), [`msum`](http://code.kx.com/wiki/Reference/msum "moving sum")</td></tr>
<tr><td>O</td><td>[`or`](http://code.kx.com/wiki/Reference/or "maximum of arguments"), [`over`](FIXME)</td></tr>
<tr><td>P</td><td>[`peach`](FIXME), [`pj`](http://code.kx.com/wiki/Reference/pj "plus join"), [`prior`](FIXME)</td></tr>
<tr><td>S</td><td>[`scan`](FIXME), [`scov`](http://code.kx.com/wiki/Reference/scov "statistical covariance"), [`set`](files/#set "assign a value to a name"), [`setenv`](http://code.kx.com/wiki/Reference/setenv "set an environment variable"), [`sublist`](http://code.kx.com/wiki/Reference/sublist "sublist of a list"), [`sv`](http://code.kx.com/wiki/Reference/sv "atom from a list")</td></tr>
<tr><td>U</td><td>[`uj`](http://code.kx.com/wiki/Reference/uj "union join"), [`union`](http://code.kx.com/wiki/Reference/union "distinct elements of combination of two lists"), [`upsert`](http://code.kx.com/wiki/Reference/upsert "add table records")</td></tr>
<tr><td>V</td><td>[`vs`](http://code.kx.com/wiki/Reference/vs "list from an atom")</td></tr>
<tr><td>W</td><td>[`wavg`](http://code.kx.com/wiki/Reference/wavg "weighted average"), [`within`](http://code.kx.com/wiki/Reference/within "flag elements within range"), [`wsum`](http://code.kx.com/wiki/Reference/wsum "weighted sum")</td></tr>
<tr><td>X</td><td>[`xasc`](http://code.kx.com/wiki/Reference/xasc "table sorted ascending by columns"), [`xbar`](http://code.kx.com/wiki/Reference/xbar "interval bar"), [`xcol`](http://code.kx.com/wiki/Reference/xcol "rename table columns"), [`xcols`](http://code.kx.com/wiki/Reference/xcols "re-order table columns"), [`xdesc`](http://code.kx.com/wiki/Reference/xdesc "table sorted decending by columns"), [`xexp`](http://code.kx.com/wiki/Reference/xexp "raised to a power"), [`xgroup`](http://code.kx.com/wiki/Reference/xgroup "table grouped by keys"), [`xkey`](http://code.kx.com/wiki/Reference/xkey "set primary keys of a table"), [`xlog`](http://code.kx.com/wiki/Reference/xlog "base-x logarithm"), [`xprev`](http://code.kx.com/wiki/Reference/xprev "previous elements"), [`xrank`](http://code.kx.com/wiki/Reference/xrank "items assigned to buckets")</td></tr>
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

