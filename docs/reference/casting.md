Casting converts data from one datatype to another.

## `$` cast

Syntax: `x $ y`

Where `x` is a lower-case letter, symbol or non-negative short, returns `y` cast according to `x`. A table of `x` values for _cast_:
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
Cast to integer:
```q
q)"i"$10
10i
q)(`int;"i";6h)$10
10 10 10i
```
Cast to boolean:
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

!!! Note "Casting string to symbol"
    When converting a string to a symbol, leading and trailing blanks are automatically trimmed:
    ```q
    `$"   IBM   "
    `IBM
    ```

Identity:
```
q)("*";0h)$1
10 10
q)("*";0h)$\:"2012-02-02"
"2012-02-02"
"2012-02-02"
```
``

## `0x0\:` Integer to byte vector

Syntax: `0x0\:x`

Where `x` is an int.
```q
q)0x0\:1234605616436508552
0x1122334455667788
```

==FIXME Signals `'\:` in V3.4.==


## `!` integers to enumerated symbols

Syntax: `` `x!y``

Where `` `x`` is the name of a symbol list and `y` is a non-negative int list, returns an enumerated symbol list.
```q
q)x:`a`b`c`d
q)`x!1 2 3
`x$`b`c`d
```


## `string`

Syntax: `string x`

Returns each item in list `x` as a string; applies to all data types.
```q
q)string `ibm`goog
"ibm"
"goog"
q)string 2 7 15
,"2"
,"7"
"15"
q)string (2 3;"abc")
(,"2";,"3")
(,"a";,"b";,"c")
```
It applies to the values of a dictionary, and the columns of a table:
```q
q)string `a`b`c!2002 2004 2010
a| "2002"
b| "2004"
c| "2010"
q)string ([]a:1 2 3;b:`ibm`goog`aapl)
a    b
-----------
,"1" "ibm"
,"2" "goog"
,"3" "aapl"
```


## `sv`

Syntax: `x sv y` 

Decode – where

- (**base to integer**) `x` and `y` are numeric, `y` is evaluated to base `x`, which may be a list.
```q
q)10 sv 2 3 5 7
2357
q)100 sv 2010 3 17
20100317
```q)0 24 60 60 sv 2 3 5 7   / 2 days, 3 hours, 5 minutes, 7 seconds
183907
```

!!! note 
    when `x` is a list, the first number is not used. The calculation is done as:
    ```q
    q)baseval:{y wsum reverse prds 1,reverse 1_x}
    q)baseval[0 24 60 60;2 3 5 7]
    183907f
    ```

- (**bytes to integer**) `x` is `0x0` and `y` is a vector of **bytes** of length 2, 4 or 8, returns `y` converted to the corresponding integer.
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

- (**bits to integer**) `x` is `0b` and `y` is a boolean vector of length 8, 16, 32, or 64, returns `y` converted to the corresponding integer or — in the case of 8 bits — a byte value.
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


## `$` tok

Syntax: `x $ y`

Where `x` is an upper-case letter or non-positive short, and `y` is a string, returns `y` interpreted as a value according to `x`. 
A table of `x` values for _tok_:
```q
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
```

!!! Tip "String to symbol"
    Use `` `$y`` as shorthand for `"S"$y`.
    ```q
    q)"S"$"hello"
    `hello
    q)`$"hello"
    `hello
    ```

```q
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

!!! tip "Truthy characters"
    These characters are recognized as boolean true:
    ```q
    q).Q.an where"B"$'.Q.an
    "txyTXY1"
    ```

Parsing **Unix timestamps** (from seconds since Unix epoch), string with 9…11 digits:
```q
q)"P"$"10129708800"
2290.12.31D00:00:00.000000000
q)"P"$"00000000000"
1970.01.01D00:00:00.000000000
```
If these digits are followed by a `.` it will parse what follows `.` as parts of second, e.g. 
```q
q)"P"$"10129708800.123456789"
2290.12.31D00:00:00.123456789
q)"P"$"00000000000.123456789"
1970.01.01D00:00:00.123456789
```
`"D"$` will _tok_ **dates** with varied formats:
```
[yy]yymmdd
ddMMM[yy]yy
yyyy/[mm|MMM]/dd
[mm|MMM]/dd/[yy]yy  / \z 0  
dd/[mm|MMM]/[yy]yy  / \z 1
```

<i class="fa fa-hand-o-right"></i> [`\z` (date format)](FIXME)


## `vs`

Syntax: `x vs y` 

Encode – where: 

- `x` is `0b` and `y` is an integer, returns the **bit** representation of `y`.
```q
q)0b vs 23173h
0101101010000101b
q)0b vs 23173
00000000000000000101101010000101b
```

- `x` is `0x0` and `y` is a number, returns the **internal** representation of `y`, with each byte in hex.
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

- `x` and `y` are integer, the result is the representation of `y` in **base** `x`. (Since V3.4t 2015.12.13.)
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
If `y` is an integer vector then the result is a matrix with `count[x]` items whose `i`<sup>th</sup> column `(x vs y)[;i]` is identical to `x vs y[i]`. More generally, `y` can be any list of integers, and each item of the result is identical to `y` in structure.
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



