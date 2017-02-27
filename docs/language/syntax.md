> It is a privilege to learn a language,  
> a journey into the immediate  
> — _Marilyn Hacker_, “Learning Distances”


## Comments

Line comment
: The parser ignores any line that begins with a `/` (slash).  
`q)/Oh what a lovely day`

Trailing comment
: The parser ignores anything to the right of ` /` (space slash).  
`q)2+2  /I know this one`

Multiline comment
: As first and only non-whitespace char on a line:  
* `/` starts a multiline comment  
* `\` terminates a multiline comment or, if not in a comment, comments to end of script  
```q
/
    Oh what a beautiful morning
    Oh what a wonderful day
\
a:42
\
goodbye to all that
the restroom at the end of the universe
```


## Naming

Values may be named, using single or double colons. The double colon binds the value to a name in the session root; the single colon binds the name in the local context. In a session with no evaluation suspended their effects are the same.
```q
q)foo:42
q)foo
42
q)foo::103
q)foo
103
```


## Noun syntax

### Atoms 

An _atom_ is a single number, character, boolean, symbol, timestamp… a single instance of any [datatype](datatypes). 


### Lists

A _list_ is enclosed in parentheses, its items – if any – separated by semicolons. 
```q
q)count(42;`ibm;2012.08.17)    / list of 3 items
3
```
A list may have 0, 1 or more items. 
```q
q)count()              / empty list
0
q)count enlist 42      / 1-list
1
q)count(42;43;44;45)   / 4-list
4
```
A list with 1 item is not an atom. The `enlist` function makes a 1-list from an atom.
```q
q)42~enlist 42
0b
```
A list item may be a noun, function or adverb.
```q
q)count("abc";0000111111b;42)  / 2 vectors and an atom
3
q)count(+;rotate;/)            / 2 operators and an adverb
3
```

!!! note "Functions and adverbs in lists"
    Functions and adverbs in lists are treated as nouns, but juxtaposition becomes application, not indexing.
    ```q
    q)(count;+/;/)1          /indexing
    +/
    q)(count;+/;/)[1] 2 3 4  /application
    9
    ```


### Vectors

A _vector_ is a _simple list_: all its items are of the same dataype. In writing a vector, parentheses and semicolons may be omitted. Char vectors are also known as _strings_.
```q
q)42 43 44 45~(42;43;44;45)    / simple 4-lists
1b
q)("a";"b";"c")~"abc"          / char vectors
1b
q)3<til 10                     / boolean vector
0000111111b
```

!!! note "Escape characters in strings"
    When `\` is used inside character or string displays, it serves as an escape character.
    
    |       |                                           |
    |-------|-------------------------------------------|
    | \\"   | double quote                              |
    | \\NNN | character with octal value NNN (3 digits) |
    | \\\\  | backslash                                 |
    | \\n   | new line                                  |
    | \\r   | carriage return                           |
    | \\t   | horizontal tab                            |



### Dictionaries and tables

A _dictionary_ is a map from a list of keys to a list of values. (The keys should be unique, though q does not enforce this.) The values of a dictionary can be any data structure. 
```q
q)/4 keys and 4 atomic values
q)`bob`carol`ted`alice!42 39 51 44   
bob  | 42
carol| 39
ted  | 51
alice| 44
q)/2 keys and 2 list values
q)show kids:`names`ages!(`bob`carol`ted`alice;42 39 51 44)
names| bob carol ted alice
ages | 42  39    51  44
```
A dictionary in which the values are all lists of the same count can be flipped into a table. Or the table specified directly using _table syntax_, e.g.
```q
q)count each kids
names| 4
ages | 4
q)tkids:flip kids  / flipped dictionary
names ages
----------
bob   42
carol 39
ted   51
alice 44
q)/a flipped dictionary is a table
q)tkids~([]names:`bob`carol`ted`alice; ages:42 39 51 44)
1b
```
Table syntax can declare one or more columns of a table as a _key_. The values of the key column/s of a table are unique. 
```q
q)([names:`bob`carol`bob`alice;city:`NYC`CHI`SFO`SFO]; ages:42 39 51 44)
names city| ages
----------| ----
bob   NYC | 42
carol CHI | 39
bob   SFO | 51
alice SFO | 44
```

### Indexing

Lists, dictionaries and unkeyed tables can be indexed; keyed tables cannot. 
```q
q)l:"abcdef" /list
q)d:`first`family`date!`John`Doe`1987.09.15 /dict
q)t:([]name:`Bob`Ted`Carol;city:`SFO`LAX`SEA;age:42 43 45) /unkeyed table
q)l[1 4 0 3]      /list indexes
"bead"
q)d[`date`first]  /dict keys
1987.09.15
`John
q)t[`age`city]    /table columns
42  43  45
SFO LAX SEA
q)t[2 0]          /table rows
name  city age
--------------
Carol SEA  45
Bob   SFO  42
```


