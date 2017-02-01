Symbols
=======

& (ampersand)
-------------

Used **dyadically**, this is the _minimum_ function. The arguments may be of any type except symbol:

    q)3 & til 7
    0 1 2 3 3 3 3
    q)2 3 5 & -1 6 4
    -1 3 4
    q)100 & "cde"
    "cdd"

Note that this is the same as logical [and](#and) for boolean arguments:

    q)0011b & 0101b
    0001b

Used **monadically**, this is the [`where`](where) function:

    q)(&) 0 1 0 1 1
    1 3 4

See also [`and`](and), [`max`/`reverse`](Bar), [`where`](where)


' (apostrophe)
--------------

[each-both](FIXME)

### signal

signal is a control word that aborts evaluation. signal accepts a symbol or string like `` '`err `` or `'"err"`

```q
q)0N!0;'`err;0N!1
0
'err
```

As shown above, when q detects the `` `err`` signal, it is shown on the console as 'err.

The only way to detect a signal is to use [trap](trap).

```q
q)f:{@[{'x};x;{"trap:",x}]}
q)f`err
"trap:err"
```

Note that [trap](trap) always receives a string regardless of the type of `x`.

signal has some restrictions as illustrated:

```q
q)f 1             /signals a type error indicating ' will not signal a number
"trap:stype"
q)f"a"            /q will not signal a char
"trap:stype"
```

Using an undefined word throws a signal:

```q
q)'word
'word
```

which is indistinguishable from

```q
q)word
'word
```

### case

On the right of an integer vector `v` of length n, turns `v` into an n-ary function that for each i-th argument selects its v\[i\]-th element. All arguments must be of the same length or scalar. Scalar arguments treated as infinitely repeated values.

```q
    q)0 1 2'[1 2 3;10 20 30;100]
    1 20 100
```

### composition

Provided a polyadic function `f` and a monadic function `g`, `g` can be composed with `f` to produce a new function with the same function signature as `f` but with the composition applied.

```q
q)f:{[w;x;y;z]w+x+y+z}
q)g:{2*x}
q)h:('[g;f]) / The interpreter is finicky about :'
q)h[1;2;3;4]
20
```

This can be extended to use the `over` function to compose a list of functions:

```q
q)g1:{10*x}
q)h1:('[;]) over (g1;g;f) / Use ('[;]) so the correct form is used
q)h1[1;2;3;4]
200
```


': (apostrophe colon)
---------------------

`':` is an adverb like [`\`](BackSlash#iterate) _iterate_ and [`'`](Apostrophe#each) _each_.

In the expression `f':`

