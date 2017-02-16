Syntax
======

<aside markdown="1" class="comment kx-developer">
- Define the terms in which the elements of q are discussed
- Enable the reader to parse any q expression

Although this article is not a tutorial, it everywhere tries to introduce terms before using them. 
</aside>

> It is a privilege to learn a language,  
> a journey into the immediate  
> — _Marilyn Hacker_, “Learning Distances”


Comments
--------

### Line comment

The parser ignores any line that begins with a `/` (slash).
```q
q)/ Oh what a lovely day
```

### Trailing comment

The parser ignores anything to the right of ` /` (space slash).
```q
q)2+2  / I know this one
4
```

### Multiline comment

As first and only non-whitespace char on a line:

- `/` starts a multiline comment
- `\` terminates a multiline comment or, if not in a comment, comments to end of script
```q
/
    Oh what a beautiful morning
    Oh what a wonderful day
\
a:42
\
goodbye to all that
après moi the restroom at the end of the universe
```


Datatypes
---------

Data are symbols, characters, or of the several datetime or numeric [datatypes](datatypes). 
```q
q)42          / a number
42
q)42%6        / a float
7f
q)2=3         / a lie
0b
q)2001.09.11  / a bad day
2001.09.11
q)"y"         / a character
"y"
q)`ibm        / a symbol
`ibm
```

!!! note "Strings"
    There is no _string_ datatype. The nearest equivalent to a string is a symbol or a char list. A reference to a _string_ should be understood as referring to a char list.

The `$` operator [casts](datatypes/#casting) between datatypes. Filepaths are a special form of symbol. 
```q
q)count read0 `:path/to/myfile.txt  / count lines in myfile.txt
```


Names
-----

Values may be given names, using single or double colons. The double colon binds the value to a name in the session root; the single colon binds the name in the local context. In a session with no evaluation suspended their effects are the same.
```q
q)foo:42
q)foo
42
q)foo::103
q)foo
103
```


Data structures
---------------

### Atoms and lists

An _atom_ is a single number, character, boolean, symbol, timestamp… a single instance of any [datatype](datatypes). 

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
A _vector_ is a _simple list_: all its items are of the same dataype. For a vector, parentheses and semicolons may be omitted. 
```q
q)42 43 44 45~(42;43;44;45)    / simple 4-lists
1b
q)("a";"b";"c")~"abc"          / char vectors
1b
q)3<til 10                     / boolean vector
0000111111b
```
A list item may be any data structure.
```q
q)count("abc";0000111111b;42)  / list of 2 vectors and an atom
3
```


### Dictionaries and tables

A _dictionary_ is a map from a list of keys to a list of values. (The keys should be unique, though q does not enforce this.) The values of a dictionary can be any data structure. 
```q
q)/ 4 keys and 4 atomic values
q)`bob`carol`ted`alice!42 39 51 44   
bob  | 42
carol| 39
ted  | 51
alice| 44
q)/ 2 keys and 2 list values
q)show kids:`names`ages!(`bob`carol`ted`alice;42 39 51 44)
names| bob carol ted alice
ages | 42  39    51  44
```
A dictionary can be indexed by its keys, with or without brackets. 
```q
q)kids[`ages]
42 39 51 44
q)kids `names
`bob`carol`ted`alice
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
q)/ a flipped dictionary is a table
q)tkids~([]names:`bob`carol`ted`alice; ages:42 39 51 44)
1b
```
An unkeyed table can be indexed by its column names or its record numbers.
```q
q)tkids `names
`bob`carol`ted`alice
q)tkids 0 2
names ages
----------
bob   42
ted   51
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


Functions
---------

