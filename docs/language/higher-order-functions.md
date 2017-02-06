_Higher-order functions_ return functions as their results. They are much used to iterate functions over their arguments. 

Primitive higher-order functions use prefix, postfix or infix form. Some are represented by both glyphs and reserved words. 

!!! Important 
    No whitespace may appear between a primitive higher-order function glyph and its function argument. For example, `+/` and never `+ /`.

The primitive higher-order functions are as follows. 

## case `'`

Syntax: `x'`

Where `x` is an integer list of length _n_, returns an _n_-argument function that for the i-th argument selects its `x[i]`-th item. All arguments must be of the same length, or scalar. Scalar arguments treated as infinitely repeated values.
```q
q)0 1 2'[1 2 3;10 20 30;100]
1 20 100
```


## compose `'`

Syntax: `'[g;f]` 

Where `f` is a multi-argument function and `g` is a unary function, composes `f` and `g` to produce a new function with the signature of `f`. 
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


## `each` 

Syntax: `f each` 

Returns a unary function that applies `f` to each item in its argument.
```q
q)count (1 2 3;"hello")
2
q)count each (1 2 3;"hello")  // count is the argument of each
3 5
```


## each-both `'`

Syntax: `f'` 

Where `f` is a binary function, returns an [operator](operators) that applies `f` between corresponding items of `x` and `y`. 
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


## each-left `\:`

Syntax: `f\:`

Where `f` is a binary function, returns an [operator](operators) that applies `f` between its `y` and each item of `x` where 

- `x` is a list
- `y` is an atom or a list

```q
q)(til 5),\:0 1
0 0 1
1 0 1
2 0 1
3 0 1
4 0 1
```


## each-right `/:`

Syntax: `f/:`

Where `f` is a binary function, returns an [operator](operators) that applies `f` between its `x` and each item of `y` where 

- `x` is an atom or a list
- `y` is a list

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


## `over` `/`

Syntax: `f/`  
Syntax: `f over`  

Where `f` is a binary function, returns a unary function that applies `f` between successive elements of its argument. 
If `f` is an operator represented by an overloaded glyph, parenthesise it with `over`.
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

## `peach` `':`

Syntax: `f':`  
Syntax: `f peach` 

Where `f` is a unary function, returns a function that assigns the items of its list argument to separate slave tasks and in each task applies `f` to each item of the sublist. 
```q
$ q -s 2
KDB+ 3.0 2012.11.13 Copyright (C) 1993-2012 Kx Systems
l32/ 2()core 3539MB jack sff 127.0.0.1 PLAY 2013.02.11
q)\t ({sum exp x?1.0}' )2#1000000  / each
163
q)\t ({sum exp x?1.0}':)2#1000000  / peach
114

q)peach
k){x':y}
```

| form       | example                         |
|------------|---------------------------------|
| `f':[y]`   | `-':[  1 4 9 16]`               |
| `(f':)y`   | `(-':)  1 4 9 16`               |
| `x f': y`  | `9-':   1 4 9 16`               |
| `f':[x;y]` | `-':[9; 1 4 9 16]`              |
| `f':[x;]y` | `-':[9;]1 4 9 16   /projection` |

```q
q)"abc",':"xyz"
("xabc";"yx";"zy")
q)0 1-':2 5 9
(2 1;3;4)
q)0-':2 5 9
2 3 4
q)-':[2 5 9]     /deltas
2 3 4
```

See [Parallel each](peach)


## `prior` `':`

Syntax: `f': `  
Syntax: `f prior` 

Where `f` is a binary function, returns a unary function that applies `f` between each item of `x` and its predecessor.
If `f` is an overloaded operator glyph, parenthesise it with `prior`.
```q
q)(-)prior 2 3 4   / e.g. same as deltas 2 3 4
2 1 1
```


## `scan`

Syntax: `f\`  
Syntax: `f scan`

Where `f` is a binary function, returns a uniform unary function that applies `f/` to successive items of its list argument. Its result is a list of the same length, built up as follows:
  
r<sub>0</sub> = x<sub>0</sub>

r<sub>i</sub> = f\[r<sub>i-1</sub>;x<sub>i</sub>\] for i &gt; 0

```q
q){x+2*y} scan 2 3 5 7
2 8 18 32
```
The successive function application may be seen with:
```q
q){enlist x,y} scan 2 3 5 7
2
,2 3
,(2 3;5)
,((2 3;5);7)
```
If `f` is an operator represented by a glyph, parenthesise it.
```q
q)(+) scan 2 3 5 7    / cumulative sums
2 5 10 17
```

!!! Tip 
    `over` works the same way as `scan` but returns only the last result.


## trap `. @`

Syntax: `@[f;x;e]`  
Syntax: `.[g;y;e]`

Where 

- `f` is a unary function and `x` its argument
- `g` is a non-unary function and `y` a list of its arguments
- `e` an expression

evaluates `e` if `f[x]` fails. 

See [Handling errors](handlingerrors#trap).