- when `f` is dyadic, the expression is [`prior`](ApostropheColon#prior)
- when `f` is monadic, it is [`peach`](ApostropheColon#peach)

### prior

For dyadic `f`, `f':` applied to a list `x` of length `n` returns `(f[x` `0;0N];f[x` `1;x` `0];f[x` `2;x` `1];...;f[x` `n-1;x` `n-2])`

The first item in the result is produced by passing the first value and null to `f`. This first null value has the same type as the first value in `x`. eg. if `x` is a float list, the null will be `0n`.

Example **Show the current and prior**

```q
q)({(x;y)}':)1 2 3 4
1
2 1
3 2
4 3
q)0N!({(x;y)}':)1 2 3 4; /show the result in executable syntax
(1 0N;2 1;3 2;4 3)
q)0N!((;)':)1 2 3 4;     /{(x;y)} can be replaced by the shorter (;)
(1 0N;2 1;3 2;4 3)
```

[executable syntax](BangSymbol#other)

Some primitives behave specially with monadic `prior`:

```q
q)(-':)1 4 9 16
1 3 5 7                   /q helps us out by behaving like 0 -': 1 4 9 16
q)({x-y}':)1 4 9 16       /general behaviour using an equivalent lambda
0N 3 5 7
```

**Dyadic prior** In the monadic form, `prior` passes a null for the first prior value. In the dyadic form, the first prior value can be specified.

In `x` `f':` `y`, `x` is used in place of the initial null so the result is `(f[y` `0;x];f[y` `1;y` `0];f[y` `2;y` `1];...;f[y` `n-1;y` `n-2])`.

```q
q)0N!9(;)':1 2 3 4;
(1 9;2 1;3 2;4 3)
```

### peach

If `f` is a *monad*, `':` is [`peach`](peach).

```q
$ q -s 2
KDB+ 3.0 2012.11.13 Copyright (C) 1993-2012 Kx Systems
l32/ 2()core 3539MB jack sff 127.0.0.1 PLAY 2013.02.11 
q)\t ({sum exp x?1.0}' )2#1000000  /[each](Apostrophe)
163
q)\t ({sum exp x?1.0}':)2#1000000  /[peach](peach)
114

q)peach
k){x':y}
```

Syntax:

```q
form            example
  f':[y]         -':[  1 4 9 16]
 (f':)y         (-':)  1 4 9 16
x f': y         9-':   1 4 9 16    
  f':[x;y]      -':[9; 1 4 9 16]
  f':[x;]y      -':[9;]1 4 9 16   /projection
```

Examples:

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

\* (asterisk)
-------------

The _multiply_ function. 


@ (at)
---------------

The verb `@` is used for indexing at the top level. It selects items from the list specified by the first argument at indices specified by the second

```q
q)d:((1 2 3;4 5 6 7);(8 9;10;11 12);(13 14;15 16 17 18;19 20))
q)d@1
(8 9;10;11 12)
q)d@1 2 / selects 2 items at the top level
((8 9;10;11 12);(13 14;15 16 17 18;19 20))
q)@[d;1 1 1;+;3]
((1 2 3;4 5 6 7);(17 18;19;20 21);(13 14;15 16 17 18;19 20))
```

For the four-argument form above, see [Functional Forms of Amend](JB:QforMortals2/functions#Functional_Forms_of_Amend "wikilink").

Since kdb+ v3.4, certain vectors can be updated directly on disk without the need to fully rewrite the file. Such vectors must have no attribute, be of a mappable type, not nested, and not compressed. e.g.

```q
q)`:data set til 20;
q)@[`:data;3 6 8;:;100 200 300];
q)get`:data
0 1 2 100 4 5 200 7 300 9 10 11 12 13 14 15 16 17 18 19
```

A monadic function `g` with argument `d` can be evaluated by `g@d` or `g . enlist d`.

```q
q)f:{x*2}
q)f@42
84
```

Functions with no arguments require special handling. For example, if `f:{2+3}` then `f` can be evaluated with `@` and any argument.

```q
q)f:{2+3}
q)f[]
5
q)f@0
5
```

Both `.` and `@` are referred to as _index_ or _apply_, depending on the context.

### trap

`@` is also [`trap`](trap)

See also [`.`](DotSymbol) (_index_/_apply_), [Functional Forms of Amend](JB:QforMortals2/functions#Functional_Forms_of_Amend "wikilink")


\\ (backslash)
--------------
<!--
\\ ([abort](#abort "wikilink")/[scan](#scan "wikilink")/[iterate](#iterate "wikilink")/[system](#system "wikilink")/[escape](#escape "wikilink"))
-->

### abort

Type `\` at the debugger (`q))`) prompt to return to the interactive session.

```q
q)f:{g[]}
q)g:{'`xyz}
q)f[]
{g[]}
'xyz
@
{'`xyz}
::
q))\
q)
```

### toggle q/k

In the interactive session `\` toggles between q and k prompts:

```q

q)\
  \
