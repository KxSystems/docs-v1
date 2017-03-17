## `like`

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

<i class="fa fa-hand-o-right"></i> [Regular expressions](/cookbook/regex)


## `lower`

Syntax: `lower x`

Returns symbol or string `x` with any bicameral characters in the lower case. 
```q
q)lower"IBM"
"ibm"
q)lower`IBM
`ibm
```


## `ltrim`

Syntax: `ltrim x`

Left trim: returns string `x` with any leading space/s removed.
```q
q)ltrim"   IBM   "
"IBM   "
```


## `md5`

Syntax `md5 x`

Returns the MD5 (Message-Digest algorithm 5) of string `x`. 

MD5 is a widely used, Internet standard (RFC 1321), hash function that computes a 128-bit hash, commonly used to check the integrity of files. It is not recommended for serious cryptographic protection, for which strong hashes should be used.
```q
q)md5 "this is a not so secret message"
0x6cf192c1938b79012c323fa30e62787e
```


## `$` – pad

Syntax: `x $ y`

Where `x` is a long, and `y` a string, returns `y` padded to length `x`.
```q
q)10$"foo"
"foo       "
q)-10$"foo"
"       foo"
```


## `rtrim`

Syntax: `rtrim x`

Right trim: returns string `x` with any trailing space/s removed. 
```q
q)rtrim"   IBM   "
"   IBM"
```


## `ss`

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
<i class="fa fa-hand-o-right"></i> [Regular expressions](/cookbook/regex)


## `ssr`

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
<i class="fa fa-hand-o-right"></i> [Regular expressions](/cookbook/regex)


## `trim`

Syntax: `trim x`

Returns string `x` with any leading or trailing spaces removed.
```q
q)trim"   IBM   "
"IBM"
```
<i class="fa fa-hand-o-right"></i> [_drop_](lists/#_-drop)

## `upper`

Syntax: `upper x`

Returns symbol or string `x` with any bicameral characters in the upper case. 
```q
q)upper"ibm"
"IBM"
q)upper`ibm
`IBM
```


<i class="fa fa-hand-o-right"></i> 