### Juxtaposing nouns

In noun syntax, juxtaposition is indexing.
```q
q)l 1 4 0 3      /list indexes
"bead"
q)d`date`first   /dict keys
1987.09.15
`John
q)t`age`city     /table columns
42  43  45
SFO LAX SEA
q)t 2 0          /table rows
name  city age
--------------
Carol SEA  45
Bob   SFO  42
```


## Function syntax

### Application

A list can be considered a function of its indexes. Applying a function to its arguments uses the same notation as indexing a list.
```q
q)0 1 4 9 16 25 36[1 4 3]  / noun syntax
1 16 9
q){x*x}[1 4 3]             / function syntax
1 16 9
```
<i class="fa fa-hand-o-right"></i> `.` and `@` for [applying functions](FIXME).


### Prefix 

All functions can be applied prefix. 
```q
q)til[5]            / one (atom) argument
0 1 2 3 4
q)count[1 4 3]      / one (vector) argument 
1 16 9
q)+[2;3 4]          / two arguments
5 6
q){x+y+2*z}[2;3;4]  / three (atom) arguments
13
```
<i class="fa fa-hand-o-right"></i> [lambda notation](functions/#lambda-notation)


### Infix

[Operators](operartors) and some [derivatives](adverbs/#derivatives) can also be applied infix. 
```q
q)2|3                 /operator
3
q)2 rotate 2 3 4 5 6  /operator
4 5 6 2 3
q)2+/2 3 4 5 6        /derivative
22
```


!!! note "Infix is always optional"
    ```q
    q)|[2;3]
    3
    q)rotate[2; 2 3 4 5 6]
    4 5 6 2 3
    q)+/[2;2 3 4 5 6]
    22
    ```


### Juxtaposing functions

In function syntax, juxtaposition is application.
```q
q)"abcde"1 4 3      / noun syntax (indexing)
"bed"
q){x*x}1 4 3        / function syntax (application)
1 16 9
```


### Projection

A function applied to more arguments than its rank signals a rank error. 
A function applied to fewer arguments than its rank returns a _projection_. A projection fixes the value/s of the specified argument/s: the projection is a function only of its _unspecified_ argument/s.
```q
q)foo:{x+y+2*z}
q)bar:foo[;;1000]  /bar is a projection of foo on z:1000
q)bar[2;3]
2005
```
Where `f` is a function of rank $N$, and `g` is a projection of `f` on $m$ arguments (where $N \gt m$) `g` has rank $N-m$.


## Adverbs

[Adverbs](adverbs) are primitive higher-order functions that return derived functions (_derivatives_). Unary adverbs are applied postfix. 
```q
q)double:2*
q)double/[3;2 3 4] /iterate: apply double 3 times
16 24 32
```
Binary derivatives can be applied infix.
```q
q)3 double/2 3 4
16 24 32
```
Some binary derivatives are [_ambivalent_](adverbs/#ambivalent-functions): applied to a single argument, instead of projecting the function, a default `x` is assumed. 
```q
q)+/[0;2 3 4]
9
q)+/[2 3 4]          /not a projection
9
q)foo:+/[;2 3 4]     /projection
q)foo 10
19
q)+/[10;2 3 4]
19
q)tot:+/             /assignment preserves ambivalence
q)tot[2 3 4]         /unary application
9
q)tot[10;2 3 4]      /binary application
19
```
<aside class="comment kx-developer" markdown="1">
This seems to refute the identity-element account of ambivalence: `(double/)2 3 4` evaluates to `0N 0N 0N` and not `2 3 4`. :-(
</aside>

## Q-SQL

Expressions beginning with `insert`, `select` or `update` employ [q-SQL syntax](FIXME). 


## Control words

The _control words_ govern execution. They are FIXME `do`, `if`, `while`


## K syntax

!!! warning "K is deprecated"
    Q is a domain-specific language for finance embedded in the k programming language. Many reserved words in q expose definitions in k. 
    ```q
    q)show rotate
    k){$[0h>@y;'`rank;98h<@y;'`type;#y;,/|(0;mod[x;#y])_y;y]}[k){1 .Q.s x;}]
    ```
    Because of this, there are k expressions that work in the q interpreter, but which are not defined as part of the q language. 
    
    Although q provides a toggle for switching in and out of k, k is currently undocumented and its use in q scripts is deprecated and unsupported.
    
    If you find a k expression in a q script, you should be able to replace it with a q expression.
    ```q
    q)(-)1 2 3       /k - deprecated
    -1 -2 -3
    q)neg 1 2 3      /q equivalent
    -1 -2 -3
    q)(|)1 2 3       /k - deprecated
    3 2 1
    q)reverse 1 2 3  /q equivalent
    3 2 1
    ```