q)
```

### end of multi-line comment

A multi-line comment starts with a `/` and ends with a `\`.

For example:

```q
/
There was an Old Man of Nantucket
Who kept all his cash in a bucket.
\
```

### end of script

In q scripts, `\` on a line by itself marks the end of the q program. The remaining text in the file is ignored. Note that unlike `\\`, `\` does not cause q to terminate after executing the script.

### scan

If `f` is a **dyadic** function, `f\` applied to a list x<sub>1</sub>, x<sub>2</sub>, … x<sub>n</sub> returns x<sub>1</sub>, f(x<sub>1</sub>,x<sub>2</sub>), f(f(x<sub>1</sub>,x<sub>2</sub>),x<sub>3</sub>), ..,f(..,x<sub>n</sub>). For example,

```q
q)(+\)til 10
0 1 3 6 10 15 21 28 36 45
q)+\[til 10]   / alternate syntax
0 1 3 6 10 15 21 28 36 45
```

When `f\` is used as a dyad, the first argument is used as the initial value:

```q
q)1+\1 2 3
2 4 7
q)+\[1;1 2 3]   / alternate syntax
2 4 7
```

The alternate syntax generalizes to functions of 3 or more arguments where the first argument is used as the initial value and the arguments are corresponding elements from the lists:

```q
q){(x;y;z)}\[0;1 2 3;4 5 6]
0           1 4
0 1 4       2 5
(0 1 4;2;5) 3 6
```

As of kdb+3.1 2013.07.07, _scan_ has a built-in function for the following

```q
q){{z+y*x}\[x;y;z]}
{{z+y*x}\[x;y;z]}
q){x y\z}    / alternate syntax that uses built in function
```

Note that for the built-in version it is for floats.

### iterate

If `f` is a **monadic** function, `f\` calls `f` on its argument repeatedly until a value matching the argument or the last seen is produced. The result is the argument followed by all the results except the last. For example:

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

When `f\` is called with two arguments, the first argument can be either an integer number of iterations or a "while" condition, which return an int or boolean, that can be applied to the result of `f`:

```q
q)f:1+
q)f\[3;100]
100 101 102 103
q)f\[105>;100]
100 101 102 103 104 105
q)f\[105>sum@;84 20]
84 20
85 21
```

Dyadic form of `f\` can also be specified using infix notation:

```q
q)3 f\100
100 101 102 103
```

### system

`\` followed by a system command results in the command being executed in a subshell and the result returned to q as a list of strings. For example,

```q
q)\printf hello\\nworld
"hello"
"world"
```

See also [system](system)

### escape

When `\` is used inside character or string displays, it serves as an escape character.

|       |                                           |
|-------|-------------------------------------------|
| \\"   | double quote                              |
| \\NNN | character with octal value NNN (3 digits) |
| \\\\  | backslash                                 |
| \\n   | new line                                  |
| \\r   | carriage return                           |
| \\t   | horizontal tab                            |

### commands

See [System Commands](SystemCommands).


\\\\ (backslash backslash)
-----------

Type `\\` at the prompt to exit q session. Inside a function, use `value"\\\\"` or `exit` `0` for the same result.

Note that the text following `\\` and white space is ignored by q. This is often useful in scripts where `\\` can be followed by comments or usage examples.

See also [exit](exit)

\\: (backslash colon)
---------------------

### each left

Apply the dyadic function `f` between `y` and each of the elements of `x` in turn

**Syntax**

```q
    x f\: y
```

`f` is a diadic function, `x` is a list, `y` is an atom or list

**Example**
```q
(til 5),\:1
(0 1;1 1;2 1;3 1;4 1)

(3 5 4 1 2) {x*y}\:5
15 25 20 5 10
```

Combined with _each right_

```q
(til 4),\:/: til 4
((0 0;1 0;2 0;3 0);(0 1;1 1;2 1;3 1);(0 2;1 2;2 2;3 2);(0 3;1 3;2 3;3 3))
```

This is similar to the result obtained by `cross`

```q
cross[til 4;til 4]
(0 0;0 1;0 2;0 3;1 0;1 1;1 2;1 3;2 0;2 1;2 2;2 3;3 0;3 1;3 2;3 3)
```

See also [each-right](SlashColon#.2F:_.28each_right.29)

### Integer to byte vector

**Example**
```q
q)`0x0\:1234605616436508552`
`0x1122334455667788`
```


\` (backtick)
-------------

A backtick `` ` `` followed by a series of characters represents a symbol, which is not the same as a string. See [|Q for Mortals](FIXME) for more information about this.

```q
q)s:`symbol
q)s ~ "symbol"
0b
```

A backtick without characters after it represents the empty symbol. This empty symbol can be used with [$ (cast)](Reference/DollarSign "wikilink") to cast a string into a symbol, creating symbols whose names could not normally be written down, such as symbols containing spaces. `` `$x`` is shorthand for `"S"$x`. 

```q
q)s:`hello world
'world
q)s:`$"hello world"
q)s
`hello world
```

When running [`update`](Reference/update "wikilink") and [`delete`](Reference/delete "wikilink") statements on a table, putting a `` ` `` before the table's name will modify the table:

```q
q)t1:t2:([]a:1 2;b:3 4)
q)update a:neg a from t1
a  b
----
-1 3
-2 4
q)t1~t2
1b
q)update a:neg a from `t1
`t1
q)t1~t2
0b
```


! (bang)
-------

### dict

`!` is a dyadic function that takes two lists of the same length and returns a dictionary.

