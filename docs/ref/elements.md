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

Attributes are metadata that apply to lists of special form. They are often used on a dictionary domain or a table column to reduce storage requirements or speed retrieval. 

<div class="kx-compact" markdown="1">

| example       |         | overhead               |
|---------------|---------|------------------------|
| `` `s#2 2 3`` | sorted  | `0`                    |
| `` `u#2 4 5`` | unique  | `16*u`                 |
| `` `p#2 2 1`` | parted  | `(4*u;16*u;4*u+1)`     |
| `` `g#2 1 2`` | grouped | `(4*u;16*u;4*u+1;4*n)` |

</div>

The byte overheads use `n` (number of elements) and `u` (number of uniques).

* `` `u`` is for unique lists.
* `` `p`` and `` `g`` are for lists with a lot of repetition.

`` `s#``, `` `u#`` and `` `g#`` are preserved on append in memory, if possible.
Only `` `s#`` is preserved on append to disk.

To set or unset an attribute:
```q
q)`s#1 2 3
`s#1 2 3
q)`#`s#1 2 3
1 2 3
```
Setting or unsetting an attribute other than `s`, i.e. `upg`, causes a copy of the object to be made. Setting/unsetting the `s` attribute on a list which is already sorted will not cause a copy to be made, and hence will affect the original list in-place. Setting the `s` attr on a dictionary or table, where the key is already in sorted order, in order to obtain a step-function, causes the `s` attribute to be set in place for the key but copies the outer object. 
```q
q)t:([1 2 4]y:7 8 9);`s#t;attr each (t;key t)
``s
```


## Names and namespaces

Names consist of upper- and lower-case alphabetics. They may contain, but not begin with, underscores and numbers. For example: `a`, `foo`, `foo2_bar`. 

