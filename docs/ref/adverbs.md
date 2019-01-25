Adverbs are primitive higher-order functions: they return derived functions, known as [_derivatives_](#derivatives).  They are much used for [iteration](control). 
```q
q)+/[2 3 4]      /reduce 2 3 4 with +
9
q)*/[2 3 4]      /reduce 2 3 4 with *
24
```
<i class="fa fa-hand-o-right"></i> [Adverb syntax](syntax/#adverbs), [`.Q.fu`](dotq/#qfu-apply-unique) (apply unique)

<div class="kx-compact" markdown="1">
</div>

| form            | adverb                        | semantics                                          |
|-----------------|-------------------------------|----------------------------------------------------|
| `int'[x;y;…]`   | [case](#case)                 | select from `[x;y;…]`                              |
| `'[f;g][x;y;…]` | [compose](#compose)           | compose `f` with `g`                               |
| `x f'y`         | [each-both](#each-both)       | apply `f` between items of `x` and `y`             |
| `x f\:y`        | [each-left](#each-left)       | apply `f` between `y` and items of `x`             |
| `x f/:y`        | [each-right](#each-right)     | apply `f` between `x` and items of `y`             |
| `f':x`          | [each-parallel](#each-right)  | apply `f` to items of `x` in parallel tasks        |
| `f':x`          | [each-prior](#each-prior)     | apply `f` between successive pairs of items of `x` |
| `f/x`           | [converge](#converge-repeat)  | apply `f` to `x` until converges                   |
| `x f/y`         | [repeat](#converge-repeat)    | apply `f` to `y`, `x` times or while `x`           |
| `x f/y`         | [over](#over)                 | reduce `y` with `f`                                |
| `f/[x;y;…]`     | [fold](#fold)                 | reduce `[x;y;…]` with `f`                          |
| `f\x`           | [converge](#converge-iterate) | apply `f` to `x` until converges                   |
| `x f\y`         | [iterate](#converge-iterate)  | apply `f` to `y`, `x` times or while `x`           |
| `f\x`           | [scan](#scan)                 | apply `f/` to successive items of `x`              |

Key: `int`: int vector; `f`: function; `g`: function; `x`: data; `y`: data.



## `'` (case)
<div markdown="1" style="float: right; margin-left: 2em;">
![case](img/case.png)
</div>

_Pick successive items from multiple list arguments: the left argument of the adverb determines from which argument of the derivative each item is picked._

Syntax: `d:x'` (unary, postfix)  
Derivative: `d y` (multivalent) 

Where `x` is an integer vector and $args$ are the arguments to the derivative, the derivative `x'` returns $r$ such that 
$r_i$ is ($args_{x_i})_i$

Atom arguments in `y` are treated as infinitely-repeated values.
```q
q)0 1 0'["abc";"xyz"]
"ayc"
q)e:`one`two`three`four`five
q)f:`un`deux`trois`quatre`cinq
q)g:`eins`zwei`drei`vier`funf
q)l:`English`French`German
q)l?`German`English`French`French`German
2 0 1 1 2
q)(l?`German`English`French`French`German)'[e;f;g]
`eins`two`trois`quatre`funf

q)/extra arguments don't signal a rank error
q)0 2 0'["abc";"xyz";"123";"789"]
"a2c"
q)0 1 0'["a";"xyz"]  /atom "a" repeated as needed
"aya"
```

_Case_ is useful for selecting between record fields according to a test on some other field. 

Suppose we have lists `h` and `o` of home and office phone numbers, and a third list `p` indicating at which number the subject prefers to be called. 

```q
q)([]pref: p;home: h; office: o; call: (`home`office?p)'[h;o])
pref   home             office           call
---------------------------------------------------------
home   "(973)-902-8196" "(431)-158-8403" "(973)-902-8196"
office "(448)-242-6173" "(123)-993-9804" "(123)-993-9804"
office "(649)-678-6937" "(577)-671-6744" "(577)-671-6744"
home   "(677)-200-5231" "(546)-864-5636" "(677)-200-5231"
home   "(463)-653-5120" "(636)-437-2336" "(463)-653-5120"
```


## `'` (compose)

Syntax: `d:'[g;f]` (binary, prefix)  
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
    This can be extended with [`over`](control/#over) to compose a list of functions.
    <pre><code class="language-q">
    q)g1:{10*x}
    q)d1:('[;]) over (g1;g;f)  / Use ('[;]) so the correct form is used
    q)d1[1;2;3;4]
    200
    </code></pre>

<div markdown="1" style="float: right; margin-left: 1em;">
![each-both](img/each-both.png)
</div>
## `'` (each-both)

_Applies a function between corresponding items of the argument lists._

Syntax: `d:f'` (unary, postfix)  
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


<div markdown="1" style="float: right; margin-left: 1em;">
![each-left](img/each-left.png)
</div>
## `\:` (each-left)

_Applies a function between each item of the left argument and the right argument._

Syntax: `d:f\:` (unary, postfix)  
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


<div markdown="1" style="float: right; margin-left: 1em;">
![each-right](img/each-right.png)
</div>
## `/:` (each-right)

_Applies a function between the left argument and each item of the right argument._

Syntax: `d:f/:` (unary, postfix)  
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
    <pre><code class="language-q">
    q){}0N!(til 4),\:/: til 4
    ((0 0;1 0;2 0;3 0);(0 1;1 1;2 1;3 1);(0 2;1 2;2 2;3 2);(0 3;1 3;2 3;3 3))
    </code></pre>
    resembles the result obtained by `cross`
    <pre><code class="language-q">
    q){}0N!cross[til 4;til 4]
    (0 0;0 1;0 2;0 3;1 0;1 1;1 2;1 3;2 0;2 1;2 2;2 3;3 0;3 1;3 2;3 3)
    </code></pre>


<div markdown="1" style="float: right; margin-left: 2em;">
![each-parallel](img/each-parallel.png)
</div>
## `':` (each-parallel)

_Each item of the argument list is assigned to a slave task, where the function is applied to each of its items._

Syntax: `d:f':` (unary, postfix)  
Derivative: `d x` (unary, uniform) 

Where `f` is a **unary** function, the derivative `f':` assigns the items of `x` to separate slave tasks, and in each task applies `f` to each item of the sublist. 
```bash
$ q -s 2
KDB+ 3.4 2016.06.14 Copyright (C) 1993-2016 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE
```
```q
q)\t ({sum exp x?1.0}' )2#1000000  / each
185
q)\t ({sum exp x?1.0}':)2#1000000  / peach
79
q)peach
k){x':y}
```

<i class="fa fa-hand-o-right"></i> [command-line options](cmdline), [parallel processing, `peach`](peach)


!!! tip "Projecting a unary function with _apply_"
    You can use [_apply_ `.`](unclassified/#apply) to project a binary or higher-rank function as a unary function of a list of its arguments. The projection can then be combined with an adverb (such as _each-parallel_ or _converge-iterate_) that takes a unary function as its argument. 
    <pre><code class="language-q">
    q)f2:{(0|x-1;x rotate y)} / binary fn, returns 2-list
    q)f1:f2 .                 / unary fn of a 2-list
    q)f1\\[(4;"hello")]        / converge-iterate
    4 "hello"
    3 "ohell"
    2 "llohe"
    1 "ohell"
    0 "hello"
    </code></pre>
    Note that for _converge-repeat_ and _converge-iterate_, the function must return a list of the same length as its rank.


<div markdown="1" style="float: right; margin-left: 1em;">
![each-prior](img/each-prior.png)
</div>
## `':` (each-prior)

_Applies a function between each item of a list and its preceding item._

Syntax: `d:f':`  (unary, postfix)  
Derivative: `  d y` (unary, uniform)  
Derivative: `x d y` (binary, uniform)

Where `f` is a **binary** function, the ambivalent derivative `f':` applies `f` between each item of `y` and `x,-1_y`. 

In unary application of the derivative, `x` defaults to `(1#0#y)0`.
```q
q)99,':til 4
0 99
1 0
2 1
3 2
q)(,':)til 4  / x defaults to 0N
0
1 0
2 1
3 2
q)"abc",':"xyz"
"xabc"
"yx"
"zy"
q)0 1-':2 5 9
2 1
3
4
q)0-':2 5 9
2 3 4
q)-':[2 5 9]     /deltas
2 3 4
```
form       | example            | note               
-----------|--------------------|----------------
`f':[y]`   | `-':[   1 4 9 16]` | unary          
`(f':)y`   | `(-':)  1 4 9 16`  | juxtaposition  
`x f': y`  | `9-':   1 4 9 16`  | infix (binary) 
`f':[x;y]` | `-':[9; 1 4 9 16]` | prefix (binary)
`f':[x;]y` | `-':[9;]1 4 9 16`  | projection    


<div markdown="1" style="float: right; font-style: italic; font-size: 80%; margin-left: 1em; text-align: center; width: 150px">
[![St Patrick driving the snakes out of Ireland](img/snakes.jpg)](img/snakes.jpg)  
Are we there yet?
</div>
## `/` (converge-repeat)

_Applies a function either a specified number of times, or until the result converges._

Syntax: `d:f/`  (unary, postfix)  
Derivative: `d y` (unary)  
Derivative: `x d y` (binary)

Where `f` is a **unary** function, the derivative `f/` 

- (**converge**) applied **unary** applies `f` repeatedly to `y` until either (1) two successive results agree within comparison tolerance or (2) the result matches `y`. The latter will save you from some infinite cycles but not all.
<pre><code class="language-q">
q)(not/) 1b
0b
q)(not/) 42  /never returns 
</code></pre>
    The related form [_converge-iterate_](#converge-iterate) can be useful to see the intermediate results. (Set `\P 0` to see the convergence of your original computation.)

- (**repeat**) applied **binary** where (a) `x` is a **positive int atom**, returns the result of `x` successive applications of `f` to `y`
<code>f&nbsp;f&nbsp;f&nbsp;…&nbsp;f&nbsp;f&nbsp;y</code>

    <pre><code class="language-q">
    /first 10+2 numbers of Fibonacci sequence
    q)10{x,sum -2#x}/0 1             / derived binary applied infix
    0 1 1 2 3 5 8 13 21 34 55 89
    /first n+2 numbers of Fibonacci sequence
    q)fibonacci:{x,sum -2#x}/[;0 1]  / projection of derived function
    q)fibonacci 10
    0 1 1 2 3 5 8 13 21 34 55 89
    </code></pre>

    or where (b) `x` is a **function**, returns the result when `x` applied to the result returns `0b`.

    <pre><code class="language-q">
    q){x+x}/[{x<1000};2]   /prefix: f/[g;y]
    1024
    q){x<1000}{x+x}/2      /infix: g f/y
    1024
    </code></pre>


<div markdown="1" style="float: right; margin-left: 2em;">
![over](img/over.png)
</div>
## `/` (over)

_Map-reduce: applies a binary function between elements of the argument, working from left to right._

Syntax: `d:f/`  (unary, postfix)  
Derivative: `x d y` (ambivalent, aggregate)

Where `f` is a **binary** function and `y` has count `n`

`f/[y]`
: <code>f[f[…f[f[y<sub>0</sub>;y<sub>1</sub>];y<sub>2</sub>];…y<sub>n-2</sub>];y<sub>n-1</sub>]</code>

`f/[x;y]`
: <code>f[f[…f[f[x;y<sub>0</sub>];y<sub>1</sub>];…y<sub>n-2</sub>];y<sub>n-1</sub>]</code>

```q
q)(+/)2 3 4  /unary
9
q)0+/2 3 4   /binary
9
q)-/[8 1 9 5 4]
-11
```

<i class="fa fa-hand-o-right"></i> [ambivalent derivatives](syntax/#ambivalent-derivatives), [`over` operator](control/#over).


## `/` (fold)

_Over (map-reduce) for functions with more than two arguments._

Syntax: `d:f/`  (unary, postfix)  
Derivative: `d[x;y;z;…]` (same rank as `f`)

Where `f` is a **function with rank above 2** and `y`, `z`, etc. conform, the derivative `f/` has the same rank as `f`. Example: for `f` of rank 3 and `y` and `z` of count `n`)

`f/[x;y;z]` 
: <code>f[f[… f[f[x;y<sub>0</sub>;z<sub>0</sub>];y<sub>1</sub>;z<sub>1</sub>]; … y<sub>n-2</sub>;z<sub>n-2</sub>];y<sub>n-1</sub>;z<sub>n-1</sub>]</code>

```q
q){x+y+z}/[1 5 6;2 22;3 33]
61 65 66
```

!!! note "_Fold_ and _over_"
    _Over_ is _fold_ as applied to a binary function. 


## `\` (converge-iterate)

Syntax: `d:f\` (unary, postfix)  
Derivative: `d y` (unary)  
Derivative: `x d y` (binary)

Where `f` is a **unary** function, the derivative `f\`

- (**converge**) applied **unary** calls `f` on `y` repeatedly until a value matching the `y` or the last result is produced. The result is `y` followed by all the results except the last.
<pre><code class="language-q">
q)(neg\\)1
1 -1
q)(rotate[1]\\)"abcd"
"abcd"
"bcda"
"cdab"
"dabc"
q)({x\*x}\\)0.1
0.1 0.01 0.0001 1e-08 1e-16 1e-32 1e-64 1e-128 1e-256 0
q){x\*x}\\[0.1]
0.1 0.01 0.0001 1e-08 1e-16 1e-32 1e-64 1e-128 1e-256 0
</code></pre>

- (**iterate**) applied **binary**, `x` can be either an integer number of iterations or a while-condition that returns an int or boolean which can be applied to the result of `f`. 
<pre><code class="language-q">
q)f:1+
q)f\\[3;100]
100 101 102 103
q)f\\[105>;100]
100 101 102 103 104 105
q)f\\[105>sum@;84 20]
84 20
85 21
q)3 f\100 /applied infix
100 101 102 103
</code></pre>

## `\` (scan)

Syntax: `d:f\`  (unary, postfix)  
Derivative: `d y` (unary, uniform)  
Derivative: `x d y` (binary, uniform)  
Derivative: `d[x;y;z;…]` (uniform)

Where `f` is a **binary** function (or **matrix** – see below), the derivative `f\` applies `f/` to successive items of 
<!-- `x`. --> 
`x@/: {(1+x)#\:x} til count x`.
Its result is a list of the same count, built up as follows:
<pre><code class="language-txt">
r<sub>0</sub> = x<sub>0</sub> r<sub>i</sub> = f[r<sub>i-1</sub>;x<sub>i</sub>] for i > 0
</code></pre>

Where `f\` is applied

- **unary** 
<pre><code class="language-q">
q)(+\\)til 10
0 1 3 6 10 15 21 28 36 45
q)+\\[til 10]
0 1 3 6 10 15 21 28 36 45
</code></pre>

- **binary**, `x` is used as the initial value.
<pre><code class="language-q">
q)1+\1 2 3
2 4 7
q)+\\[1;1 2 3]
2 4 7
</code></pre>

- **&gt;rank 2**, `x` is used as the initial value and other arguments are corresponding items from the lists.
<pre><code class="language-q">
q){(x;y;z)}\\[0;1 2 3;4 5 6]
0           1 4
0 1 4       2 5
(0 1 4;2;5) 3 6
</code></pre>


### Finite-state machine

Consider a matrix as both a _binary function_ (of row- and column-indexes) and a _finite-state machine_. Such a matrix can be applied via _scan_ and _over_:
```q
initialstate transitionmatrix\input
initialstate transitionmatrix/input
```
```q
q)m:(0 2;1 1;0 1)
q)0 m\1 0 1 1 0 1
2 0 2 1 1 1
q)0 m/1 0 1 1 0 1
1
```


### Alternative syntax

As of V3.1 2013.07.07, _scan_ has a built-in function for the following.
```q
q){{z+y*x}\[x;y;z]}
{{z+y*x}\[x;y;z]}
q){x y\z}           /alternative syntax using built-in function
{x y\z}
```
Note that for the built-in version it is for floats.

<i class="fa fa-hand-o-right"></i> [`/` _over_ adverb](#over), [`over` operator](control/#over), [`scan` operator](control/#scan), Tutorial: [Shifts and scans](/tutorials/shifts-scans/) 


## Derivatives

The semantics of a derivative – what it does – is determined by 

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
    <pre><code class="language-q">
    q)+/[2 3 4]  /applied unary
    9
    </code></pre>
    An ambivalent derivative can still be projected using the full form.
    <pre><code class="language-q">
    q)tenandsum:+/[10;]
    q)tenandsum 2 3 4
    19
    </code></pre>


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