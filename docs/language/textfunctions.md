Text functions
==============

csv
---

Syntax: `csv`

Constant, equivalent to `","` useful in reading CSV files and preparing text for them.
```q
q)csv~","
1b
```
See [`0:`](language/zerocolon).


like
----

Syntax: `x like y`

Match text/s `x` to pattern in string `y`. Where `x` is

-   a symbol atom or list
-   a string or list of strings
-   a dictionary whose `value` is a symbol list, or list of strings

The result is a boolean list indicating which items in `x` match the pattern `y`.

In pattern `y` certain characters have special meaning:

- `?` matches any character
- `*` matches any sequence of characters
- `[]` embraces a list of alternatives, any of which matches
- `^` at the beginning of a list of alternatives indicates characters that are _not_ to be matched

Special characters can be matched by bracketing them.

See also [Regular expressions](/cookbook/regex)


lower
-----

Syntax: `lower x`

Returns symbol or string `x` with any bicameral characters in the lower case. 
```q
q)lower"IBM"
"ibm"
q)lower`IBM
`ibm
```


ltrim
-----

Syntax: `ltrim x`

Left trim: returns string `x` with any leading space/s removed.
```q
q)ltrim"   IBM   "
"IBM   "
```


md5
---

Syntax `md5 x`

Returns the MD5 (Message-Digest algorithm 5) of string `x`. 

MD5 is a widely used, Internet standard (RFC 1321), hash function that computes a 128-bit hash, commonly used to check the integrity of files. It is not recommended for serious cryptographic protection, for which strong hashes should be used.
```q
q)md5 "this is a not so secret message"
0x6cf192c1938b79012c323fa30e62787e
```


rtrim
-----

Syntax: `rtrim x`

Right trim: returns string `x` with any trailing space/s removed. 
```q
q)rtrim"   IBM   "
"   IBM"
```


ss
--

Syntax: `x ss y`

String search: returns position/s of substring `y` within string `x`.
```q
q)"We the people of the United States" ss "the"
3 17
```
It also supports some of the pattern-matching capabilities of `like`.
```q
q)s:"toronto ontario"
q)s ss "ont"
3 8
q)s ss "[ir]o"
2 13
q)s ss "t?r"
0 10
```
See also [Regular expressions](/cookbook/regex)


ssr
---

Syntax: `ssr[x;y;z]`

String search (using `ss`) and replace: where

- `x` is a string
- `y` is a pattern
- `z` is a string or a function

returns `x` with each substring matching `y` replaced by:

- `z` if `z` is a string 
- `z[Y]` where `z` is a function and `Y` is the matched substring
```q
q)s:"toronto ontario"
q)ssr[s;"ont";"x"]      / replace "ont" by "x"
"torxo xario"
q)ssr[s;"t?r";upper]    / replace matches by their uppercase
"TORonto onTARio"
```
See also [Regular expressions](/cookbook/regex)


string
------

Syntax: `string x`

Casts each atom in `x` to a string, i.e. char list. It applies to all data types.
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


trim
----

Syntax: `trim x`

Returns string `x` with any leading or trailing spaces removed.
```q
q)trim"   IBM   "
"IBM"
```

!!! Note "Casting string to symbol"
    When converting a string to a symbol, leading and trailing blanks are automatically trimmed:
    ```q
    `$"   IBM   "
    `IBM
    ```

upper
-----

Syntax: `upper x`

Returns symbol or string `x` with any bicameral characters in the upper case. 
```q
q)upper"ibm"
"IBM"
q)upper`ibm
`IBM
```


