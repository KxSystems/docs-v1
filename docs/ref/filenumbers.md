<i class="fa fa-hand-o-right"></i> [Files (words)](filewords)

## Writing to file handles

Syntax: `h x`

Where `x` is a noun and `h` is 

- an integer file handle returned by [`hopen`](filewords/#hopen), `x` is written to the file.

```q
q)a:hopen`:file.txt
q)a "first "
q)a "word\n"
q)hclose a
```

If `h` is negative and points to an existing file, then a newline is included.

```q
q)a:hopen`:file.txt
q)neg[a] "first line"
q)neg[a] "second line"
q)hclose a
```
 
- a callback number created using a shared library, [the callback is evaluated](/interfaces/c-client-for-q/#callbacks)


## File descriptors

A file descriptor is either 

- a file symbol
- a list `(filesymbol; offset; length)` to specify that the file is to be read from `offset` (int atom) for `length` characters. 


## System file handles

### `0` (console)

File handle zero is the console process. Writing to it executes an expression in the main thread.

```q
q)0 "1 \"hello\""
hello1
q)0 (+;2;2)
4
```

Reading from it using [`read0`](filewords/#read0) permits interactive input.

```q
q)1">> ";a:read0 0
>> whatever
q)a[4+til 4]
"ever"
```


### `1` (stdout)

File handles `1` and `-1` are stdout. The difference is that `-1` appends a newline after the string, whereas `1` does not. The return value is `1` or `-1` respectively, which will print if not suppressed.

```q
q)1 "String vector here\n"
String vector here
1
q)-1 "String vector here"    / equivalent
String vector here
-1
```


### `2` (stderr)

File handles `2` and `-2` are stderr. The difference is that `-2` appends a newline after the string, whereas `2` does not. The return value is `2` or `-2` respectively, which will print (to stdout) if not suppressed.

```q
q)2 "String vector here\n"
String vector here
2
q)-2 "String vector here"    / equivalent
String vector here
-2
```


## `0:` (Text files)

### prepare-text

Syntax: `delimiter 0: t`

Where `delimiter` is a char atom and `t` is a table, returns a list of character strings containing text representations of the rows of `t` separated by `delimiter`. 

```q
q)csv 0: ([]a:1 2 3;b:`x`y`z)
"a,b"
"1,x"
"2,y"
"3,z"

q)"|" 0: (`a`b`c;1 2 3;"xyz")
"a|1|x"
"b|2|y"
"c|3|z"
```

Any cells containing `delimiter` will be embraced with `"` and any embedded `"` doubled.

```q
q)t:([]x:("foo";"bar,baz";"qu\"ux";"fred\",barney"))
q)t
x
---------------
"foo"
"bar,baz"
"qu\"ux"
"fred\",barney"
q)-1@","0:t;
x
foo
"bar,baz"
qu"ux
"fred"",barney"
```

<!--
Test to see if file _handles_ actually work in the following, all the examples are file _symbols_.
-->

### save-text

Syntax: `filehandle 0: strings`

Where `filehandle` is a file handle and `strings` a list of character strings, `strings` are saved as lines in the file. The result of _prepare-text_ can be used as `strings`.

```q
q)`:test.txt 0: enlist "text to save"
`:test.txt
q)`:status.txt 0: string system "w"
`:status.txt
```


### load-csv

Syntax: `(types;delimiter                         ) 0: y`  
Syntax: `(types;delimiter;allowEmbeddedLineReturns) 0: y`

Where `y` is a _file descriptor_, a string, or a list of strings, returns a vector or matrix interpreted from the content of `y`, where

- `types` is a list of [types](datatypes/#primitive-datatypes) in upper case,
- `delimiter` is a char atom or 1-item list,
- `allowEmbeddedLineReturns` (optional, default `0b`, since V3.4) is a boolean atom indicating whether line-returns may be embedded in strings. 

If `delimiter` is enlisted, the first row of the content of `y` is read as column names and the result is a table; otherwise the result is a list of values for each column.

```q
/load 2 columns from space-delimited file with header 
q)t:("SS";enlist" ")0:`:/tmp/txt
```

Use optional arg `allowEmbeddedLineReturns` to allow line returns embedded within strings.

```q
q)("I*";",";1)0:("0,\"ab\nc\"";"1,\"def\"")
0       1
"ab\nc" "def"
```

Where `y` is a string and `delimiter` an atom, returns a single list of the data split and parsed accordingly. 

```q
q)("DT";",")0:"20130315,185540686"
2013.03.15
18:55:40.686
```




### load-fixed

Syntax: `(types; widths) 0: y` 

Where `y` is a _file descriptor_ (see above) or a list of strings, returns a vector or matrix interpreted from the content of `y`, where 

- `types` is a list of [types](datatypes/#primitive-datatypes) in upper case
- `widths` is an int vector of field widths

```q
q)sum("DT";8 9)0:enlist"20130315185540686"
,2013.03.15D18:55:40.686000000
q)("DT";8 9)0:("20130315185540686";"20130315185540686")
2013.03.15   2013.03.15
18:55:40.686 18:55:40.686
q)dates:("Tue, 04 Jun 2013 07:00:13 +0900";"Tue, 04 Jun 2013 07:00:13 -0500")
q)sum(" Z T";5 20 1 5)0:dates
2013.06.04T16:00:13.000 2013.06.04T02:00:13.000
```

_Load-fixed_ expects either a \n after every record, or none at all.

```q
/reads a text file containing fixed-length records
q)t:("IFC D";4 8 10 6 4) 0: `:/q/Fixed.txt 
```


