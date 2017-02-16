Adverbs are primitive higher-order functions (they return functions) applied postfix (except for [_compose_](#compose)). They are much used for [iteration](iteration). 
```q
q)+/[2 3 4]      / 2+3+4
9
q)*/[2 3 4]      / 2*3*4
24
```

!!! Important "Stay close" 
    Never separate an adverb from its function argument. For example, `+/` but never `+ /`.


Derivatives
-----------

The _derived function_, or _derivative_, returned by an adverb might be _ambivalent_: it might have _two ranks_. Its rank is finally determined by how you apply it.
```q
q)+/[2 3 4]      / unary
9
q)+/[2;2 3 4]    / binary
11
q)+/[2;2 3 4;5]  / no rank-3 form!
'rank
q)tot:+/
q)tot 2 3 4      / unary
9
q)tot[2 3 4]     / unary
9
q)tot[2;2 3 4]   / binary: tot is ambivalent
11
```
A binary derivative can be applied infix. 
```q
q)2+/2 3 4
11
q)2 tot 2 3 4    / but not once assigned
'type
```

!!! note "Operators and derivatives"
    Derivatives are _like_ operators:

    - a binary form can be used infix 

    and _unlike_ operators:

    - ambivalent, not just binary 
    - the binary form of a derivative cannot be projected with a juxtaposed left-argument,so `p:tot[2;]` but not `p:2 tot`
    - the binary form of a derivative cannot be projected with an omitted semicolon: `tot[2]` is a unary application; `tot[2;]` is a projection.


The six glyphs `'`, `':` `\:`, `/:`, `/` and `\` denote the following adverbs, according to context.


## `'` case

Syntax: `x'` (unary, postfix)  
Derivative: `d x` (unary, prefix) 

Where `x` is an integer vector, the derivative returns `r` such that
```q
r[i] ~ y[x[i]] i
```
Atom items of `y` are treated as infinitely repeated values.
```q
q)0 1 0'["abc";"xyz"]
"ayc"
q)/ extra arguments don't signal a rank error
q)0 2 0'["abc";"xyz";"123";"789"]
"a2c"
q)0 1 0'["a";"xyz"]  / atom "a" repeated as needed
"aya"
```
The derivative can be projected in the usual way. 
```q
q)g:(0 2 0')["abc";;]
q)g["xyz";"123"]
"a2c"
```


## `'` compose

Syntax: `'[g;f]` (binary, prefix)  
Derivative: `d[x;y;z;…]` (same rank as `f`; prefix, also infix if `f` is binary)

**Watch out** The only adverb not applied prefix.

Where `f` is a multi-argument function and `g` is a unary function, the derivative has rank `f` and returns `g f[x;y;z;…]`. 
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

Syntax: `f'` (unary, postfix)  
Derivative: `x d y` (binary, infix, uniform)

Where `f` is a **binary** function, the derivative applies `f` between corresponding items of `x` and `y`. 
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

Syntax: `f\:` (unary, postfix)  
Derivative: `x d y`(binary, infix, uniform)

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

Syntax: `f/:` (unary, postfix) 
Derivative: `x d y` (binary, infix, uniform)

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

Syntax: `f':` (unary, postfix)  
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

<i class="fa fa-hand-o-right"></i> [parallel processing](peach), [`peach`](iteration/#peach)


## `':` each-prior

Syntax: `f':`  (unary, postfix)  
Derivative: `d x` (unary, uniform)

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

Syntax: `f/`  (unary, postfix)  
Derivative: `x d y` (binary, infix)

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

Syntax: `f/`  (unary, postfix)  
Derivative: `x d y` (binary, infix, aggregate)

Where `f` is a **binary** function the derivative is _ambivalent_: where applied as

- unary its result is `x[0] f x[1] f … f x[n-1] f x[n]`
- binary its result is `x f (f/)y` 

```q
q)+/[1 2 3]
6
q)+/[10;1 2 3]
16
```

<i class="fa fa-hand-o-right"></i> [`over`](iteration/#over) operator.


## `/` fold

Syntax: `f/`  (unary, postfix)  
Derivative: `d[x;y;z;…]` (same rank as `f`; prefix)

Where `f` is a **function with rank above 2** the derivative has the same rank as `f` and (e.g. for rank 3) returns  
<code>f[f[… f[f[x;y<sub>0</sub>;z<sub>0</sub>];y<sub>1</sub>;z<sub>1</sub>]; … y<sub>n-1</sub>;z<sub>n-1</sub>];y<sub>n</sub>;z<sub>n</sub>]</code>
```q
q){x+y+z}/[1 5 6;2 22;3 33]
61 65 66
```

<aside class="comment" markdown="1">Is _over_ a special case of _fold_?</aside>


## `\` scan

Syntax: `f\`  (unary, postfix)  
Derivative: `d x` (unary, prefix, uniform)

Where `f` is a **binary** function, the derivative applies `f/` to successive items of `x`. Its result is a list of the same length, built up as follows:
<code><pre>r<sub>0</sub> = x<sub>0</sub>
r<sub>i</sub> = f[r<sub>i-1</sub>;x<sub>i</sub>] for i > 0</pre></code>

<i class="fa fa-hand-o-right"></i> [`/` _over_ adverb](#over), [`over` operator](iteration/#over), [`scan`](iteration/#scan) operator
