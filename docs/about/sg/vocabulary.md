# Vocabulary and spelling


In 2017 the terminology used to describe Kx technology was reviewed and revised. 

The following terms are no longer used to describe q:

-   monad, monadic
-   dyad, dyadic
-   nilad, niladic
-   verb

Q defines twelve adverbs, denoted by six glyphs. 


## Q and kdb+

-   _kdb+_ denotes the database and the process that manages it;
-   _q_ denotes the programming language, a domain-specific language for time series embedded in 
-   the _k_ language;


### Function rank

> A function’s _rank_ is the number of arguments it takes. 

Functions of rank 1 are _unary_; functions of rank 2, _binary_. 

The terms _monad_, _dyad_, _monadic_, and _dyadic_ are no longer used.


### Operators 

All functions can be applied with prefix notation, e.g. `f[x;y;z]` and `+[2;3]`.

> An _operator_ is a primitive binary function that can also be applied with infix notation.
```q
q)2+3
5
q)3 sum 1 2 3
9
```
The term _verb_ is no longer used. 


### Adverbs

> An _adverb_ is a primitive higher-order function that is applied postfix and returns a _derived function_, also known as a _derivative_.
```
q)total:+/
q)total[1 2 3]
6
```
Adverbs are distinguished from the overloaded glyphs that denote them. For example, the glyph `'` is overloaded with the adverbs _case_, _compose_, and _each-both_. 

Between them, six glyphs denote twelve [adverbs](/ref/adverbs). 

!!! note "Refer to an adverb by its name"
    Refer to an adverb by its name, not the (overloaded) symbol that denotes it. 

    For example, in `2 +//5 5#til 25` the adverb denoted by the first `/` is _over_ and the adverb denoted by the second `/` is _converge-repeat_.

**Watch out:** The primitives `each`, `over`, and `scan` are operators that apply their function arguments. They are not adverbs, and do not return derivatives. Where an adverb applied postfix returns a derivative, an operator applied infix, but without a right argument, returns a projection. 
```q
q)(+/)1 2 3
6
q)(+)over 1 2 3
6
q)tot1:+/                / derived function
q)tot1[1 2 3]
6
q)tot2:(+)over           / projection
q)tot2 1 2 3
6
q)type each (tot1;tot2)  / derivative; projection
107 104h
```

