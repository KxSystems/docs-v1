<aside class="comment" markdown="1">
Lists **underlying functions** irrespective of whether denoted by a glyph, a reserved word, or both.
</aside>


`count`
-------

Syntax: `count x` (unary, aggregate)  

Returns the number of items in `x` (rows for a table and entries for dictionary). 
Use with `each` to count the number of elements at each level of a list or dictionary.
```q
q)count 42  / an atom has 1 item
1
q)count 1 2 3
3
q)RaggedArray:(1 2 3;4 5;6 7 8 9;0)
q)count RaggedArray
4
q)count each RaggedArray
3 2 4 1
q)RaggedDict:`a`b`c!(1 2;3 4 5;"hello")
q)count RaggedDict
3
q)count each RaggedDict
a| 2
b| 3
c| 5
q)\l sp.q
q)count sp
12
```


`cross`
-------

Syntax: `x cross y`

Returns the cross-product (i.e. all possible combinations) of `x` and `y`.
```q
q)1 2 3 cross 10 20
1 10
1 20
2 10
2 20
3 10
3 20
q)(cross/)(2 3;10;"abc")
2 10 "a"
2 10 "b"
2 10 "c"
3 10 "a"
3 10 "b"
3 10 "c"
```
`cross` can work on tables and dictionaries. 
```q
q)s:`IBM`MSFT`AAPL
q)v:1 2
q)([]s:s)cross([]v:v)
s    v
------
IBM  1
IBM  2
MSFT 1
MSFT 2
AAPL 1
AAPL 2
```


`cut`
-----

Syntax: `x cut y`

Returns `y` split according to `x`:

-  if `x` is a single integer, `cut` splits `y` into a list of items, each of count `x`, for example:
```q
q)4 cut til 10
0 1 2 3
4 5 6 7
8 9
```
-  if `x` is a non-decreasing list of integers, it cuts `y` at the indices given in `x`. The result is a list with the same count as `x`.
```q
q)2 4 9 cut til 10           / the first result item starts at index 2
2 3
4 5 6 7 8
,9
q)
q)2 4 4 9 cut til 10         / cuts are empty for duplicate indices
2 3
`int$()
4 5 6 7 8
,9
```

!!! note
    `cut` is a simple derivative of the primitive `_` (drop/cut). Where `x` is an atom, it cuts `y` into equal-sized parts; otherwise it behaves like `_`.
    ```q
    q)"abcde" _ 3                / drop element with index 3
    "abce"
    q)"abcde" cut 3              / cut works the same
    "abce"
    ```


`enlist`
--------

Syntax: `enlist x` 

Returns its argument/s in a list. Where `x` is a dictionary, the result is the corresponding table.

An atom is not a one-item list. `enlist` and `first` will convert between the two.
```q
q)a:10
q)b:enlist a
q)c:enlist b
q)type each (a;b;c)
-6 6 0h
q)a~b
0b
q)a~first b
1b
q)b~c
0b
q)b~first c
1b
```
With multiple arguments returns a single list.
```q
q)show a:enlist[til 5;`ibm`goog;"hello"]
0 1 2 3 4
`ibm`goog
"hello"
q)count a
3
```
Returns a table from a dictionary.
```q
q)enlist `a`b`c!1 3 4
a b c
-----
1 3 4
```


fill `^`
--------

Syntax: `x^y` (binary, atomic) 