```q
q)`a`b`c!1 2 3
a| 1
b| 2
c| 3
```

Because tables are collections of like dictionaries, `!` applied to each member of a list will return a table of that list. For example:

```q
q)(`a`b`c!)each(0 0 0;1 2 3;2 4 6)
a b c
-----
0 0 0
1 2 3
2 4 6
```

The same result may be achieved with a pair of `flip`s:

```q
q)flip`a`b`c!flip(0 0 0;1 2 3;2 4 6)
a b c
-----
0 0 0
1 2 3
2 4 6
```

### key

With a positive integer on the left hand side, converts a simple table to a keyed table with the given number of key columns:

```q
q)t:([]a:1 2 3;b:10 20 30;c:`x`y`z)
q)2!t
a b | c
----| -
1 10| x
2 20| y
3 30| z
```

With a 0 on the left hand side, converts a keyed table to a simple one:

```q
q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
q)0!t
a b  c
------
1 10 x
2 20 y
3 30 z
```

Note that if given a table name instead of a table it amends the table

```q
q)t:([a:1 2 3]b:10 20 30;c:`x`y`z)
q)0!`t
`t
q)t
a b  c
------
1 10 x
2 20 y
3 30 z
```

### enumeration

With a symbol on the left hand side, `!` converts an integer list to an enumerated symbol list.

```q
q)x:`a`b`c`d
q)`x!1 2 3
`x$`b`c`d
```

### functional update/delete

See [Functional update](JB:QforMortals2/queries_q_sql#Functional_update "wikilink") and [Functional delete](JB:QforMortals2/queries_q_sql#Functional_delete "wikilink").

### 0N!x

With a `0N` on the left hand side, returns the right-hand side after printing its unformatted text representation to console. This is useful for debugging, or avoiding formatting which may obscure the data's structure.

```q
q)2+0N!3
3
5
```

### -N!x

With a negative integer on the left-hand side, calls an internal function; for gory details, see [internal functions](Reference/BangSymbolInternalFunction "wikilink").

### symbols!x

With a symbol list on the left-hand side and an [hsym symbol atom](FIXME) on the right-hand side, creates the flip of a splayed table. With a symbol list on the left-hand side and a [non-hsym symbol atom](FIXME) on the right-hand side, creates the flip of a partitioned table. In either case, once the resulting object is flipped, the symbol list from the left-hand side becomes the columns of the table.

See also [`lsq`](Reference/lsq "wikilink")


| (bar)
-------

### maximum

Used dyadically, `|` is the _maximum_ function. The arguments may be of any type except symbol:

```q
q)3 | til 7
3 3 3 3 4 5 6
q)2 3 5 | -1 6 4
2 6 5
q)100 | "cde"
"dde"
```

Note that this is the same as logical [or](Reference/or "wikilink") for boolean arguments:

```q
q)0011b | 0101b
0111b
```

### reverse

Used monadically, `|` is the [`reverse`](Reference/reverse "wikilink") function:

```q
q)(|) 1 2 3
3 2 1
```

See also [`min`, `where`](Reference/Ampersand "wikilink"), [`or`](Reference/or "wikilink"), [`reverse`](Reference/reverse "wikilink")


\[ \] (brackets)
---------------

### block

Some expressions, such as the [_if-else_](Reference/DollarSign "wikilink"), use single expressions as parameters. However, it is possible to use multiple expressions in the place of one by placing several expressions, separated by semicolons, inside `[]` brackets:

```q
q)$[1b;b:"tr";b,"ue";"false"]   / invalid
'rank
q)$[1b;[b:"tr";b,"ue"];"false"]
"true"
```

### arguments

The arguments of a function can be included within brackets, separated by semicolons. This syntax is sometimes necessary, and always allowed.

```q
q)$[`int;0xff]      / equivalent to `int$0xff, note order of arguments
255
q)+/[1 2 3]         / cannot write +/1 2 3 directly
6
q){x+y+z}[1;2;3]
6
q)f:+[3;]           / leave out an argument to create a projected function
q)f 4
7
```


^ (caret)
---------

### fill

The dyadic function `^` _fill_ is scalar atomic and replaces null values in the right argument with the left argument.

