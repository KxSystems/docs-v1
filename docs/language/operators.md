Operators
=========

Operators are primitive binary [functions](functions) that may also be used in infix form. Operators are denoted by glyphs or reserved words or both. 
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


## Glyphs

Some [overloaded](https://en.wikipedia.org/wiki/Function_overloading) glyphs denote both an operator and a unary function. The unary function can be selected by a colon or by parentheses.
```q
q)2|3 1      / maximum operator
3 2
q)|:[2 3 1]  / reverse function
1 3 2
q)(|)2 3 1   / reverse function
1 3 2
```

!!! warning "Watch out"
    Where parentheses are used to select the unary function, argument brackets _must_ be elided; where colon is used, they _cannot_ be. 

Some operators can be denoted by either a glyph or a reserved word. Here is a complete list of operators, including associated unary functions. 

| glyph | word  | operator       |       | function          |
|-------|-------|----------------|-------|-----------|
| `=`   |       | equal          | `=:`  | enumerate  |
| `<>`  |       | not equal      |       ||
| `<`   |       | less than      | `<:`  | FIXME |
| `>`   |       | greater than   | `>:`  | FIXME |
| `~`   |       | match          | `~:`  | FIXME |
| `&`   | `and` | minimum        | `&:`, `(and)` | [`where`](where)    |
| `|`   | `or`  | maximum        | `|:`, `(or)`  | [`reverse`](reverse)    |
| `+`   |       | plus           |       | FIXME |
| `-`   |       | minus          | `-:`  | [`neg`](neg)     |
| `*`   |       | times          | `*:`  | FIXME |
| `%`   |       | divided by     | `%:`  | [`reciprocal`](reciprocal) |
| `#`   |       | take           | `#:`  | [`count`](count)      |
| `,`   |       | join           | `,:`  | FIXME |
| `^`   |       | fill; coalesce | `^:`  | FIXME |
| `_`   |       | drop; cut      | `_:`  | FIXME |
| `'`   |       | case           |       | |
| `!`   |       | dict; key; enum; update; delete | | |


## Reserved words

<table markdown="1" class="kx-compact">
<tr><td>A</td><td>[`and`](http://code.kx.com/wiki/Reference/and "minimum"), [`asof`](http://code.kx.com/wiki/Reference/asof "as-of verb")</td></tr>
<tr><td>B</td><td>[`bin`](http://code.kx.com/wiki/Reference/bin "binary search"), [`binr`](http://code.kx.com/wiki/Reference/bin "binary search right")</td></tr>
<tr><td>C</td><td>[`cor`](http://code.kx.com/wiki/Reference/cor "correlation"), [`cov`](http://code.kx.com/wiki/Reference/cov "statistical covariance"), [`cross`](http://code.kx.com/wiki/Reference/cross "cross product"), [`cut`](http://code.kx.com/wiki/Reference/cut "cut array into pieces")</td></tr>
<tr><td>D</td><td>[`div`](http://code.kx.com/wiki/Reference/div "integer division"), [dsave](files/#dsave "save global tables") </td></tr>
<tr><td>E</td><td>[`ej`](http://code.kx.com/wiki/Reference/ej "equijoin"), [`ema`](http://code.kx.com/wiki/Reference/ema "exponentially-weighted moving average"), [`except`](http://code.kx.com/wiki/Reference/except "left argument without elements in rigt argument")</td></tr>
<tr><td>I</td><td>[`ij`](http://code.kx.com/wiki/Reference/ij "inner join"), [`in`](http://code.kx.com/wiki/Reference/in "membership"), [`insert`](http://code.kx.com/wiki/Reference/insert "append records to a table"), [`inter`](http://code.kx.com/wiki/Reference/inter "elements common to both arguments")</td></tr>
<tr><td>L</td><td>[`like`](textfunctions/#like "pattern matching"), [`lj`](http://code.kx.com/wiki/Reference/lj "left join"), [`ljf`](http://code.kx.com/wiki/Reference/lj "left join"), [`lsq`](http://code.kx.com/wiki/Reference/lsq "least squares -- matrix divide")</td></tr>
<tr><td>M</td><td>[`mavg`](http://code.kx.com/wiki/Reference/mavg "moving average"), [`mcount`](http://code.kx.com/wiki/Reference/mcount "moving count"), [`mdev`](http://code.kx.com/wiki/Reference/mdev "moving deviation"), [`mmax`](http://code.kx.com/wiki/Reference/mmax "moving maxima"), [`mmin`](http://code.kx.com/wiki/Reference/mmin "moving minima"), [`mmu`](http://code.kx.com/wiki/Reference/mmu "matrix multiplication"), [`mod`](http://code.kx.com/wiki/Reference/mod "remainder"), [`msum`](http://code.kx.com/wiki/Reference/msum "moving sum")</td></tr>
<tr><td>O</td><td>[`or`](http://code.kx.com/wiki/Reference/or "maximum of arguments")</td></tr>
<tr><td>P</td><td>[`pj`](http://code.kx.com/wiki/Reference/pj "plus join")</td></tr>
<tr><td>S</td><td>[`scov`](http://code.kx.com/wiki/Reference/scov "statistical covariance"), [`set`](files/#set "assign a value to a name"), [`setenv`](http://code.kx.com/wiki/Reference/setenv "set an environment variable"), [`sublist`](http://code.kx.com/wiki/Reference/sublist "sublist of a list"), [`sv`](http://code.kx.com/wiki/Reference/sv "atom from a list")</td></tr>
<tr><td>U</td><td>[`uj`](http://code.kx.com/wiki/Reference/uj "union join"), [`union`](http://code.kx.com/wiki/Reference/union "distinct elements of combination of two lists"), [`upsert`](http://code.kx.com/wiki/Reference/upsert "add table records")</td></tr>
<tr><td>V</td><td>[`vs`](http://code.kx.com/wiki/Reference/vs "list from an atom")</td></tr>
<tr><td>W</td><td>[`wavg`](http://code.kx.com/wiki/Reference/wavg "weighted average"), [`within`](http://code.kx.com/wiki/Reference/within "flag elements within range"), [`wsum`](http://code.kx.com/wiki/Reference/wsum "weighted sum")</td></tr>
<tr><td>X</td><td>[`xasc`](http://code.kx.com/wiki/Reference/xasc "table sorted ascending by columns"), [`xbar`](http://code.kx.com/wiki/Reference/xbar "interval bar"), [`xcol`](http://code.kx.com/wiki/Reference/xcol "rename table columns"), [`xcols`](http://code.kx.com/wiki/Reference/xcols "re-order table columns"), [`xdesc`](http://code.kx.com/wiki/Reference/xdesc "table sorted decending by columns"), [`xexp`](http://code.kx.com/wiki/Reference/xexp "raised to a power"), [`xgroup`](http://code.kx.com/wiki/Reference/xgroup "table grouped by keys"), [`xkey`](http://code.kx.com/wiki/Reference/xkey "set primary keys of a table"), [`xlog`](http://code.kx.com/wiki/Reference/xlog "base-x logarithm"), [`xprev`](http://code.kx.com/wiki/Reference/xprev "previous elements"), [`xrank`](http://code.kx.com/wiki/Reference/xrank "items assigned to buckets")</td></tr>
</table>