Returns `y` with any nulls replaced by the corresponding item of `x`.
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
Integer `x` items are promoted when `y` is float or real.
```q
q)a:11.0 2.1 3.1 0n 4.5 0n
q)type a
9h
q)10^a
11 2.1 3.1 10 4.5 10
q)type 10^a
9h
```
When `x` and `y` are dictionaries, both null and missing values in `y` are filled with those from `x`.
```q
q)(`a`b`c!1 2 3)^`b`c!0N 30
a| 1
b| 2
c| 30
```


`fills`
-------

Syntax: `fills x` (uniform)

Returns `x` with any nulls replaced by their preceding non-null values, if any.
```q
q)fills 0N 2 3 0N 0N 7 0N
0N 2 3 3 3 7 7
```

!!! Tips
    To back-fill, reverse the list and the result:
    ```q
    q)reverse fills reverse 0N 2 3 0N 0N 7 0N
    2 2 3 7 7 7 0N
    ```
    For a similar function on infinities, first replace them with nulls:
    ```q
    q)fills {(x where x=0W):0N;x} 0N 2 3 0W 0N 7 0W
    0N 2 3 3 3 7 7
    ```


`flip`
------

Syntax: `flip x`

Returns `x` transposed, where `x` may be a list of lists, a dictionary or a table. 

In a list of lists, each list must be the same length.
```q
q)flip (1 2 3;4 5 6)
1 4
2 5
3 6
```
The flip of a dictionary is a table, and vice versa. If `x` is a dictionary where the keys are a list of symbols, and the values are lists of the same count (or atoms), then `flip x` will return a table. The flip of a table is a dictionary.
```q
q)D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100)
q)flip D
sym  price size
---------------
IBM  10.2  100
MSFT 23.45 100
q)D~flip flip D
1b
```


`raze`
------

Syntax: `raze x` (unary)

Returns the items of `x` joined, collapsing one level of nesting. 

To collapse all levels, use [converge](higher-order-functions#converge) i.e. `raze/[x]`.
```q
q)raze (1 2;3 4 5)
1 2 3 4 5
q)b:(1 2;(3 4;5 6);7;8)
q)raze b                 / flatten one level
1
2
3 4
5 6
7
8
q)raze/[b]               / flatten all levels
1 2 3 4 5 6 7 8
q)raze 42                / atom returned as a list
,42
```
Returns the flattened values from a dictionary.
```q
q)d:`q`w`e!(1 2;3 4;5 6)
q)value d
1 2
3 4
5 6
q)raze d
1 2 3 4 5 6
```

!!! warning "Use only on items that can be joined"
    `raze` is defined in k as `,/` and requires items that can be joined together. 
    ```q
    q)d:`a`b!(1 2;3 5)
    q)10,d          / cannot join integer and dictionary
    'type
    q)raze (10;d)   / raze will not work
    'type
    ```


`reverse`
---------

Syntax: `reverse x` (unary, uniform)

Returns the items of `x` in reverse order.
```q
q)reverse 1 2 3 4
4 3 2 1
q)(|)1 2 3 4
4 3 2 1
```
On atoms, returns the atom; on dictionaries, reverses the keys; and on tables, reverses the columns:
```q
q)d:`a`b!(1 2 3;"xyz")
q)reverse d
b| x y z
a| 1 2 3
q)reverse each d
a| 3 2 1
b| z y x
q)reverse flip d
a b
---
3 z
2 y
1 x
```


`rotate`
--------

Syntax: `x rotate y` (binary, uniform)

Returns list or table `y` rotated by `x` items: to the ‘left’ for positive `x`, to the ‘right’ for negative `x`.
```q
q)2 rotate 2 3 5 7 11    / rotate a list
5 7 11 2 3
q)-2 rotate 2 3 5 7 11
7 11 2 3 5
q)t:([]a:1 2 3;b:"xyz")
q)1 rotate t             / rotate a table
a b
---
2 y
3 z
1 x
```


`sv`
----

Syntax: `x sv y` (binary)

Scalar from vector: returns an atom. Where:

- (**join strings**) `y` is a list of strings, and `x` is a character or string, returns the strings in `y`, separated by `x`. Where `x` is the back tick `` ` ``, the strings are separated by the host line separator  – `\n` on Unix, `\r\n` on Windows.
```q
q)"," sv ("one";"two";"three")    / comma separated
"one,two,three"
q)"\t" sv ("one";"two";"three")   / tab separated
"one\ttwo\tthree"
q)", " sv ("one";"two";"three")   / x may be a string
"one, two, three"
q)"." sv string 192 168 1 23      / form IP address
"192.168.1.23"
q)` sv ("one";"two";"three")      / use host line separator
"one\ntwo\nthree\n"
```

- (**join path components**) `y` is a symbol list of which the first item is a file handle, it returns a file handle where the items of the list are joined, separated by slashes. This is useful when building file paths.
```q
q)` sv `:/home/kdb/q`data`2010.03.22`trade
`:/home/kdb/q/data/2010.03.22/trade
```
If the first element is not a file handle, returns a symbol where the elements are joined, separated by `.` (dot). This is useful for building filenames with a given extension:
```q
q)` sv `mywork`dat
`mywork.dat
```