```q
q)0^1 2 3 0N
1 2 3 0
q)100^1 2 -5 0N 10 0N
1 2 -5 100 10 100
q)1.0^1.2 -4.5 0n 0n 15
1.2 -4.5 1 1 15
q)`nobody^`tom`dick``harry
`tom`dick`nobody`harry
q)1 2 3 4 5^6 0N 8 9 0N
6 2 8 9 5
```

Integer left arguments are promoted when the right argument is float or real.

```q
q)a:11.0 2.1 3.1 0n 4.5 0n
q)type a
9h
q)10^a
11 2.1 3.1 10 4.5 10
q)type 10^a
9h
```

When the arguments are dictionaries, both null and missing values in the right argument are filled with those from the left argument:

```q
q)(`a`b`c!1 2 3)^`b`c!0N 30
a| 1
b| 2
c| 30
```

### coalesce

Until coalesce is defined in the reference, see <http://code.kx.com/wiki/JB:QforMortals2/tables#Coalesce_.28.5E.29>

See also [`fills`](Reference/fills "wikilink"), [null](Reference/null "wikilink")

: (colon)
---------

### return

See [return](JB:QforMortals2/execution_control#Return_and_Signal "wikilink")

### amend

See [amend](JB:QforMortals2/functions#Amend_.28:.29 "wikilink")

### single-argument meaning

An obscure use of the colon is explicitly to select the single-argument meaning of a function. This is not particularly readable but can save characters.

```q
q),:[3]    / same as enlist 3
,3
```


:: (colon colon)
----------------

### identity function
  
`::` is the monadic identity function – it returns its argument unchanged:

```q
q)(::)1
1
```

This can be used in statements applying multiple functions to the same data, if one of the operations desired is "do nothing":

```q
q)(::;avg)@\:1 2 3
1 2 3
2f
```

### indexing

Similarly, the identity can also be achieved via indexing, e.g.

```q
q)1 2 3 ::
1 2 3
```

and used in variants thereof for e.g. amends

```q
q)@[til 10;(::;2 3);2+]
2 3 6 7 6 7 8 9 10 11
```

### generic null

Unlike previous versions of k, q does not have a dedicated null type. Instead `::` is used to denote a generic null value. For example, functions that return no value, return `::`

```q
q)enlist {1;}[]
::
```

(we use `enlist` to force q to display a null result, a pure `::` is not displayed)

When a monadic function is called with no arguments, :: is passed in:

```q
q)enlist {x}[]
::
```

Since `::` has a type for which no vector variant exists, it is useful to prevent a generic list from being coerced into a vector when all elements happen to be of the same type. This is important when you need to preserve the ability to add non-conforming items later.

```q
q)x:(1;2;3)
q)x,:`a
'type
```

but

```q
q)x:(::;1;2)
q)x,:`a  / ok
```

### [global amend](JB:QforMortals2/functions#Local_and_Global_Variables "wikilink")

When used inside a lambda expression, `::` sets a variable in the global scope if the variable is not already defined in local scope, while `:` sets a variable local to the lambda.

```q
q)a
'a
q){a:1}[]
1
q)a
'a
q){a::1}[]
q)a
1
q){a:0;a::3;a}[] / :: sets local here as a is already local
3
q)a
1
```

To set a view from inside a lambda, evaluate its code as a string:

```q
q)t:([]a:1 2;b:3 4)
q)v
'v
q){get"v::select a from t"}[]
q)v
a
-
1
2
```

### [create view](Reference/view "wikilink")

dependency::expression


, (comma)
---------

The join of two data objects `a` and `b` is denoted by `a,b`. Any two atoms or lists can be joined (concatenated). For example,

```q
q)1 2 3,4
1 2 3 4
q)1 2,3 4
1 2 3 4
q)(0;1 2.5;01b),(`a;"abc")
(0;1.00 2.50;01b;`a;"abc")
```

When two simple lists are joined, or an atom and a simple list, the result is a general list unless the types of the two operands are the same. For example,

```q
q)1 2.4 5,-7.9 10
1.00 2.40 5.00 -7.90 10.00     / both operands are simple float lists
q)1 2.4 5,-7.9
1.00 2.40 5.00 -7.90           / one is a simple float list, the other a float atom
q)1 2.4 5, -7.9 10e
(1.00;2.40;5.00;-7.90e;10.00e) / one is float, the other real.
```

As when replacing items in a simple list, there may be situations in which more latitude is required. For example, if the left argument is a simple short list then a right argument of type int, boolean or byte may also be acceptable.

```q
q)v:1 2.34 -567.1 20e
q)v,(type v)$789                / cast an int to a real
1.00 2.34 -567.1 20.00 789e
q)v,(type v)$1b                 / cast a boolean to a real
1.00 2.34 -567.1 20 1e
q)v,(type v)$0xab
1.00 2.34 -567.1 20.00 171e
```

Tables can be joined.

```q
q)t:([]a:1 2 3;b:`a`b`c)
q)s:([]a:10 11;b:`d`e)
q)show t,s
a  b
----
1  a
2  b
3  c
10 d
11 e
```

Tables can be joined sideways, i.e. each record to each record.

```q
q)r:([]c:10 20 30;d:1.2 3.4 5.6)
q)show t,'r
q)show t,'r
a b c  d
----------
1 a 10 1.2
2 b 20 3.4
3 c 30 5.6
```

_Join_ for key tables is strict; both the key and data columns must match in names and data types.


{ } (curly braces)
--------------------

The only use of curly braces `{}` is to describe a lambda – an inline q function – which can contain multiple statements. At the very start of the function, the function's parameters can be placed inside brackets `[]`; if this is not done, q will use `x`, `y`, and `z` for parameters. For more details about functions, see [Q for Mortals](JB:QforMortals2/functions "wikilink").

```q
q){[t] t*t}
{t*t}
q){[t] t*t} 5
25
q){x*x} 5
25
```



$ (dollar)
----------

### cond

Triadic `$` is _cond_, a conditional.

```q
q)$[0b;`true;`false] 
`false 
q)$[1b;`true;`false] 
`true 
```

For brevity, nested triads can be flattened: `$[q;a;$[r;b;c]]` is equivalent to `$[q;a;r;b;c]`. An example of _cond_ in a signum-like function:

```q
`q){$[x>0;1;x<0;-1;0]}'[0 3 -9]`
`0 1 -1`
```

`$[q;$[r;a;b];c]` is not the same as `$[q;r;a;b;c]`

_cond_ with many arguments can be translated to triads by repeatedly replacing the last three arguments with the triad: `$[q;a;r;b;s;c;d]` is `$[q;a;$[r;b;$[s;c;d]]]`. So _cond_ always has an odd number of arguments.

These two expressions are equivalent:

```q
q)$[0;a;r;b;c]
q)    $[r;b;c]
```

Only the first argument is guaranteed to be evaluated.

```q
q)$[1b;`true;x:`false]
`true
q)x
'x
```

