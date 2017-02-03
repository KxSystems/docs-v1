Higher-order functions
======================

A _higher-order function_ is a [function](functions) that takes a function or function as argument/s. 

Primitive higher-order functions use prefix, postfix or infix form. Some are represented by both glyphs and reserved words. 

!!! Important 
    No whitespace may appear between a primitive higher-order function glyph and its function argument. For example, `+/` and never `+ /`.

The primitive higher-order functions are as follows. 


## compose '

Prefix syntax: `'[g;f]`

where `f` is a multi-argument function and `g` is a unary function.

Composes its argument functions to produce a new function with the same function signature as the original function. 
```q
q)f:{[w;x;y;z]w+x+y+z}
q)g:{2*x}
q)h:('[g;f])               / The interpreter is finicky about :'
q)h[1;2;3;4]               / f g[1;2;3;4]
20
```
This can be extended with `over` to compose a list of functions.
```q
q)g1:{10*x}
q)h1:('[;]) over (g1;g;f)  / Use ('[;]) so the correct form is used
q)h1[1;2;3;4]
200
```


## each 

Postfix syntax: `f each`

Applies a unary function `f` to each item in its argument.
```q
q)count (1 2 3;"hello")
2
q)count each (1 2 3;"hello")  // count is the argument of each
3 5
```


## each-both '

Postfix syntax: `x f' y`

Applies binary function `f` between corresponding items of `x` and `y`. 
```q
q)0 1 2 3 ,' 10 20 30 40
0 10
1 20
2 30
3 40
```
If either argument to the returned operator is atomic, it is paired to every item in the other argument.
```q
q)0 1 2 3 ,' 10
0 10
1 10
2 10
3 10
```


## each-left /:

Postfix syntax: `x f\: y`

Applies operator `f` between `y` and each item of list `x`; `y` is an atom or list.
```q
q)(til 5),\:0 1
0 0 1
1 0 1
2 0 1
3 0 1
4 0 1
```


## each-right /:

Postfix syntax: `x f/: y`

Applies operator `f` between each item of list `y` and `x`; `x` is an atom or list.
```q
q)(til 5),/:0 1
0 1 2 3 4 0
0 1 2 3 4 1
```

!!! tip "Left, right, cross"
    Each-left combined with each-right
    ```q
    (til 4),\:/: til 4
    ((0 0;1 0;2 0;3 0);(0 1;1 1;2 1;3 1);(0 2;1 2;2 2;3 2);(0 3;1 3;2 3;3 3))
    ```
    resembles the result obtained by `cross`
    ```q
    cross[til 4;til 4]
    (0 0;0 1;0 2;0 3;1 0;1 1;1 2;1 3;2 0;2 1;2 2;2 3;3 0;3 1;3 2;3 3)
    ```


## fby

Infix syntax: `(f;x) fby y`

where `f` is an [aggregate](functions#actions-on-lists) function. See [`fby`](language/fby).


## over /

Postfix syntax: `(f/)x`  or `f over x`  
Prefix syntax: `over[f;x]` 

Applies binary function `f` between successive elements of `x`. If `f` is an operator, parenthesise it.
```q
q){x+2*y} over 2 3 5 7
32
q)({x+2*y}/)2 3 5 7
32
q)over[{x+2*y};2 3 5 7]
32
q)(+/)til 10
45
q)(+)over til 10
45
```
The result is built up by applying `f` successively as follows:

r = x<sub>0</sub>
r = f\[r;x<sub>i</sub>\] for i = 1…n

!!! tip "See the successive results"
    The successive results may be seen with `scan`. This works the same way as `over` but returns all the intermediate results:
    ```q
    q){x+2*y} scan 2 3 5 7
    2 8 18 32
    ```

## peach ':

Postfix syntax: `f':`
Postfix syntax: `f peach`

Applies **unary** function `f` …FIXME see <http://code.kx.com/wiki/Reference/ApostropheColon#peach>


## prior ':

Postfix syntax: `f':`  
Postfix syntax: `f peach`

Applies **binary** function `f` between each item of `x` and its predecessor.


## trap . @

Prefix syntax: `@[f;x;e]` or `.[f;x;e]` 

where `f` is a unary function, `x` its argument and `e` an error message. 

See [Controlling evaluation](evaluation#trap).













