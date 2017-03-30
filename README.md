# Kx documentation
Rebuild of [code.kx.com](http://code.kx.com/) using the [MkDocs](http://mkdocs.org) static site generator. 

The wiki enabled the kdb+ documentation to grow organically over the years. It is well organised for finding all uses of a word or glyph. 
Its replacement aims to 

- use a consistent vocabulary and typographical convention 
- distinguish clearly between a glyph and the function/s it denotes 
- categorise language primitives by application so, e.g. string-handling functions are listed together

Most of the wiki consists of three groups of articles:

- Reference
- Cookbook
- Extracts from V1 and V2 of _Q for Mortals_


## Reference 

The Reference articles have been exported and their content incorporated into a hierarchical table of contents. 


## Cookbook 

The Cookbook articles are largely untouched. Links to Cookbook articles point to the wiki. 


## Q for Mortals V3

Unlike the first two editions, _Q for Mortals V3_ is now published in its entirety online in HTML. 

Links from the Reference and Cookbook to _Q for Mortals_ will be replaced with links to _Q for Mortals V3_.


## Not upwardly compatible 

Rewriting the Reference material required agreeing the [vocabulary](http://code.kx.com/q/ref/glossary) in which q is described. 

The term _verb_ had been inherited from the [J programming language](http://jsoftware.com) but was an inexact fit for q, besides being a term unfamiliar to programmers generally. 

We start from the common usages of _operator_ and _function_; thus `+` is an operator. 

A function’s _rank_ is the number of arguments it takes. Functions of ranks 1 and 2 are no longer _monads_ and _dyads_ but more familiar _unary_ and _binary_ functions. 

`+[2;3]` demonstrates that operators are also functions; a q operator is a binary function that may be applied infix. From this we discover `and`, `cut`, `upsert`, `over` and other functions are also operators. 

While _adverb_ is unfamiliar to programmers generally, and loses explanatory power outside the J noun/verb/adverb metaphor, we need a term for the q primitives that are applied postfix and return a derivative (derived function), e.g. `+/`. _Adverb_ survives by default, but we now improve clarity by distinguishing between the six glyphs and the twelve adverbs they denote.
```q
q)f:count':       / count is unary  so ': is each-parallel
q)g:,':           / ,     is binary so ': is each-prior
q)f("abc";"xyz")  / each-parallel derivative is unary
3 3
q)g["abc";"xyz"]  / each-prior derivative is binary
"xabc"
"yx"
"zy"
```
Adverbs take functions as arguments but are not alone in doing so: operators such as `fby`, `over`, and `scan` do so, as may any lambda. This is unremarkable in functional languages. 

K has _ambivalent_ primitives, e.g. `-` can be applied infix as the binary function _subtract_ or prefix as the unary function _negate_.
```k
  5-3
2
  -3
-3
```
Q has no ambivalent primitives, but some derivatives are ambivalent.
```q
q)tot:+/        / derivative
q)tot[til 6]    / unary
15
q)tot[2;til 6]  / binary
17
```


## To do

- [x] Substitute _operator_ for _verb_
- [x] Substitute _item_ for _element_
- [x] Substitute _signal_ for _throw_
- [x] Substitute _indexes_ for _indices_
- [x] Substitute _matrixes_ for _matrices_
- [x] Substitute _simple table_ for _keyed table_
- [x] Substitute _UTC_ for _GMT_
- [ ] Replace links from q/ref to V1 and V2 of _Q for Mortals_ with links to code.kx.com/q4m3 
- [ ] Tabulate .h and .Q contents on q/ref/card
- [ ] Distribute throughout the pages under Reference/Semantics references to .h, .Q and .z functions 
- [ ] Unify q/ref/card and help.q and derive from same source
- [ ] Replace central table on home page with responsive version
- [ ] Migrate Cookbook articles


## Contact

This is a project of the [Kx Librarian](mailto:librarian@kx.com)

> A librarian’s job is to put information where people can find it. 