See also [Basic](JB:QforMortals2/execution_control#Basic_Conditional_Evaluation "wikilink") & [Extended](JB:QforMortals2/execution_control#Extended_Conditional_Evaluation "wikilink") cond in "Q for Mortals, 2"

### x$y

The dyad has multiple uses.

#### cast

When `x` is a lower-case letter, symbol or non-negative short, `x$y` casts `y` according to `x`

Casting to integer:

```q
"i"$10
10i
q)(`int;"i";6h)$10
10 10 10i
```

…to boolean list:

```q
q)1h$1 0 2
101b
```

Find parts of time:

```q
q)`hh`uu`ss$03:55:58.11
3 55 58i
q)`year`dd`mm`hh`uu`ss$2015.10.28D03:55:58 
2015 28 10 3 55 58i
```

Identity:

```q
("*";0h)$10
10 10
```

A table of letters and types for _cast_:

```q
q)flip{(x;.Q.t x;key'[x$\:()])}5h$where" "<>20#.Q.t
1h  "b" `boolean
2h  "g" `guid
4h  "x" `byte
5h  "h" `short
6h  "i" `int
7h  "j" `long
8h  "e" `real
9h  "f" `float
10h "c" `char
11h "s" `symbol
12h "p" `timestamp
13h "m" `month
14h "d" `date
15h "z" `datetime
16h "n" `timespan
17h "u" `minute
18h "v" `second
19h "t" `time
```

#### tok

When `x` is an upper-case letter or non positive short, `x$` interprets a string as a value according to `x`. `` `$x` is shorthand for `"S"$x`.

