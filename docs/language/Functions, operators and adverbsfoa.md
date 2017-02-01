Functions, operators and adverbs
================================

Everything is functions. Now read on. 

Functions
---------

Functions take arguments on their right, e.g. `{x+y}[2;3]`. 

The number of arguments to a function is its _valence_. The function above has a valence of 2. Functions of valence 1, 2 and 3 are known as _monadic_, _dyadic_ and _triadic_. 

Q defines _primitive_ functions and reserves names or symbols for them, such as 'avg' and `*`. 
```q
q)avg[2 3]
5
q)*[2;3]
6
```
You may define functions and, if you wish, assign them names, e.g.
```q
q){x+y}[2;3]
5
q)plus:{x+y}
q)plus[2;3]
5
```

Operators 
---------

An _operator_ is a primitive dyadic function that can be used between its arguments in _infix form_, e.g.
```q
q)2+3
5
q)"me"in"team"
11b
```
Because operators are functions, they can also be used in functional form:
```q
q)in["me";"team"]
```
<aside markdown="1" class="comment">
But `except["team";"me"]` gives an error `'[`, not "ta".
</aside>

Adverbs
-------

An adverb is a primitive that takes a _function_ as its argument; its result is a new function. 