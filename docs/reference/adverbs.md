Adverbs are primitive higher-order functions: they return derived functions, known as [_derivatives_](#derivatives).  They are much used for [iteration](iteration). 
```q
q)+/[2 3 4]      /reduce 2 3 4 with +
9
q)*/[2 3 4]      /reduce 2 3 4 with *
24
```
<i class="fa fa-hand-o-right"></i> [Adverb syntax](syntax/#adverbs)

<div class="kx-compact" markdown="1">

| form            | adverb                                | semantics                                  |
|-----------------|---------------------------------------|--------------------------------------------|
| `int'[x;y;…]`   | [case](#case)                 | select from `[x;y;…]`                              |
| `'[f;g][x;y;…]` | [compose](#compose)           | compose `f` with `g`                               |
| `x f'y`         | [each-both](#each-both)       | apply `f` between items of `x` and `y`             |
| `x f\:y`        | [each-left](#each-left)       | apply `f` between `y` and items of `x`             |
| `x f/:y`        | [each-right](#each-right)     | apply ``f between `x` and items of `y`             |
| `f':x`          | [each-parallel](#each-right)  | apply `f` to items of `x` in parallel tasks        |
| `f':x`          | [each-prior](#each-prior)     | apply `f` between successive pairs of items of `x` |
| `x f/y`         | [repeat](#repeat)             | apply `f` to `y`, `x` times                        |
| `x f/y`         | [over](#over)                 | reduce `y` with `f`                                |
| `f/[x;y;…]`     | [fold](#fold)                 | reduce `[x;y;…]` with `f`                          |
| `f\x`           | [converge](#converge-iterate) | apply `f` to `x` until converges                   |
| `x f\y`         | [iterate](#converge-iterate)  | apply `f` to `y`, `x` times or while `x`           |
| `f\x`           | [scan](#scan)                 | apply `f/` to successive items of `x`              |

</div>
Key: `int`: int vector; `f`: function; `g`: function; `x`: data; `y`: data.



## `'` – case

Syntax: `x'` (unary)  
Derivative: `d x` (unary) 

Where `x` is an integer vector, the derivative `f'` returns `r` such that
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


## `'` – compose

Syntax: `'[g;f]` (binary)  
Derivative: `d[x;y;z;…]` (same rank as `f`)

Where `f` is a **multi-argument** function and `g` is a **unary** function, the derivative `f'` has rank `f` and returns `g f[x;y;z;…]`. 
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

## `'` – each-both

Syntax: `f'` (unary)  
Derivative: `x d y` (binary, uniform)

Where `f` is a **binary** function, and `x` and `y` conform, the derivative `f'` applies `f` between corresponding items of `x` and `y`. 
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


## `\:` – each-left

Syntax: `f\:` (unary)  
Derivative: `x d y`(binary, uniform)

Where `f` is a **binary** function, the derivative `f\:` applies `f` between `y` and each item of `x` where 

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


## `/:`  – each-right

Syntax: `f/:` (unary)  
Derivative: `x d y` (binary, uniform)

Where `f` is a **binary** function, the derivative `f/:` applies `f` between `x` and each item of `y` where 

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


## `':` – each-parallel

Syntax: `f':` (unary)  
Derivative: `d x` (unary, uniform) 

Where `f` is a **unary** function, the derivative `f':` assigns the items of `x` to separate slave tasks, and in each task applies `f` to each item of the sublist. 
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

<i class="fa fa-hand-o-right"></i> [command-line options](commandline), [parallel processing, `peach`](peach)


## `':` – each-prior

Syntax: `f':`  (unary)  
Derivative: `d x` (ambivalent, uniform)

Where `f` is a **binary** function, the derivative `f':` applies `f` between each item of `x` and its predecessor.
<div class="kx-compact" markdown="1">

| form       | example                             |
|------------|-------------------------------------|
| `f':[y]`   | `-':[   1 4 9 16]` /unary           |
| `(f':)y`   | `(-':)  1 4 9 16`  /juxtaposition   |
| `x f': y`  | `9-':   1 4 9 16`  /infix (binary)  |
| `f':[x;y]` | `-':[9; 1 4 9 16]` /prefix (binary) |
| `f':[x;]y` | `-':[9;]1 4 9 16   /projection`     |

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


## `/` – converge-repeat

Syntax: `d:f/`  (unary)  
Derivative: `d y` (unary)  
Derivative: `x d y` (binary)

Where `f` is a **unary** function, the derivative `f/` 

- (**converge**) applied **unary** applies `f` repeatedly to `y` until either (1) two successive results agree within comparison tolerance or (2) the result matches `y`. The latter will save you from some infinite cycles but not all.
```q
q)(not/) 1b
0b
q)(not/) 42  /never returns
```
The related form [_converge-iterate_](#converge-iterate) can be useful to see the intermediate results. (Set `\P 0` to see the convergence of your original computation.)

- (**repeat**) applied **binary** where (a) `x` is a **positive int atom**, returns the result of `x` successive applications of `f` to `y`
<code>f&nbsp;f&nbsp;f&nbsp;…&nbsp;f&nbsp;f&nbsp;y</code>
```q
/first 10+2 numbers of Fibonacci sequence
q)10{x,sum -2#x}/0 1                      / derived binary applied infix
0 1 1 2 3 5 8 13 21 34 55 89
/first n+2 numbers of Fibonacci sequence
q)fibonacci:{x,sum -2#x}/[;0 1]           / projection of derived function
q)fibonacci 10
0 1 1 2 3 5 8 13 21 34 55 89
```
or where (b) `x` is a **function**, returns the result when `x` applied to the result returns `0b`.
```q
q){x<1000}{x*x}/2      /infix: g f/y
65536
q){x*x}/[{x<1000};2]   /prefix: f/[g;y]
65536
```


## `/` – over

Syntax: `f/`  (unary)  
Derivative: `x d y` (ambivalent, aggregate)

Where `f` is a **binary** function the derivative `f/` returns

<code>f[x;f[y<sub>0</sub>;f[y<sub>1</sub>;…]]]</code>

```q
q)(+/)2 3 4  /unary
9
q)0+/2 3 4   /binary
9
```

<i class="fa fa-hand-o-right"></i> [ambivalent derivatives](syntax/#ambivalent-derivatives), [`over`](evaluationcontrol/#over) operator.


## `/` – fold

Syntax: `f/`  (unary)  
Derivative: `d[x;y;z;…]` (same rank as `f`)

Where `f` is a **function with rank above 2** and `y`, `z`, etc. conform, the derivative `f/` has the same rank as `f` and (e.g. for rank 3 and `y` and `z` of count `n`) returns  
<code>f[f[… f[f[x;y<sub>0</sub>;z<sub>0</sub>];y<sub>1</sub>;z<sub>1</sub>]; … y<sub>n-1</sub>;z<sub>n-1</sub>];y<sub>n</sub>;z<sub>n</sub>]</code>
```q
q){x+y+z}/[1 5 6;2 22;3 33]
61 65 66
```

!!! note "_Fold_ and _over_"
    _Over_ is _fold_ as applied to a binary function. 


## `\` – converge-iterate

Syntax: `d:f\` (unary)  
Derivative: `d y` (unary)  
Derivative: `x d y` (binary)

Where `f` is a **unary** function, the derivative `f\`

- (**converge**) applied **unary** calls `f` on `y` repeatedly until a value matching the `y` or the last result is produced. The result is `y` followed by all the results except the last.
```q
q)(neg\)1
1 -1
q)(rotate[1]\)"abcd"
("abcd";"bcda";"cdab";"dabc")
q)({x*x}\)0.1
0.1 0.01 0.0001 1e-08 1e-16 1e-32 1e-64 1e-128 1e-256 0
q){x*x}\[0.1]   / alternate syntax
0.1 0.01 0.0001 1e-08 1e-16 1e-32 1e-64 1e-128 1e-256 0
```

- (**iterate**) applied **binary**, `x` can be either an integer number of iterations or a while-condition that returns an int or boolean which can be applied to the result of `f`. 
```q
q)f:1+
q)f\[3;100]
100 101 102 103
q)f\[105>;100]
100 101 102 103 104 105
q)f\[105>sum@;84 20]
84 20
85 21
q)3 f\100 /applied infix
100 101 102 103
```


## `\` – scan

Syntax: `d:f\`  (unary)  
Derivative: `d y` (unary, uniform)  
Derivative: `x d y` (binary, uniform)  
Derivative: `d[x;y;z;…]` (uniform)

Where `f` is a **binary** function, the derivative `f\` applies `f/` to successive items of `x`. Its result is a list of the same count, built up as follows:
<code><pre>r<sub>0</sub> = x<sub>0</sub>
r<sub>i</sub> = f[r<sub>i-1</sub>;x<sub>i</sub>] for i > 0</pre></code>

Where `f\` is applied

- **unary**
```q
q)(+\)til 10
0 1 3 6 10 15 21 28 36 45
q)+\[til 10]
0 1 3 6 10 15 21 28 36 45
```

- **binary**, `x` is used as the initial value.
```q
q)1+\1 2 3
2 4 7
q)+\[1;1 2 3]
2 4 7
```

- **&gt;rank 2**, `x` is used as the initial value and other arguments are corresponding items from the lists.
```q
q){(x;y;z)}\[0;1 2 3;4 5 6]
0           1 4
0 1 4       2 5
(0 1 4;2;5) 3 6
```
As of V3.1 2013.07.07, `scan` has a built-in function for the following.
```q
q){{z+y*x}\[x;y;z]}
{{z+y*x}\[x;y;z]}
q){x y\z}           /alternative syntax using built-in function
```
Note that for the built-in version it is for floats.

<i class="fa fa-hand-o-right"></i> [`/` _over_ adverb](#over), [`over` operator](evaluationcontrol/#over), [`scan` operator](evaluationcontrol/#scan) 


## Derivatives

The semantics of a derivative – what it does – is determined by 

- the rank of the adverb’s function argument/s
- how the derivative is applied

Some derivatives are _ambivalent_, and what they do depends on whether they are applied as unary or binary functions. Most binary derivatives can be applied infix, e.g. `2+/3 4 5`. A named derivative, e.g. `total:+/` retains its ambivalence, but cannot be applied infix. 
```q
q)+/[2;3 4 5] ~ 2+/3 4 5  /prefix or infix
1b
q)total:+/
q)total[3 4 5]    /unary (not a projection)
12
q)total[2;3 4 5]  /binary
14
q)2 total 3 4 5   /but not infix
'type
  [0]  2 total 3 4 5
       ^
```

!!! tip "Projecting an ambivalent derivative"
    Applying a binary function to one argument _projects_ it on that argument: `treble:*[3]`. Ambivalent derivatives behave differently.
    ```q
    q)+/[2 3 4]  /applied unary
    9
    ```
    An ambivalent derivative can still be projected using the full form.
    ```q
    q)tenandsum:+/[10;]
    q)tenandsum 2 3 4
    19
    '''

<!-- ## Ambivalent functions

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

 -->