```q
q)"S"$"hello"
`hello
q)`$"hello"
`hello
q)"E"$"3.14"
3.14e
q)-8h$"3.14"
3.14e
q)"D"$"2000-12-12"
2000.12.12
q)"U"$"12:13:14"
12:13
q)"T"$"123456789"
12:34:56.789
q)"P"$"2015-10-28D03:55:58.6542"
2015.10.28D03:55:58.654200000
q)"I"$"192.168.1.34" /an IP address as an int
-1062731486i
```

Parsing unix timestamps from seconds since unix epoch), string with 9…11 digits

```q
q)"P"$"10129708800"
2290.12.31D00:00:00.000000000
q)"P"$"00000000000"
1970.01.01D00:00:00.000000000
```

continuing with Unix timestamps, if these digits are followed by a `.` it will parse the rhs of `.` as parts of second, e.g. 

```q
q)"P"$"10129708800.123456789"
2290.12.31D00:00:00.123456789
q)"P"$"00000000000.123456789"
1970.01.01D00:00:00.123456789
```

`"D"$` will _tok_ dates with varied formats:

```q
[yy]yymmdd
ddMMM[yy]yy
yyyy/[mm|MMM]/dd
[mm|MMM]/dd/[yy]yy  / \z 0  
```

see `[`\z` `(date` `format)`](JB:QforMortals2/commands_and_system_variables#Date_Format_(-z) "wikilink")

```q
`dd/[mm|MMM]/[yy]yy  / \z 1
```

Identity

```q
q)("*";0h)$\:"2012-02-02"
"2012-02-02"
"2012-02-02"
```

A table of `x` values for _tok_

    q)flip{(neg x;upper .Q.t x;key'[x$\:()])}5h$where" "<>20#.Q.t
    -1h  "B" `boolean
    -2h  "G" `guid
    -4h  "X" `byte
    -5h  "H" `short
    -6h  "I" `int
    -7h  "J" `long
    -8h  "E" `real
    -9h  "F" `float
    -10h "C" `char
    -11h "S" `symbol
    -12h "P" `timestamp
    -13h "M" `month
    -14h "D" `date
    -15h "Z" `datetime
    -16h "N" `timespan
    -17h "U" `minute
    -18h "V" `second
    -19h "T" `time

Following characters are recognized as boolean true:

    q).Q.an where"B"$'.Q.an
    "txyTXY1"

enum
----

For a long list containing few distinct values, an enumeration can reduce storage requirements

The "manual" way to enum; this is for understanding, not the recommended way to create an enum:

    q)y:`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x:`a`b`c
    q)show e:"i"$x?y;
    0 1 2 1 0 1 2 2 2 2 2 2 2i  /these values are what we store instead of y.
    q)x e                       /get back the symbols any time from x and e.
    `a`b`c`b`a`b`c`c`c`c`c`c`c
    q)`x!e / same result as `x$y 
    `x$`a`b`c`b`a`b`c`c`c`c`c`c`c

Using built in enum:

`` q)show e:`x$y; ``
`` `x$`a`b`c`b`a`b`c`c`c`c`c`c`c ``

Values are stored as indices and so need less space.

`q)"i"$e`
`0 1 2 1 0 1 2 2 2 2 2 2 2i`

One change to a lookup value (in x) has the same effect as changing those values in the enumeration while the indices backing e are unchanged.

`` q)x[0]:`o ``
`q)e`
`` `x$`o`b`c`b`o`b`c`c`c`c`c`c`c ``
`q)"i"$e`
`0 1 2 1 0 1 2 2 2 2 2 2 2i`

To get x and y from e:

`q)(key;value)@\:e`
`` `x ``
`` `o`b`c`b`o`b`c`c`c`c`c`c`c ``

Note that when creating an enum using cast ($), the domain of the enum must already exist, otherwise a 'cast error will be thrown.

    q)y:`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x:`a`b
    q)`x$y
    'cast

to expand the domain, use ? instead of $.

    q)`x?y
    `x$`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)x
    `a`b`c

Note that ? retains the attr of the rhs but $ does not.

    q)`x?`g#y
    `g#`x$`g#`a`b`c`b`a`b`c`c`c`c`c`c`c
    q)`x$`g#y
    `x$`a`b`c`b`a`b`c`c`c`c`c`c`c

see [Q for Mortals: Enumerations](JB:QforMortals/casting_and_enumerations#Enumerations "wikilink")

pad
---

When x is a long, $ pads a string

`q)10$"foo"`
`"foo       "`
`q)-10$"foo"`
`"       foo"`

product
-------

When x and y are lists of floats

Dot product

`q)1 2 3f$4 5 6f`
`32f`

Matrix multiply

`q)(1 2 3f;4 5 6f)$(7 8f;9 10f;11 12f)`
`58  64`
`139 154`

this is the same as the [mmu](Reference/mmu "wikilink") function.

------------------------------------------------------------------------

For a complete list of functions, see the [kdb+ Function Reference](Reference "wikilink").