Q primitives are applied [infix](https://en.wikipedia.org/wiki/Infix_notation), [prefix](https://en.wikipedia.org/wiki/Polish_notation) and [postfix](https://en.wikipedia.org/wiki/Reverse_Polish_notation).
```q
q)2+3               / infix
5
q)reverse 2 3       / prefix
3 2
q)total:+/          / postfix
q)total 2 3 4
9
```
Functions are applied prefix. 
```q
q){x*x}[1 4 3]      / one (vector) argument 
1 16 9
q){x+y}[2;3]        / two (atom) arguments
5
```
See also the use of `.` and `@` for [applying functions](FIXME).

!!! important "Infix is optional"
    Wherever a function can be used infix, it may alternatively be used prefix.
    ```q
    q)2+3
    5
    q)+[2;3]
    5
    ```
    Only [operators](operators) and (some) [derived functions](adverbs/#derivatives) can be used infix. 

The number of arguments to a function is its _rank_. Functions with rank 1 or 2 are known respectively as _unary_ or _binary_.
```q
q){x*x}[2 3 4]      / unary
4 9 16
q){x*y}[2;3 4]      / binary
6 8
q){x*y+z}[2;3;4 5]  / rank 3
14 16
```
Functions can be defined within curly braces. This is the _lambda notation_ and functions so defined are known as _lambdas_. They may be assigned names. A lambda definition begins by listing the local names of the arguments (up to eight) and continues with a list of one or more expressions. For unary, binary and rank-3 functions, argument names may be omitted and the default names `x`, `y` and `z` used instead.
```q
q){[a;b](a*a)+(b*b)+2*a*b}[20;4]  / argument names specified
576
q){(x*x)+(y*y)+2*x*y}[20;4]       / default argument names
576
q)bsquare:{(x*x)+(y*y)+2*x*y}
q)bsquare[20;4]
576
```
There is no way to use this notation to define an operator: all lambdas are used prefix.


Juxtaposition
-------------

A list can be considered as a function of its indexes. So indexing a list and applying a function to its arguments use the same syntax.
```q
q)0 1 4 9 16 25 36[1 4 3]  / index a list
1 16 9
q){x*x}[1 4 3]             / apply function to argument
1 16 9
```
Juxtaposition is indexing for lists; application for a unary function and its argument: brackets may be omitted.
```q
q)"abcde"1 4 3      / list
"bed"
q){x*x}1 4 3        / unary function
1 16 9
```



Operators
---------

Operators are binary functions which can also be applied infix. 
```q
q)|[2;3]                / binary function
3
q)2|3                   / infix
3
q)rotate[2;2 3 4 5 6]   / binary function
4 5 6 2 3
q)2 rotate 2 3 4 5 6    / infix
4 5 6 2 3
```



Adverbs
-------

_Higher-order functions_ are functions that return functions as results. 

The primitive higher-order functions are applied postfix and are known as [_adverbs_](adverbs). ([_Compose_](adverbs/#compose) is the single exception).

The function returned by an adverb is _ambivalent_ – its rank is not fixed. Where it has a binary form, it may be applied infix. Parentheses fix the unary form. 
```q
q)+/[2 3 4]          / unary function
9
q)+/[10;2 3 4]       / binary
19
q)+/[10;2 3 4;1000]  / no rank-3 form
'rank'
q)10+/2 3 4          / binary, infix
19
q)(+/)2 3 4          / unary
```


Parenthesesing functions
------------------------

Functions may be passed as arguments to other functions. Parentheses allow a function to be _referred to_ instead of being _applied_.
```q
q)(+) over 2 3 4
```
Parenthesesing a function is not required for assignment. It also allows immediate application by juxtaposition.
```q
q)total:+/      / assignment
q)total 2 3 4
9
q)+/[2 3 4]     / application by brackets
9
q)(+/)2 3 4     / application by juxtaposition
9
```


Q-SQL
-----

Expressions beginning with `insert`, `select` or `update` employ [q-SQL syntax](FIXME). 


Control words
-------------

The _control words_ govern execution. They are FIXME `do`, `if`, `while`


System commands
---------------

Expressions beginning with `\` are system commands, e.g.
```q
q)/ load the script in file my_app.q
q)\l my_app.q
```


Scripts
-------

A script is a text file; its lines a list of expressions and/or commands to be executed in sequence. By convention, script files have the extension `q`.

Within a script 

- function definitions may extend over multiple lines
- an empty comment begins a _multiline comment_. 


Namespaces
----------

> What in the world is a namespace? — Kenneth E. Iverson

A [namespace](https://en.wikipedia.org/wiki/Namespace) is a container or context within which a name resolves to a unique value. Namespaces are children of the _root namespace_ (usually just _root_) and are designated by a dot prefix. The root namespace of a q session is parent to multiple namespaces, e.g. `h`, `Q` and `z`. Namespaces with 1-character names (of either case) are reserved for use by Kx. 
```q
q).z.p                         / GMT timestamp
2017.02.01D14:58:38.579614000
```