- (**base conversion**) `x` and `y` are numeric, `y` is evaluated to base `x`, which may be a list.
```q
q)10 sv 2 3 5 7
2357
q)100 sv 2010 3 17
20100317
```q)0 24 60 60 sv 2 3 5 7   / 2 days, 3 hours, 5 minutes, 7 seconds
183907
```

!!! note 
    when `X` is a list, the first number is not used. The calculation is done as:
    ```q
    q)baseval:{y wsum reverse prds 1,reverse 1_x}
    q)baseval[0 24 60 60;2 3 5 7]
    183907f
    ```

- (**bytes to integer**) `x` is `0x0` and `y` is a list of bytes of length 2, 4 or 8, the result is `y` converted to the corresponding integer.
```q
q)0x0 sv "x" $0 255           / short
255h
q)0x0 sv "x" $128 255
-32513h
q)0x0 sv "x" $0 64 128 255    / int
4227327
q)0x0 sv "x" $til 8           / long
283686952306183j
q)256j sv til 8               / same calculation
283686952306183j
```

!!! tip "Converting non integers" 
    Use [`1:`](Reference/OneColon "wikilink") – eg:
    ```q
    q)show a:0x0 vs 3.1415
    0x400921cac083126f
    q)(enlist 8;enlist "f")1: a   /float
    3.1415
    ```

- (**bits to integer**) `x` is `0b` and `y` is a list of booleans of length 8, 16, 32, or 64 the result is `y` converted to the corresponding integer or — in the case of 8 bits — a byte value
```q
q)0b sv 64#1b
-1
q)0b sv 32#1b
-1i
q)0b sv 16#1b
-1h
q)0b sv 8#1b
0xff
```


`vs`
----

Syntax: `x vs y` (binary)

Vector from scalar: returns a list (vector) from each atom (scalar) in its argument, or may return a list of lists from a list.

Where: 

- (**partitioned string**) `y` is a string, and `x` is a character or string, the result is a list of strings: `y` cut using `X` as the delimiter.
```q
q)"," vs "one,two,three"
"one"
"two"
"three"
q)", " vs "spring, summer, autumn, winter"
"spring"
"summer"
"autumn"
"winter"
q)"|" vs "red|green||blue"
"red"
"green"
""
"blue"
```
If `x` is the back tick `` ` ``, then the result (a) splits symbols on `` `.` ``, (b) breaks file handles into directory and file parts, and (c) breaks a string with embedded line terminators into lines (both Unix `\n` and Windows `\r\n` terminators).
```q
q)` vs `mywork.dat                   / symbol y
`mywork`dat
q)` vs `:/home/kdb/data/mywork.dat   / file handle y
`:/home/kdb/data`mywork.dat
q)` vs "abc\ndef\nghi"               / filestring y
"abc"
"def"
"ghi"
q)` vs "abc\r\ndef\r\nghi"           / filestring y
"abc"
"def"
"ghi"
```

- (**bit representation**) `x` is `0b` and `y` is an integer, the result is the bit representation of `y`.
```q
q)0b vs 23173h
0101101010000101b
q)0b vs 23173
00000000000000000101101010000101b
```

- (**hex representation**) `x` is `0x0` and `y` is a number, the result is the internal representation of `y`, with each byte in hex.
```q
q)0x0 vs 2413h
0x096d
q)0x0 vs 2413
0x0000096d
q)0x0 vs 2413e
0x4516d000
q)0x0 vs 2413f
0x40a2da0000000000
q)"."sv string"h"$0x0 vs .z.a / ip address string from .z.a
"192.168.1.213"
```

- (**base representation**) `x` and `y` are integer, the result is the representation of `y` in base `x`. (Since V3.4t 2015.12.13.)
```q
q)10 vs 1995
1 9 9 5
q)2 vs 9
1 0 0 1
q)24 60 60 vs 3805
1 3 25
q)"." sv string 256 vs .z.a / ip address string from .z.a
"192.168.1.213"
```
If the right argument is an integer list then the result is a matrix with `count[x]` items whose ith column `(x vs y)[;i]` is identical to `x vs y[i]`. More generally, `y` can be any list of integers, and each item of the result is identical to `y` in structure.
```q
q)a:10 vs 1995 1996 1997
q)a
1 1 1
9 9 9
9 9 9
5 6 7
q)a[;0]
1 9 9 5
q)10 vs(1995;1996 1997)
1 1 1
9 9 9
9 9 9
5 6 7
```



