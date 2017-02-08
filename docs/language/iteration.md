Iteration is mostly achieved using these [higher-order functions](higher-order-functions) and [operators](operators). 

## `each` 

Syntax: `f each x` (binary, infix) 

Where `f` is a binary function, applies `f` to each item in its argument.
```q
q)count (1 2 3;"hello")
2
q)count each (1 2 3;"hello")  // count is the left-argument of each
3 5
```


## each-both `'`

Syntax: `f'` (unary, postfix)

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

Syntax: `f\:` (unary, postfix)

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


## each-parallel `':`

Syntax: `f':` (unary, postfix)

Where `f` is a unary function, returns a function that assigns the items of its list argument to separate slave tasks and in each task applies `f` to each item of the sublist. 
```q
$ q -s 2
KDB+ 3.4 2016.06.14 Copyright (C) 1993-2016 Kx Systems
m32/ 2()core 4096MB sjt mark.local 192.168.0.17 NONEXPIRE
q)\t ({sum exp x?1.0}' )2#1000000  / each
185
q)\t ({sum exp x?1.0}':)2#1000000  / peach
79
q)peach
k){x':y}
```


## each-prior `':`

Syntax: `f':`  (unary, postfix) 

Where `f` is a binary function, returns a unary function that applies `f` between each item of `x` and its predecessor.

| form       | example                         |
|------------|---------------------------------|
| `f':[y]`   | `-':[   1 4 9 16]`              |
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


## each-right `/:` 

Syntax: `f/:` (unary, postfix)

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


## fold `/`

Syntax: `f/`  (unary, postfix)

Returns a function that folds `f` over its argument. Where

- `f` is a binary function `f/[x]` returns  
<code>f[f[… f[f[x<sub>0</sub>;x<sub>1</sub>];x<sub>2</sub>]; … x<sub>n-1</sub>];x<sub>n</sub>]</code>  
and `f/[x;y]` returns  
<code>f[f[… f[f[x;y<sub>0</sub>];y<sub>1</sub>]; … y<sub>n-1</sub>];y<sub>n</sub>]</code> 
```q
q)+/[1 2 3]
6
q)+/[10;1 2 3]
16
```

!!! note "`/` and `over`"
    For binary function `f`, `f/[x]` and `f over x` are equivalent.

- `f` is a function with 3 arguments, `f/[x;y;z]` returns  
<code>f[f[… f[f[x;y<sub>0</sub>;z<sub>0</sub>];y<sub>1</sub>;z<sub>1</sub>]; … y<sub>n-1</sub>;z<sub>n-1</sub>];y<sub>n</sub>;z<sub>n</sub>]</code>
```q
q){x+y+z}/[1 5 6;2 22;3 33]
61 65 66
```

- `f` is a unary function, `f/[n;x]` returns  
<code>f[f[…f[f[x]] …]</code>  
where `f` is called `n` times
```q
/first n+2 numbers of fibonacci sequence
q) fibonacci:{{x,sum -2#x}/[x;0 1]}
q) fibonacci[10]
0 1 1 2 3 5 8 13 21 34 55 89
```


## `over`

Syntax: `f over x` (binary, infix) 

Where `f` is a binary function, applies `f` between successive elements of its argument. 
```q
q){x+2*y} over 2 3 5 7
32
q)over[{x+2*y};2 3 5 7]
32
q)(and)over 4 3 7
3
```
The result is built up by applying `f` successively as follows:
<pre><code>
r = x<sub>0</sub>
r = f[r;x<sub>i</sub>] for i = 1…n
</code></pre>

!!! tip "See the successive results"
    The successive results may be seen with `scan`. This works the same way as `over` but returns all the intermediate results:
    ```q
    q){x+2*y} scan 2 3 5 7
    2 8 18 32
    ```

## `prior` 

Syntax: `f prior x` (binary, infix) 

```q
q)(-)prior 2 3 4   / e.g. same as deltas 2 3 4
2 1 1
```


## `peach`

Syntax: `f peach x` (binary, infix) 

```q
q)peach
{x':y}
```

See [each-parallel](#each-parallel) and [Parallel each](peach)


## scan \

Syntax: `f\`  (unary, postfix) 

Where `f` is a binary function, returns a uniform unary function that applies `f/` to successive items of its list argument. Its result is a list of the same length, built up as follows:
<code><pre>r<sub>0</sub> = x<sub>0</sub>
r<sub>i</sub> = f[r<sub>i-1</sub>;x<sub>i</sub>] for i > 0</pre></code>


## `scan`

Syntax: `f scan x` (binary, infix, uniform)

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
q)(+) scan 2 3 5 7    / cumulative sums
2 5 10 17
```

!!! Tip 
    `over` works the same way as `scan` but returns only the last result.