!!! tip "Tips for _load-csv_ and _load-fixed_"
    - To load a field as a nested character column or list rather than symbol use `"*"` as the identifier
    - To omit a field from the load use `" "`.


### key-value-pairs

Syntax: `x 0: string`

Where `x` is a 3- or 4-char string: 

(key-type field-separator [asterisk] record-separator) 

and key-type is `S` for symbol, `I` for integer, or `J` for long, returns a 2-row matrix of the keys and values. 

```q
q)"S=;"0:"one=1;two=2;three=3"
one  two  three
,"1" ,"2" ,"3"

q)"S:/"0:"one:1/two:2/three:3"
one  two  three
,"1" ,"2" ,"3"

q)"I=;"0:"1=first;2=second;3=third"
1       2        3
"first" "second" "third"

q)s:"8=FIX.4.2\0019=339\00135=D\00134=100322\00149=JM_TEST1\00152=20130425-06:46:46.387"
q)(!/)"I=\001"0:s
8 | "FIX.4.2"
9 | "339"
35| ,"D"
34| "100322"
49| "JM_TEST1"
52| "20130425-06:46:46.387"
```

The inclusion of an asterisk as the third character allows the delimiter character to appear harmlessly in quoted strings. (Since V3.5.)

```q
q)0N!"I=*,"0:"5=\"hello,world\",6=1";
(5 6i;("hello,world";,"1"))
q)0N!"J=*,"0:"5=\"hello,world\",6=1";
(5 6;("hello,world";,"1"))
q)0N!"S=*,"0:"a=\"hello,world\",b=1";
(`a`b;("hello,world";,"1"))
```

<i class="fa fa-hand-o-right"></i> 
[casting](casting), 
[datatypes](datatypes), 
[How do I import a CSV file into a table](/cookbook/faq/#how-do-i-import-a-csv-file-into-a-table)


## `1:` (Binary files)

### read-binary

Syntax: `x 1: y`

Where 

- `x` is a 2-item list of types (char vector) and widths (int vector), of which the order determines whether the data is parsed as little-endian or big-endian
- `y` is a file descriptor (see above) or string, or byte sequence

returns the content of `y` as atom, list or matrix.

```q
q)(enlist 4;enlist"i")1:0x01000000 / big endian
16777216
q)(enlist"i";enlist 4)1:0x01000000 / little endian
1
q)(enlist"f";enlist 8)1:0x7fbdc282fb210940 / pi as little endian 64bit float
3.141593
```

Read two records containing an integer, a character and a short from a byte sequence. Note the integer is read with a 4 byte width, the character with 1 byte and the short with 2 bytes. (When reading byte sequences it is helpful to recall that a byte is 2 hex digits.)

```q
q)("ich";4 1 2)1:0x00000000410000FF00000042FFFF
0 255
A B
0 -1

q)("ich";4 1 2)1:"arthur!"
1752461921
u
8562
```

With `offset` and `length`:

```q
/load 500000 records, 100000 at a time
q)d:raze{("ii";4 4)1:(`:/tmp/data;x;100000)}each 100000*til 5
```


### save-binary

Syntax: `x 1: y` 

writes bytes `y` to file `x`.

```q
`:hello 1: 0x68656c6c6f776f726c64
```


## `2:` (C shared objects)

### dynamic load

Syntax: `x 2: y`

Where `x` is a file symbol and `y` is a 2-item list: the name of a C function (symbol) and its rank (int), returns a function that calls it.

Suppose we have a C function in `cpu.so` with the prototype

```c
K q_read_cycles_of_this_cpu(K x);
```

assign it to `read_cycles`:

```q
read_cycles:`cpu 2:(`q_read_cycles_of_this_cpu;1)
```

If the shared library, as passed, does not exist, kdb+ will try to load it from `$QHOME/os`, where `os` is the operating system and architecture acronym, e.g. `l64`, `w64`, etc. If using a relative path which does not resolve to reside under `$QHOME/os`, ensure that `LD_LIBRARY_PATH` contains the required absolute search path for that library. On Windows, use `PATH` instead of `LD_LIBRARY_PATH`.

<i class="fa fa-hand-o-right"></i> 
[Interfaces/Using C/C++ functions](/interfaces/using-c-functions/)


