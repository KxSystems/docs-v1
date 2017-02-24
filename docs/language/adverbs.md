Adverbs are primitives that take function arguments and return functions.  They are much used for [iteration](iteration). Unary adverbs are applied postfix. 
```q
q)+/[2 3 4]      /reduce 2 3 4 with +
9
q)*/[2 3 4]      /reduce 2 3 4 with *
24
```


## Derivatives

Applying an adverb yields a derived function: the _derivative_.
Except for derivatives of _compose_, binary derivatives can be applied infix. 
```q
q)2+/2 3 4
11
```

The glyphs `'`, `':` `\:`, `/:`, `/` and `\` denote the following adverbs, according to context.

!!! warning "Stay close"
    A space preceding `/` begins a trailing comment. So, `+/`, never `+ /`


## `'` case

Syntax: `x'` (unary)  
Derivative: `d x` (unary) 

Where `x` is an integer vector, the derivative returns `r` such that
```q
r[i] ~ y[x i] i
```
Atom items of `y` are treated as infinitely repeated values.
```q
q)0 1 0'["abc";"xyz"]
"ayc"
q)/extra arguments don't signal a rank error
q)0 2 0'["abc";"xyz";"123";"789"]
"a2c"
q)0 1 0'["a";"xyz"]  /atom "a" repeated as needed
"aya"
```


## `'` compose

Syntax: `'[g;f]` (binary)  
Derivative: `d[x;y;z;…]` (same rank as `f`)

Where `f` is a **multi-argument** function and `g` is a **unary** function, the derivative has rank `f` and returns `g f[x;y;z;…]`. 
```q
q)f:{[w;x;y;z]w+x+y+z}
q)g:{2*x}
q)d:('[g;f])               / The interpreter is finicky about :'
q)d[1;2;3;4]               / g f[1;2;3;4]
20
```