A [namespace](https://en.wikipedia.org/wiki/Namespace) is a container or context within which a name resolves to a unique value. Namespaces are children of the _root namespace_ (usually just _root_) and are designated by a dot prefix. Names in the root have no prefix. The root namespace of a q session is parent to multiple namespaces, e.g. `h`, `Q` and `z`. (Namespaces with 1-character names – of either case – are reserved for use by Kx.) 
```q
q).z.p                         / UTC timestamp
2017.02.01D14:58:38.579614000
```

!!! tip "Namespaces are dictionaries"
    Namespace contents can be treated as dictionary entries. 
    ```q
    q)v:5
    q).ns.v:6
    q)`.[`v]      / value of v in root namespace
    5
    q)`.ns[`v]    / value of v in ns
    6
    q)`. `v       / indexed by juxtaposition
    5
    q)`.ns `v`v
    6 6
    q)`.`.ns@\:`v
    5 6
    ```

<a class="fa fa-hand-o-right"></a> [Names in context](syntax/#name-scope)


## Functions

Functions are:

1. operators and primitive functions, eg `+`, `count`
2. as defined in the [lambda notation](#definition), eg `{x+2*y}`
3. as _derived_ from (1) and (2) by [adverbs](adverbs), eg `+/`, `count'`
4. q-SQL functions, e.g. `select`

Functions are first-class objects and can be passed as arguments to other functions. Functions that take other functions as arguments are known as _higher-order functions_.

### Reserved words

The following reserved words denote functions that are _not_ also operators. 

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`abs`](arith-integer/#abs "absolute value"), [`acos`](trig/#acos "arc cosine"), [`aj`](joins/#aj-aj0-asof-join "as-of join"), [`aj0`](joins/#aj-aj0-asof-join "as-of join"), [`all`](logic/#all "all nonzero"), [`any`](logic/#any "any item is non-zero"), [`asc`](sort/#asc "ascending sort"), [`asin`](trig/#asin "arc sine"), [`atan`](trig/#atan "arc tangent"), [`attr`](metadata/#attr "attributes"), [`avg`](stats-aggregates/#avg-average "arithmetic mean"), [`avgs`](stats-aggregates/#avgs-averages "running averages")</td></tr>
<tr><td>C</td><td>[`ceiling`](arith-integer/#ceiling "lowest integer above"), [`cols`](metadata/#cols "column names of a table"), [`cos`](trig/#cos "cosine"), [`count`](lists/#count "number of items")</td></tr>
<tr><td>D</td><td>[`delete`](qsql/#delete "delete rows or columns from a table"), [`deltas`](arith-integer/#deltas "differences between consecutive pairs"), [`desc`](sort/#desc "descending sort"), [`dev`](stats-aggregates/#dev-standard-deviation "standard deviation"), [`differ`](comparison/#differ "flag differences in consecutive pairs"), [`distinct`](search/#distinct "unique items")</td></tr>
<tr><td>E</td><td>[`ej`](joins/#ej-equi-join "equi-join"), [`enlist`](lists/#enlist "arguments as a list"), [`eval`](parsetrees/#eval "evaluate a parse tree"), [`exec`](qsql/#exec), [`exit`](errors/#exit "terminate q"), [`exp`](arith-float/#exp "power of e")</td></tr>
<tr><td>F</td><td>[`fills`](lists/#fills "forward-fill nulls"), [`first`](select/#first "first item"), [`fkeys`](metadata/#fkeys "foreign-key columns mapped to their tables"), [`flip`](lists/#flip "transpose"), [`floor`](arith-integer/#floor "greatest integer less than argument")</td></tr>
<tr><td>G</td><td>[`get`](filewords/#get "get a q data file"), [`getenv`](os/#getenv "value of an environment variable"), [`group`](dictsandtables/#group "dictionary of distinct items"), [`gtime`](os/#gtime "UTC timestamp")</td></tr>
<tr><td>H</td><td>[`hclose`](filewords/#hclose "close a file or process"), [`hcount`](filewords/#hcount "size of a file"), [`hdel`](filewords/#hdel "delete a file"), [`hopen`](filewords/#hopen "open a file"), [`hsym`](filewords/#hsym "convert symbol to filename or IP address")</td></tr>
<tr><td>I</td><td>[`iasc`](sort/#iasc "indices of ascending sort"), [`idesc`](sort/#idesc "indices of descending sort"), [`inv`](matrixes/#inv "matrix inverse")</td></tr>
<tr><td>K</td><td>[`key`](metadata/#key "keys of a dictionary etc."), [`keys`](metadata/#keys "names of a table's columns")</td></tr>
<tr><td>L</td><td>[`last`](select/#last "last item"), [`load`](filewords/#load "load binary data"), [`log`](arith-float/#log "natural logarithm"), [`lower`](strings/#lower "lower case"), [`ltime`](os/#ltime "local timestamp"), [`ltrim`](strings/#ltrim "function remove leading spaces")</td></tr>
<tr><td>M</td><td>[`max`](stats-aggregates/#max-maximum "maximum"), [`maxs`](stats-aggregates/#maxs-maximums "maxima of preceding items"), [`md5`](strings/#md5 "MD5 hash"), [`med`](stats-aggregates/#med-median "median"), [`meta`](metadata/#meta "metadata of a table"), [`min`](stats-aggregates/#min-minimum "minimum"), [`mins`](stats-aggregates/#mins-minimums "minimum of preceding items")</td></tr>
<tr><td>N</td><td>[`neg`](arith-integer/#neg "negate"), [`next`](select/#next "next items"), [`not`](logic/#not "logical not"), [`null`](logic/#null "is argument a null")</td></tr>
<tr><td>P</td><td>[`parse`](parsetrees/#parse "parse a string"), [`prd`](arith-float/#prd "– product"), [`prds`](arith-float/#prds "cumulative products"), [`prev`](select/#prev "previous items")</td></tr>
<tr><td>R</td><td>[`rand`](random/#rand "random number"), [`rank`](sort/#rank "grade up"), [`ratios`](arith-float/#ratios "ratios of consecutive pairs"), [`raze`](lists/#raze "join items"), [`read0`](filewords/#read0 "read file as lines"), [`read1`](filewords/#read1 "read file as bytes"), [`reciprocal`](arith-float/#reciprocal "reciprocal of a number"), [`reval`](parsetrees/#reval "variation of eval"), [`reverse`](lists/#reverse "reverse the order of items"), [`rload`](filewords/#rload "load a splayed table"), [`rotate`](lists/#rotate "rotate items"), [`rsave`](filewords/#rsave), [`rtrim`](strings/#rtrim "remove trailing spaces")</td></tr>
<tr><td>S</td><td>[`save`](filewords/#save "save global data to file"), [`sdev`](stats-aggregates/#sdev-statistical-standard-deviation "statistical standard deviation"), [`select`](qsql/#select "select columns from a table"), [`show`](devtools/#show "format to the console"), [`signum`](arith-integer/#signum "sign of its argument/s"), [`sin`](trig/#sin "sine"), [`sqrt`](arith-float/#sqrt "square root"), [`ssr`](strings/#ssr "string search and replace"), [`string`](casting/#string "cast to string"), [`sublist`](select/#sublist "sublist of a list"), [`sum`](arith-integer/#sum "sum of a list"), [`sums`](arith-integer/#sums "cumulative sums of a list"), [`sv` decode](casting/#sv "decode"), [`svar`](stats-aggregates/#svar-statistical-variance "statistical variance"), [`system`](syscmds/#system "execute system command")</td></tr>
<tr><td>T</td><td>[`tables`](metadata/#tables "sorted list of tables"), [`tan`](trig/#tan "tangent"), [`til`](arith-integer/#til "integers up to x"), [`trim`](strings/#trim "remove leading and trailing spaces"), [`type`](metadata/#type "– data type")</td></tr>
<tr><td>U</td><td>[`ungroup`](dictsandtables/#ungroup "flattened table"), [`update`](qsql/#update "insert or replace table records"), [`upper`](strings/#upper "upper-case")</td></tr>
<tr><td>V</td><td>[`value`](metadata/#value "value of a variable or dictionary key; value of an executed sting"), [`var`](stats-aggregates/#var-variance "variance"), [`view`](metadata/#view "definition of a dependency"), [`views`](metadata/#views "list of defined views")</td></tr>
<tr><td>W</td><td>[`where`](select/#where "replicated items"), [`wj`](joins/#wj-wj1-window-join "window join"), [`wj1`](joins/#wj-wj1-window-join "window join")</td></tr>
</table>

<i class="fa fa-hand-o-right"></i> [`.Q.res`](dotq/#qres-k-words) (reserved words)



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
Operators are denoted by glyphs or reserved words or both – see note below on _minimum_ and _maximum_. 
(They cannot be defined using the [lambda notation](#definition).) 

### Glyphs
<table class="kx-compact" markdown="1">
<tr><td>[`=`](comparison)</td><td>[equal](comparison)</td><td>[`<>`](comparison)</td><td>[not equal](comparison)</td><td>[`~`](comparison)</td><td>[match](comparison)</td></tr>
<tr><td>[`<`](comparison)</td><td>[less than](comparison)</td><td>[`<=`](comparison)</td><td>[less than or equal](comparison)</td><td>[`>`](comparison)</td><td>[greater than](comparison)</td><td>[`>=`](comparison)</td><td>[greater than or equal](comparison)</td></tr>
<tr><td>[`+`](arith-integer/#add)</td><td>[plus](arith-integer/#add)</td><td>[`-`](arith-integer/#minus)</td><td>[minus](arith-integer/#minus)</td><td>[`*`](arith-integer/#multiply])</td><td>[times](arith-integer/#multiply)</td><td>[`%`](arith-float/#divide)</td><td>[divided by](arith-float/#divide)</td></tr>
<tr><td>[`&`](arith-integer/#and-minimum)</td><td>[minimum](arith-integer/#and-minimum)</td><td>[`|`](arith-integer/#and-maximum)</td><td>[maximum](arith-integer/#and-maximum)</td></tr>
<tr><td>[`#`](lists/#take)</td><td>[take](lists/#take)</td><td>[`,`](lists/#join)</td><td>[join](lists/#join)</td><td>`^`</td><td>[fill](lists/#fill); [coalesce](joins/#coalesce)</td><td>`_`</td><td>[drop](lists/#drop); [cut](lists/#cut)</td></tr>
<tr><td>`!`</td><td colspan="7">[dict](dictsandtables/#dict); [key](dictsandtables/#key); [enumerate](enums/#enumerate); [ints to enum](casting/#ints-to-enum); [update](funsql/#update); [delete](funsql/#delete)</td></tr>
</table>

!!! note "Minimum and maximum"
    The _minimum_ operator is denoted by both the `&` glyph and the reserved word `and`. The _maximum_ operator is denoted by both the `|` glyph and the reserved word `or`. 


### Reserved words

The following reserved words denote operators.

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`and`](logic/#and-minimum "minimum"), [`asof`](joins/#asof "as-of operator")</td></tr>
<tr><td>B</td><td>[`bin`](search/#bin-binr "binary search"), [`binr`](search/#bin-binr "binary search right")</td></tr>
<tr><td>C</td><td>[`cor`](stats-aggregates/#cor "correlation"), [`cov`](trig/#cov "statistical covariance"), [`cross`](lists/#cross "cross product"), [`cut`](lists/#cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`div`](arith-integer/#div "integer division"), [`dsave`](filewords/#dsave "save global tables to disk")</td></tr>
<tr><td>E</td><td>[`each`](control/#each "apply to each item"), [`ema`](stats-moving/#ema "exponentially-weighted moving average"), [`except`](select/#except "left argument without items in right argument")</td></tr>
<tr><td>F</td><td>[`fby`](qsql/#fby "filter-by")</td></tr>
<tr><td>I</td><td>[`ij`](joins/#ij "inner join"), [`in`](search/#in "membership"), [`insert`](qsql/#insert "append records to a table"), [`inter`](select/#inter "items common to both arguments")</td></tr>
<tr><td>L</td><td>[`like`](strings/#like "pattern matching"), [`lj`](joins/#lj "left join"), [`ljf`](joins/#lj "left join"), [`lsq`](matrixes/#lsq "least squares – matrix divide")</td></tr>
<tr><td>M</td><td>[`mavg`](stats-moving/#mavg "moving average"), [`mcount`](stats-moving/#mcount "moving count"), [`mdev`](stats-moving/#mdev "moving deviation"), [`mmax`](stats-moving/#mmax "moving maxima"), [`mmin`](stats-moving/#mmin "moving minima"), [`mmu`](matrixes/#mmu "matrix multiplication"), [`mod`](arith-integer/#mod "remainder"), [`msum`](stats-moving/#msum "moving sum")</td></tr>
<tr><td>O</td><td>[`or`](logic/#or-maximum "maximum"), [`over`](control/#over "reduce an array with a function")</td></tr>
<tr><td>P</td><td>[`peach`](control/#peach "parallel each"), [`pj`](joins/#pj "plus join"), [`prior`](select/#prior "apply function between each item and its predecessor")</td></tr>
<tr><td>S</td><td>[`scan`](control/#scan "apply function to successive items"), [`scov`](stats-aggregates/#scov "statistical covariance"), [`set`](filewords/#set "asign a value to a name"), [`setenv`](os/#setenv "set an environment variable"), [`ss`](strings/#ss "string search"), [`sublist`](select/#sublist "sublist of a list"), [`sv` consolidate](lists/#sv "consolidate")</td></tr>
<tr><td>U</td><td>[`uj`](joins/#uj "union join"), [`union`](lists/#union "distinct items of combination of two lists"), [`upsert`](qsql/#upsert "add table records")</td></tr>
<tr><td>V</td><td>[`vs` encode](casting/#vs "encode"), [`vs` split](lists/#vs "split")</td></tr>
<tr><td>W</td><td>[`wavg`](stats-aggregates/#wavg "weighted average"), [`within`](search/#within "flag items within range"), [`wsum`](stats-aggregates/#wsum "weighted sum")</td></tr>
<tr><td>X</td><td>[`xasc`](sort/#xasc "table sorted ascending by columns"), [`xbar`](arith-integer/#xbar "interval bar"), [`xcol`](dictsandtables/#xcol "rename table columns"), [`xcols`](dictsandtables/#xcols "re-order table columns"), [`xdesc`](sort/#xdesc "table sorted descending by columns"), [`xexp`](arith-float/#xexp "raised to a power"), [`xgroup`](dictsandtables/#xgroup "table grouped by keys"), [`xkey`](dictsandtables/#xkey "set primary keys of a table"), [`xlog`](arith-float/#xlog "base-x logarithm"), [`xprev`](select/#xprev "previous items"), [`xrank`](sort/#xrank "items assigned to buckets")</td></tr>
</table>

<i class="fa fa-hand-o-right"></i> [`.Q.res`](dotq/#qres-k-words) (reserved words)


## Adverbs 

[Adverbs](adverbs) are primitive higher-order functions: they return _derivatives_ (derived functions). They are denoted by six overloaded glyphs: `'`, `/`, `\`, `':`, `/:` and `\:`. 
```q
q)+/[2 3 4]  / reduce 2 3 4 with +
9
q)*/[2 3 4]  / reduce 2 3 4 with *
24
```
<i class="fa fa-hand-o-right"></i> [Adverbs](adverbs), [Adverb syntax](syntax/#adverbs)


## Control words

The control words `do`, `if` and `while` [govern evaluation](control).


## Views

A view is a calculation that is re-evaluated only if the values of the underlying dependencies have changed since its last evaluation. 
Views can help avoid expensive calculations by delaying propagation of change until a result is demanded. 

The syntax for the definition is
```q
q)viewname::[expression;expression;…]expression
```
The act of defining a view does not trigger its evaluation.

A view should not have side-effects, i.e. should not update global variables. 

<i class="fa fa-hand-o-right"></i> [Views tutorial](http://code.kx.com/wiki/Views), [`view`](metadata/#view), [`views`](metadata/#views), [`.Q.view`](dotq/#qview-subview) (subview) 



## System commands

Expressions beginning with `\` are [system commands](syscmds) or multiline comments (see above). 
```q
q)/ load the script in file my_app.q
q)\l my_app.q
```


## Scripts

A script is a text file; its lines a list of expressions and/or system commands, to be executed in sequence. By convention, script files have the extension `q`.

Within a script 

- function definitions may extend over multiple lines
- an empty comment begins a _multiline comment_. 

