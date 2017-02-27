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

Identity:
```q
q)("*";0h)$\:"2012-02-02"
"2012-02-02"
"2012-02-02"
```