!!! Tip "Compose a list of functions"
    This can be extended with [`over`](iteration/#over) to compose a list of functions.
    ```q
    q)g1:{10*x}
    q)d1:('[;]) over (g1;g;f)  / Use ('[;]) so the correct form is used
    q)d1[1;2;3;4]
    200
    ```

## `'` each-both

Syntax: `f'` (unary)  
Derivative: `x d y` (binary, uniform)

Where `f` is a **binary** function, and `x` and `y` conform, the derivative applies `f` between corresponding items of `x` and `y`. 
```q
q)0 1 2 3 ,' 10 20 30 40
0 10
1 20
2 30
3 40
```
If either `x` or `y` is atomic, it is paired to every item in the other argument.
```q
q)0 1 2 3 ,' 10
0 10
1 10
2 10
3 10
```


## `\:` each-left

Syntax: `f\:` (unary)  
Derivative: `x d y`(binary, uniform)

Where `f` is a **binary** function, the derivative applies `f` between `y` and each item of `x` where 

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


## `/:`  each-right

Syntax: `f/:` (unary)  
Derivative: `x d y` (binary, uniform)

Where `f` is a **binary** function, the derivative applies `f` between `x` and each item of `y` where 

- `x` is an atom or a list
- `y` is a list

```q
q)(til 5),/:0 1
0 1 2 3 4 0
0 1 2 3 4 1
```

!!! tip "Left, right, cross"
    _Each-left_ combined with _each-right_
    ```q
    (til 4),\:/: til 4
    ((0 0;1 0;2 0;3 0);(0 1;1 1;2 1;3 1);(0 2;1 2;2 2;3 2);(0 3;1 3;2 3;3 3))
    ```
    resembles the result obtained by `cross`
    ```q
    cross[til 4;til 4]
    (0 0;0 1;0 2;0 3;1 0;1 1;1 2;1 3;2 0;2 1;2 2;2 3;3 0;3 1;3 2;3 3)
    ```


## `':` each-parallel

Syntax: `f':` (unary)  
Derivative: `d x` (unary, uniform) 

Where `f` is a **unary** function, the derivative assigns the items of `x` to separate slave tasks, and in each task applies `f` to each item of the sublist. 
```q
$ q -s 2
KDB+ 3.4 2016.06.14 Copyright (C) 1993-2016 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE
q)\t ({sum exp x?1.0}' )2#1000000  / each
185
q)\t ({sum exp x?1.0}':)2#1000000  / peach
79

q)peach
k){x':y}
```

<i class="fa fa-hand-o-right"></i> [command-line options](FIXME), [parallel processing](peach), [`peach`](iteration/#peach)


## `':` each-prior

Syntax: `f':`  (unary)  
Derivative: `d x` (ambivalent, uniform)

Where `f` is a **binary** function, the derivative applies `f` between each item of `x` and its predecessor.
<div class="kx-compact" markdown="1">

| form       | example                         |
|------------|---------------------------------|
| `f':[y]`   | `-':[   1 4 9 16]`               |
| `(f':)y`   | `(-':)  1 4 9 16`               |
| `x f': y`  | `9-':   1 4 9 16`               |
| `f':[x;y]` | `-':[9; 1 4 9 16]`              |
| `f':[x;]y` | `-':[9;]1 4 9 16   /projection` |

</div>

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


## `/` iterate

Syntax: `f/`  (unary)  
Derivative: `x d y` (binary)

Where `f` is a **unary** function, `f/` the derivative returns the result of `x` successive applications of `f` to `y`:
`f f f … f f y`

```q
/first 10+2 numbers of Fibonacci sequence
q)10{x,sum -2#x}/0 1                      / derived binary applied infix
0 1 1 2 3 5 8 13 21 34 55 89
/first n+2 numbers of Fibonacci sequence
q)fibonacci:{x,sum -2#x}/[;0 1]           / projection of derived function
q)fibonacci 10
0 1 1 2 3 5 8 13 21 34 55 89
```


## `/` over

Syntax: `f/`  (unary)  
Derivative: `x d y` (ambivalent, aggregate)

Where `f` is a **binary** function the derivative returns

<code>f[x;f[y<sub>0</sub>;f[y<sub>1</sub>;…]]]</code>

```q
q)(+/)2 3 4  /unary
9
q)0+/2 3 4   /binary
9
```

<i class="fa fa-hand-o-right"></i> [ambivalent functions](#ambivalent-functions), [`over`](iteration/#over) operator.


## `/` fold

Syntax: `f/`  (unary)  
Derivative: `d[x;y;z;…]` (same rank as `f`)

Where `f` is a **function with rank above 2** and `y`, `z`, etc. conform, the derivative has the same rank as `f` and (e.g. for rank 3 and `y` and `z` of count `n`) returns  
<code>f[f[… f[f[x;y<sub>0</sub>;z<sub>0</sub>];y<sub>1</sub>;z<sub>1</sub>]; … y<sub>n-1</sub>;z<sub>n-1</sub>];y<sub>n</sub>;z<sub>n</sub>]</code>
```q
q){x+y+z}/[1 5 6;2 22;3 33]
61 65 66
```

!!! note "_Fold_ and _over_"
    _Over_ is _fold_ as applied to a binary function. 


## `\` scan

Syntax: `f\`  (unary)  
Derivative: `d x` (unary, uniform)

Where `f` is a **binary** function, the derivative applies `f/` to successive items of `x`. Its result is a list of the same count, built up as follows:
<code><pre>r<sub>0</sub> = x<sub>0</sub>
r<sub>i</sub> = f[r<sub>i-1</sub>;x<sub>i</sub>] for i > 0</pre></code>

<i class="fa fa-hand-o-right"></i> [`/` _over_ adverb](#over), [`over` operator](iteration/#over), [`scan` operator](iteration/#scan) 


## Ambivalent functions

Some binary derivatives are _ambivalent_: unary application does not return a unary projection but takes the binary function’s identity element as `x`. 
```q
q)+/[2 3 4]
9
q)+/[0;2 3 4]  /0 is identity element for +
9
q)*/[2 3 4]
24
q)*/[1;2 3 4]  /1 is identity element for *
24
```
The _identity element_ of a function is the value `x` such that, for all `y`, `y~f[x;y]`. 

In noun syntax, applying an ambivalent function by juxtaposition applies it as a unary function – there is no infix application in noun syntax. 
```q
q)10+/2 3 4    /infix in function syntax
19
q)(+/)2 3 4    /derivative in noun syntax applied by juxtaposition
9
q)10(+/)2 3 4  /no infix in noun syntax
'Cannot write to handle 10. OS reports: Bad file descriptor
```
